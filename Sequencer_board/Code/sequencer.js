/*
    EPROMINT CPU microcode written by MINT: https://www.youtube.com/@__MINT_
    Use provided memory map generator software to compile it, one 64KB and three 32KB EPROMs are needed.
    Whole instruction set is modular and can be easily modified. There are complete templates for each
    instruction that can be customized and simply inserted into the instruction set.
    Of course EPROMINT CPU hardware is needed to make use of this rather large piece of code.
    Check provided schematics and documentation for details.
    
    This software comes with absolutely no warranty!
*/

A[15:0];
D[7:0] = 0;

const EPROM_A = 0;  // 64 KB
const EPROM_B = 1;  // 32 KB
const EPROM_C = 2;  // 32 KB
const EPROM_D = 3;  // 32 KB

const EPROM_select = EPROM_A;  // EPROM for which the code is compliled


const READ_TARGETS = {
    "NONE": 0,
    "A": 1,
    "B": 2,
    "C": 3,
    "D": 4,
    "F": 5,
    "MEM": 6,
    "ALU_L": 7,
    "ALU_H": 8,
    "ADDR_L": 9,
    "ADDR_H": 10,
    "INT_EN": 11,
    "INT_DIS": 12,
    "BUS_DRIVE": 13
};

const WRITE_TARGETS = {
    "NONE": 0,
    "PC": 1,
    "SP": 2,
    "DP": 3,
    "A": 1,
    "B": 2,
    "C": 3,
    "D": 4,
    "F": 5,
    "MEM": 6,
    "ADDR_L": 7,
    "ADDR_H": 8,
    "A_STORE": 9,
    "B_STORE": 10,
    "F_STORE": 11,
    "ADDR_STORE": 12,
    "INT_LATCH": 13,
    "IE_LATCH": 14,
    "IR": 15
};

const FLAG_SOURCES = {
    "ALU": 0,
    "BUS": 1
};

const ADDRESS_SOURCES = {
    "DIR": 0,
    "PC": 1,
    "SP": 2,
    "DP": 3
};

const ADDRESS_ALU_OPERS = {
    "INC": 0,
    "DEC": 1,
    "ADD": 2,
    "LOAD": 3
};

const MAIN_ALU_OPERS = {
    "ADD": 0,
    "SUB": 1,
    "MUL": 2,
    "DIV": 3,
    "AND": 4,
    "OR": 5,
    "XOR": 6,
    "EXT": 7
};

const FLAGS = {
    "C": 0,
    "OV": 1,
    "Z": 2,
    "NEG": 3,
    "POS": 4,
    "A_EQ_B": 5,
    "A_LT_B": 6,
    "A_GT_B": 7
};


let data_read = 0;
let data_write = 0;

let address_out = 0;
let address_write = 0;

let address_operation = 0;
let alu_operation = 0;
let with_carry = false;
let flag_select = 0;
let flags_source = 0;
let interrupt_ack = 1;
let software_reset = 1;
let bus_value = 0;

function read(data_src) {data_read = READ_TARGETS[data_src];}
function write(data_dest) {data_write = WRITE_TARGETS[data_dest];}
function set_address(addr_src) {address_out = ADDRESS_SOURCES[addr_src];}
function write_address(addr_dest) {address_write = WRITE_TARGETS[addr_dest];}
function addr_oper(oper_type) {address_operation = ADDRESS_ALU_OPERS[oper_type];}
function alu_oper(oper_type) {alu_operation = MAIN_ALU_OPERS[oper_type];}
function drive_bus(bus_data) {bus_value = bus_data; data_read = READ_TARGETS["BUS_DRIVE"];}
function flag_sel(selected) {flag_select = FLAGS[selected];}
function flags_src(source) {flags_source = FLAG_SOURCES[source];}
function oper_carry(include_carry) {with_carry = include_carry;}
function set_ack(val) {interrupt_ack = !val;}
function set_reset(val) {software_reset = !val;}
function set_interrupts(enable) {data_read = enable ? READ_TARGETS["INT_EN"] : READ_TARGETS["INT_DIS"];}
function update_read_val(reg) {if(reg == "A" || reg == "B" || reg == "F") write(reg + "_STORE");};

read("NONE");
write("NONE");
set_address("PC");
write_address("NONE");
addr_oper("INC");
alu_oper("ADD");
flag_sel("C");
flags_src("ALU");
oper_carry(false);
set_reset(false);
set_ack(false);
set_interrupts(false);


const RESET_INIT = 0;
const RESET_EXEC = 1;
const FETCH_START = 2;
const LATCH_IR = 3;
const EXEC_START = 4;


const state = A[4:0];
const wait = (EPROM_select == EPROM_A) ? !A[15] : 0;
const interrupt = A[5];
const flag = A[6];
const instruction = A[10, 11, 9, 8, 7, 13, 12, 14];

let next = RESET_INIT;  // if next state is not specified later, reset the CPU to prevent infinite loop

/* 
    The state machine code for instruction execution uses a concept that when a register is written (its clk line goes high), new data gets put onto
    the bus right after the write. This way, write cycle is only one clock cycle long. However, this can cause timing problems when not handled carefully.
    If read lines are updated a bit faster than write lines, bus data can change too early resulting in written register corruption. For 8-bit register
    group this shouldn't be a problem, since they are driven by 74HC138 (read select) and 74HCT238 (write select), so the read lines change at the same
    time as write lines, and due to propagation delay from #OE to register output and some data bus capacitance, data will get written right before data
    bus value changes. Write line for memory goes via 74AC14 inverter, but memory is slower that registers, so that extra few nanoseconds before the write
    during which data bus might start to change shouldn't cause any problems. The situation is different for 16-bit register group: read lines go via
    74HC139, but the write lines go via 74HC139 AND 74AC14. 14 lower register input bits are taken from address ALU, which is parallel memories, so even
    when address bus value starts to change before the write pulse, those memories will show correct data at their outputs. 2 upper bits go via 74HCT153 mux,
    which is a bit slower than 74AC14, so data should get captured right before the mux puts out new data corresponding to new address bus value. The real
    problem lies in address ALU operation select lines. They go directly from state machine output latch, without any 74HC139 in-between. So the opcode
    starts to change at the same time as the 74HCT139 select lines, while there is 74AC14 between 74HCT139 and register write lines. 74HCT139 starts to
    change its outputs at the same time as 74HCT153 starts to do so, and before write signals go through 74AC14, 2 upper bits at register inputs become
    invalid. This is true only for transition from address ALU INC, DEC or ADD opcode to LOAD opcode, since only for LOAD the mux is used. Opcode select
    lines had to be delayed to allow for write pulses to arrive while there is still correct data at register inputs. Example code in which the problem
    showed up is written below:
    
    one state before there was: read("MEM"); set_address("PC"); addr_oper("INC"); write_address("PC");
    case EXEC_START + 0: set_address("PC"); addr_oper("INC"); write("ADDR_L"); write_address("PC"); break;  // write ADDR_L, increment PC
    case EXEC_START + 1: set_address("PC"); addr_oper("LOAD"); write("ADDR_H"); write_address("PC"); break; // write ADDR_H, increment PC
    
    The bug hides in the above line. Operation is switched to LOAD to allow for the opcode and data to stabilize before next step gets
    executed, and at the same time, PC is written with data corresponding to INC opcode that was selected in the previous steps. But the
    new opcode propagates much faster than the write pulse, and 2 upper bits change to values corresponding to LOAD opcode before write
    pulse arrives and data for INC gets written. 14 lower bits stay correct since they come from memories that are relatively slow, and
    that opcode change before the write starts to affect memory outputs after the write pulse arrives. BUT this is not true for all
    memories. With M27C512-10 output data was changing before the write, with -15 version the was no such problem. After adding delay
    to opcode lines it should also work with the -10 version.
    
    case EXEC_START + 2: set_address(dest_reg); addr_oper("LOAD"); write_address(dest_reg); next = FETCH_START; break;  // write new value
    
    Correct code example:
    case EXEC_START + 0: read("A"); write(something for what the data was correct before this cycle);  // put data from A onto the bus
    case EXEC_START + 1: read("C"); write("B"); // data from A gets written to B and data from C is getting put onto the bus at the same time
    case EXEC_START + 2: read("ADDR_L"); write("D");  // data from C gets written to D and data from ADDR_L is getting put onto the bus at the same time
    ...
    Remember that '138 and '238 must have the same speed grade for the above code to work. The same has to be true for state machine output latches.
    Majority of the code is written in this read-right-after-write manner, so if something doesn't work, it's most likely the timing problem.
    
    
    A few more important notes:
    - when using bus_drive(): flag_select, with_carry, alu_operation and flags_source get overwritten. Register update with ALU result after
    ALU operation cannot be done if bus_drive() was used in a previous state, even the flags cannot be updated.
    - set_interrupts() overwrites the read select line, so when used, no read() is allowed in the same state. The exeption is when using
    set_interrupts(false), which is equivalent to any read() that is not read("INT_EN"), which is essentialy what set_interrupts(true) does.
    - update_read_val() overwrites the write select line, so when used, no write() is allowed in the same state.
*/

switch(state) {
    case RESET_INIT: set_reset(true); addr_oper("LOAD"); set_address("PC"); drive_bus(0xFF); next = RESET_EXEC; break;
    case RESET_EXEC: addr_oper("LOAD"); set_address("PC"); write_address("PC"); drive_bus(0xFF); write("IR"); next = EXEC_START; break;  // CPU feeds itself with reset instruction
    case FETCH_START: addr_oper("INC"); set_address("PC"); read("MEM"); write("INT_LATCH"); next = LATCH_IR; break;
    case LATCH_IR:
        if(!interrupt) {  // load instruction into IR and increment PC, but only if no interrupt occurred
            addr_oper("INC"); set_address("PC"); read("MEM"); write("IR"); write_address("PC"); alu_oper("ADD"); oper_carry(false); flags_src("ALU"); next = EXEC_START;
        }
        // interrupt behaviour is defined in switch/case below
    break;
}

if(interrupt) {  // override certain behaviours defined above in case of an interrupt
    next = state + 1;
    switch(state) {
        // overrides LATCH_IR case above
        case LATCH_IR + 0: set_ack(true); drive_bus(0); write("ADDR_STORE"); set_address("PC"); addr_oper("DEC"); break;  // capture PC, send 1st INTA pulse
        case LATCH_IR + 1: set_ack(false); read("ADDR_H"); write("ADDR_H"); set_address("SP"); addr_oper("DEC"); break;  // end 1st pulse, clear ADDR_H, switch to SP
        case LATCH_IR + 2: read("ADDR_H"); write("MEM"); set_address("SP"); addr_oper("DEC"); write_address("SP"); break;  // decrement SP, push PC high
        case LATCH_IR + 3: read("ADDR_L"); set_address("SP"); addr_oper("DEC"); break; // end memory write
        case LATCH_IR + 4: read("ADDR_L"); write("MEM"); set_address("SP"); addr_oper("DEC"); write_address("SP"); break;  // decrement SP, push PC low
        case LATCH_IR + 5: set_ack(true); set_address("PC"); addr_oper("LOAD"); break;  // 2nd INTA pulse, controller outputs interrupt vector
        case LATCH_IR + 6: set_ack(false); write("ADDR_L"); set_address("PC"); addr_oper("LOAD"); break;  // store vector byte in ADDR_L
        case LATCH_IR + 7: set_address("PC"); addr_oper("ADD"); write_address("PC"); break;  // load vector byte to PC
        case LATCH_IR + 8: read("MEM"); set_address("PC"); addr_oper("INC"); write_address("PC");  break;  // vector * 2
        case LATCH_IR + 9: read("MEM"); write("ADDR_L"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // fetch low byte of final vector
        case LATCH_IR + 10: read("MEM"); write("ADDR_H"); set_address("PC"); addr_oper("LOAD"); break;  // fetch high byte of final vector
        case LATCH_IR + 11: read("INT_DIS"); write("IE_LATCH"); set_address("PC"); addr_oper("LOAD"); write_address("PC"); next = FETCH_START; break; // load final vector into PC, disable interrupts & begin interrupt service
    }
}
else if(state >= EXEC_START) {  // handle different CPU instructions
    switch(instruction) {
        case 0x00: /*NOP*/ nop(); break;
        case 0xFF: /*RESET*/ perform_reset(); break;
        case 0xE1: /*EI*/ set_IE_latch(true); break;
        case 0xD1: /*DI*/ set_IE_latch(false); break;
        case 0x01: /*LD A, B*/ load_reg("A", "B"); break;
        case 0x02: /*LD A, C*/ load_reg("A", "C"); break;
        case 0x03: /*LD A, D*/ load_reg("A", "D"); break;
        case 0x04: /*LD B, A*/ load_reg("B", "A"); break;
        case 0x05: /*LD B, C*/ load_reg("B", "C"); break;
        case 0x06: /*LD B, D*/ load_reg("B", "D"); break;
        case 0x07: /*LD C, A*/ load_reg("C", "A"); break;
        case 0x08: /*LD C, B*/ load_reg("C", "B"); break;
        case 0x09: /*LD C, D*/ load_reg("C", "D"); break;
        case 0x0A: /*LD D, A*/ load_reg("D", "A"); break;
        case 0x0B: /*LD D, B*/ load_reg("D", "B"); break;
        case 0x0C: /*LD D, C*/ load_reg("D", "C"); break;
        case 0x0D: /*LD A, n*/ load_immediate("A"); break;
        case 0x0E: /*LD B, n*/ load_immediate("B"); break;
        case 0x0F: /*LD C, n*/ load_immediate("C"); break;
        case 0x10: /*LD D, n*/ load_immediate("D"); break;
        case 0x11: /*LD A, (DP)*/ load_reg_DP("A"); break;
        case 0x12: /*LD B, (DP)*/ load_reg_DP("B"); break;
        case 0x13: /*LD C, (DP)*/ load_reg_DP("C"); break;
        case 0x14: /*LD D, (DP)*/ load_reg_DP("D"); break;
        case 0x15: /*LD A, (DP + d)*/ load_reg_addr_reg_plus_d("A", "DP"); break;
        case 0x16: /*LD B, (DP + d)*/ load_reg_addr_reg_plus_d("B", "DP"); break;
        case 0x17: /*LD A, (DP + D + d)*/ load_A_addr_reg_plus_D_plus_d("DP"); break;
        case 0x18: /*LD A, (SP + D + d)*/ load_A_addr_reg_plus_D_plus_d("SP"); break;
        case 0x19: /*LD B, (SP + d)*/ load_reg_addr_reg_plus_d("B", "SP"); break;
        case 0x1A: /*LD C, (SP + d)*/ load_reg_addr_reg_plus_d("C", "SP"); break;
        case 0x1B: /*LD D, (SP + d)*/ load_reg_addr_reg_plus_d("D", "SP"); break;
        case 0x1C: /*LD A, (nn)*/ load_reg_imm_addr("A"); break;
        case 0x1D: /*LD B, (nn)*/ load_reg_imm_addr("B"); break;
        case 0x1E: /*LD C, (nn)*/ load_reg_imm_addr("C"); break;
        case 0x1F: /*LD D, (nn)*/ load_reg_imm_addr("D"); break;
        case 0x20: /*LD (DP), A*/ load_DP_reg("A"); break;
        case 0x21: /*LD (DP), B*/ load_DP_reg("B"); break;
        case 0x22: /*LD (DP), C*/ load_DP_reg("C"); break;
        case 0x23: /*LD (DP), D*/ load_DP_reg("D"); break;
        case 0x24: /*LD (DP + d), A*/ load_addr_reg_plus_d_reg("A", "DP"); break;
        case 0x25: /*LD (DP + d), B*/ load_addr_reg_plus_d_reg("B", "DP"); break;
        case 0x26: /*LD (DP + D + d), A*/ load_addr_reg_plus_D_plus_d_A("DP"); break;
        case 0x27: /*LD (SP + D + d), A*/ load_addr_reg_plus_D_plus_d_A("SP"); break;
        case 0x28: /*LD (SP + d), B*/ load_addr_reg_plus_d_reg("B", "SP"); break;
        case 0x29: /*LD (SP + d), C*/ load_addr_reg_plus_d_reg("C", "SP"); break;
        case 0x2A: /*LD (SP + d), D*/ load_addr_reg_plus_d_reg("D", "SP"); break;
        case 0x2B: /*LD (nn), A*/ load_imm_addr_reg("A"); break;
        case 0x2C: /*LD (nn), B*/ load_imm_addr_reg("B"); break;
        case 0x2D: /*LD (nn), C*/ load_imm_addr_reg("C"); break;
        case 0x2E: /*LD (nn), D*/ load_imm_addr_reg("D"); break;
        case 0x2F: /*LD (nn), n*/ load_imm_addr_imm(); break;
        case 0x30: /*LD (nn), (nn)*/ load_imm_addr_imm_addr(); break;
        case 0x31: /*LD A, (CD)*/ load_A_CD(); break;
        case 0x32: /*LD (CD), A*/ load_CD_A(); break;
        case 0x33: /*LD CD, (DP)*/ load_CD_DP(); break;
        case 0x34: /*LD (DP), CD*/ load_DP_CD(); break;
        case 0x35: /*LD DP, AB*/ load_DP_AB(); break;
        case 0x36: /*LD DP, nn*/ load_reg16_imm("DP"); break;
        case 0x37: /*LD SP, nn*/ load_reg16_imm("SP"); break;
        case 0x38: /*LD DP, SP + d*/ load_addr_reg_addr_reg_plus_d("DP", "SP"); break;
        case 0x39: /*EX AB, CD*/ ex_AB_CD(); break;
        case 0x3A: /*EX CD, DP*/ ex_CD_DP(); break;
        case 0x3B: /*EX DP, (nn)*/ ex_DP_nn(); break;
        case 0x3C: /*PUSH A*/ push8("A"); break;
        case 0x3D: /*PUSH B*/ push8("B"); break;
        case 0x3E: /*PUSH F*/ push8("F"); break;
        case 0x3F: /*PUSH CD*/ push_CD(); break;
        case 0x40: /*PUSH DP*/ push_DP(); break;
        case 0x41: /*PUSH ALL*/ push_all(); break;
        case 0x42: /*PUSH n*/ push_n(); break;
        case 0x43: /*PUSH (nn)*/ push_nn(); break;
        case 0x44: /*POP A*/ pop8("A"); break;
        case 0x45: /*POP B*/ pop8("B"); break;
        case 0x46: /*POP F*/ pop8("F"); break;
        case 0x47: /*POP CD*/ pop_CD(); break;
        case 0x48: /*POP DP*/ pop_DP(); break;
        case 0x49: /*POP ALL*/ pop_all(); break;
        case 0x4A: /*POP (nn)*/ pop_nn(); break;
        case 0x4B: /*ADD A, B*/ alu_A_reg("B", "ADD", false); break;
        case 0x4C: /*ADD A, C*/ alu_A_reg("C", "ADD", false); break;
        case 0x4D: /*ADD A, D*/ alu_A_reg("D", "ADD", false); break;
        case 0x4E: /*ADD A, n*/ alu_reg_imm("A", "ADD", false); break;
        case 0x4F: /*ADD B, n*/ alu_reg_imm("B", "ADD", false); break;
        case 0x50: /*ADD C, n*/ alu_reg_imm("C", "ADD", false); break;
        case 0x51: /*ADD D, n*/ alu_reg_imm("D", "ADD", false); break;
        case 0x52: /*ADDC A, A*/ alu_A_reg("A", "ADD", true); break;
        case 0x53: /*ADDC A, B*/ alu_A_reg("B", "ADD", true); break;
        case 0x54: /*ADDC A, C*/ alu_A_reg("C", "ADD", true); break;
        case 0x55: /*ADDC A, D*/ alu_A_reg("D", "ADD", true); break;
        case 0x56: /*ADDC A, n*/ alu_reg_imm("A", "ADD", true); break;
        case 0x57: /*ADDC B, n*/ alu_reg_imm("B", "ADD", true); break;
        case 0x58: /*ADDC C, n*/ alu_reg_imm("C", "ADD", true); break;
        case 0x59: /*ADDC D, n*/ alu_reg_imm("D", "ADD", true); break;
        case 0x5A: /*SUB A, B*/ alu_A_reg("B", "SUB", false); break;
        case 0x5B: /*SUB A, C*/ alu_A_reg("C", "SUB", false); break;
        case 0x5C: /*SUB A, D*/ alu_A_reg("D", "SUB", false); break;
        case 0x5D: /*SUB A, n*/ alu_reg_imm("A", "SUB", false); break;
        case 0x5E: /*SUB B, n*/ alu_reg_imm("B", "SUB", false); break;
        case 0x5F: /*SUB C, n*/ alu_reg_imm("C", "SUB", false); break;
        case 0x60: /*SUB D, n*/ alu_reg_imm("D", "SUB", false); break;
        case 0x61: /*SUBB A, B*/ alu_A_reg("B", "SUB", true); break;
        case 0x62: /*SUBB A, C*/ alu_A_reg("C", "SUB", true); break;
        case 0x63: /*SUBB A, D*/ alu_A_reg("D", "SUB", true); break;
        case 0x64: /*SUBB A, n*/ alu_reg_imm("A", "SUB", true); break;
        case 0x65: /*SUBB B, n*/ alu_reg_imm("B", "SUB", true); break;
        case 0x66: /*SUBB C, n*/ alu_reg_imm("C", "SUB", true); break;
        case 0x67: /*SUBB D, n*/ alu_reg_imm("D", "SUB", true); break;
        case 0x68: /*ADD A, (DP)*/ alu_A_DP("ADD", false); break;
        case 0x69: /*ADDC A, (DP)*/ alu_A_DP("ADD", true); break;
        case 0x6A: /*SUB A, (DP)*/ alu_A_DP("SUB", false); break;
        case 0x6B: /*SUBB A, (DP)*/ alu_A_DP("SUB", true); break;
        case 0x6C: /*ADD (DP), A*/ alu_DP_A("ADD", false); break;
        case 0x6D: /*ADDC (DP), A*/ alu_DP_A("ADD", true); break;
        case 0x6E: /*SUB (DP), A*/ alu_DP_A("SUB", false); break;
        case 0x6F: /*SUBB (DP), A*/ alu_DP_A("SUB", true); break;
        case 0x70: /*INC A*/ alu_reg_imm_direct("A", "ADD", 1); break;
        case 0x71: /*DEC A*/ alu_reg_imm_direct("A", "SUB", 1); break;
        case 0x72: /*INC (DP)*/ alu_DP_direct("ADD", false, 1); break;
        case 0x73: /*DEC (DP)*/ alu_DP_direct("SUB", false, 1); break;
        case 0x74: /*INC (nn)*/ alu_imm_direct("ADD", false, 1); break;
        case 0x75: /*DEC (nn)*/ alu_imm_direct("SUB", false, 1); break;
        case 0x76: /*CLR A*/ reg_clr("A"); break;
        case 0x77: /*CPL A*/ alu_reg_imm_direct("A", "XOR", 255); break;
        case 0x78: /*AND A, B*/ alu_A_reg("B", "AND", false); break;
        case 0x79: /*AND A, C*/ alu_A_reg("C", "AND", false); break;
        case 0x7A: /*AND A, D*/ alu_A_reg("D", "AND", false); break;
        case 0x7B: /*AND A, n*/ alu_reg_imm("A", "AND", false); break;
        case 0x7C: /*AND B, n*/ alu_reg_imm("B", "AND", false); break;
        case 0x7D: /*AND C, n*/ alu_reg_imm("C", "AND", false); break;
        case 0x7E: /*AND D, n*/ alu_reg_imm("D", "AND", false); break;
        case 0x7F: /*OR A, B*/ alu_A_reg("B", "OR", false); break;
        case 0x80: /*OR A, C*/ alu_A_reg("C", "OR", false); break;
        case 0x81: /*OR A, D*/ alu_A_reg("D", "OR", false); break;
        case 0x82: /*OR A, n*/ alu_reg_imm("A", "OR", false); break;
        case 0x83: /*OR B, n*/ alu_reg_imm("B", "OR", false); break;
        case 0x84: /*OR C, n*/ alu_reg_imm("C", "OR", false); break;
        case 0x85: /*OR D, n*/ alu_reg_imm("D", "OR", false); break;
        case 0x86: /*XOR A, B*/ alu_A_reg("B", "XOR", false); break;
        case 0x87: /*XOR A, C*/ alu_A_reg("C", "XOR", false); break;
        case 0x88: /*XOR A, D*/ alu_A_reg("D", "XOR", false); break;
        case 0x89: /*XOR A, n*/ alu_reg_imm("A", "XOR", false); break;
        case 0x8A: /*XOR B, n*/ alu_reg_imm("B", "XOR", false); break;
        case 0x8B: /*XOR C, n*/ alu_reg_imm("C", "XOR", false); break;
        case 0x8C: /*XOR D, n*/ alu_reg_imm("D", "XOR", false); break;
        case 0x8D: /*CP A, C*/ cp_A_reg("C"); break;
        case 0x8E: /*CP A, D*/ cp_A_reg("D"); break;
        case 0x8F: /*MUL AB*/ alu_AB_AB("MUL"); break;
        case 0x90: /*MUL A, n*/ alu_AB_A_imm("MUL"); break;
        case 0x91: /*MUL (DP), AB*/ alu_DPl_DPh("MUL"); break;
        case 0x92: /*MUL CD, AB*/ alu_CD_AB("MUL"); break;
        case 0x93: /*MUL16 AB, C*/ alu_MUL16_8(); break;
        case 0x94: /*DIV A, B*/ alu_AB_AB("DIV"); break;
        case 0x95: /*DIV A, n*/ alu_AB_A_imm("DIV"); break;
        case 0x96: /*DIV (DP), AB*/ alu_DPl_DPh("DIV"); break;
        case 0x97: /*DIV CD, AB*/ alu_CD_AB("DIV"); break;
        case 0x98: /*DIVNR A, B*/ alu_DIVNR(); break;
        case 0x99: /*EXT A*/ alu_AB_AB("EXT"); break;
        case 0x9A: /*EXTDIR A, oper*/ alu_AB_A_imm("EXT"); break;
        case 0x9B: /*EXT (DP), A*/ alu_DPl_DPh("EXT"); break;
        case 0x9C: /*EXT CD, A*/ alu_CD_AB("EXT"); break;
        case 0x9D: /*EXTDIRL A, oper*/ alu_EXTDIRL(); break;
        case 0x9E: /*INC DP*/ addr_alu("DP", "INC"); break;
        case 0x9F: /*DEC DP*/ addr_alu("DP", "DEC"); break;
        case 0xA0: /*ADD DP, A*/ addr_alu_A("DP", "ADD"); break;
        case 0xA1: /*ADD DP, d*/ addr_alu_n("DP", "ADD"); break;
        case 0xA2: /*ADD CD, AB*/ alu_CD_AB_flags("ADD", false); break;
        case 0xA3: /*SUB CD, AB*/ alu_CD_AB_flags("SUB", false); break;
        case 0xA4: /*ADD SP, A*/ addr_alu_A("SP", "ADD"); break;
        case 0xA5: /*ADD SP, d*/ addr_alu_n("SP", "ADD"); break;
        case 0xA6: /*CP A, B*/ cp_A_reg("B"); break;
        case 0xA7: /*CP A, n*/ cp_A_imm(); break;
        case 0xA8: /*CP B, n*/ cp_reg_n("B"); break;
        case 0xA9: /*CP C, n*/ cp_reg_n("C"); break;
        case 0xAA: /*CP D, n*/ cp_reg_n("D"); break;
        case 0xAB: /*CP A, (DP)*/ cp_A_DP(); break;
        case 0xAC: /*CP (DP), n*/ cp_DP_n(); break;
        case 0xAD: /*test A, n*/ test_A_bits(); break;
        case 0xAE: /*LD C, (DP + d)*/ load_reg_addr_reg_plus_d("C", "DP"); break;
        case 0xAF: /*LD D, (DP + d)*/ load_reg_addr_reg_plus_d("D", "DP"); break;
        case 0xB0: /*LD (DP + d), C*/ load_addr_reg_plus_d_reg("C", "DP"); break;
        case 0xB1: /*LD (DP + d), D*/ load_addr_reg_plus_d_reg("D", "DP"); break;
        case 0xB2: /*LD A, (SP + d)*/ load_reg_addr_reg_plus_d("A", "SP"); break;
        case 0xB3: /*LD (SP + d), A*/ load_addr_reg_plus_d_reg("A", "SP"); break;
        case 0xB4: /*LD CD, SP*/ load_CD_SP(); break;
        case 0xB5: /*LD DP, CD + d*/ load_DP_CD_plus_d(); break;
        case 0xB6: /*ADD CD, nn*/ alu_CD_nn("ADD", false); break;
        case 0xB7: /*SUB CD, nn*/ alu_CD_nn("SUB", false); break;
        case 0xB8: /*ADD (DP), n*/ alu_DP_n("ADD", false); break;
        case 0xB9: /*ADDC (DP), n*/ alu_DP_n("ADD", true); break;
        case 0xBA: /*SUB (DP), n*/ alu_DP_n("SUB", false); break;
        case 0xBB: /*SUBB (DP), n*/ alu_DP_n("SUB", true); break;
        case 0xBC: /*AND A, (DP)*/ alu_A_DP("AND", false); break;
        case 0xBD: /*AND (DP), A*/ alu_DP_A("AND", false); break;
        case 0xBE: /*AND (DP), n*/ alu_DP_n("AND", false); break;
        case 0xBF: /*OR A, (DP)*/ alu_A_DP("OR", false); break;
        case 0xC0: /*OR (DP), A*/ alu_DP_A("OR", false); break;
        case 0xC1: /*OR (DP), n*/ alu_DP_n("OR", false); break;
        case 0xC2: /*XOR A, (DP)*/ alu_A_DP("XOR", false); break;
        case 0xC3: /*XOR (DP), A*/ alu_DP_A("XOR", false); break;
        case 0xC4: /*XOR (DP), n*/ alu_DP_n("XOR", false); break;
        case 0xC5: /*JP nn*/ cond_jump_imm_addr("C", false, true); break;
        case 0xC6: /*JP C, nn*/ cond_jump_imm_addr("C", true, false); break;
        case 0xC7: /*JP OV, nn*/ cond_jump_imm_addr("OV", true, false); break;
        case 0xC8: /*JP Z, nn*/ cond_jump_imm_addr("Z", true, false); break;
        case 0xC9: /*JP NEG, nn*/ cond_jump_imm_addr("NEG", true, false); break;
        case 0xCA: /*JP POS, nn*/ cond_jump_imm_addr("POS", true, false); break;
        case 0xCB: /*JP EQ, nn*/ cond_jump_imm_addr("A_EQ_B", true, false); break;
        case 0xCC: /*JP LT, nn*/ cond_jump_imm_addr("A_LT_B", true, false); break;
        case 0xCD: /*JP GT, nn*/ cond_jump_imm_addr("A_GT_B", true, false); break;
        case 0xCE: /*JP DP + d*/ load_addr_reg_addr_reg_plus_d("PC", "DP"); break;
        case 0xCF: /*JR d*/ cond_jump_rel_addr("C", false, true); break;
        case 0xD0: /*JR C, d*/ cond_jump_rel_addr("C", true, false); break;
        case 0xD2: /*JR OV, d*/ cond_jump_rel_addr("OV", true, false); break;
        case 0xD3: /*JR Z, d*/ cond_jump_rel_addr("Z", true, false); break;
        case 0xD4: /*JR NEG, d*/ cond_jump_rel_addr("NEG", true, false); break;
        case 0xD5: /*JR POS, d*/ cond_jump_rel_addr("POS", true, false); break;
        case 0xD6: /*JR EQ, d*/ cond_jump_rel_addr("A_EQ_B", true, false); break;
        case 0xD7: /*JR LT, d*/ cond_jump_rel_addr("A_LT_B", true, false); break;
        case 0xD8: /*JR GT, d*/ cond_jump_rel_addr("A_GT_B", true, false); break;
        case 0xD9: /*JR NC, d*/ cond_jump_rel_addr("C", false, false); break;
        case 0xDA: /*JR NOV, d*/ cond_jump_rel_addr("OV", false, false); break;
        case 0xDB: /*JR NZ, d*/ cond_jump_rel_addr("Z", false, false); break;
        case 0xDC: /*JR NNEG, d*/ cond_jump_rel_addr("NEG", false, false); break;
        case 0xDD: /*JR NPOS, d*/ cond_jump_rel_addr("POS", false, false); break;
        case 0xDE: /*JR NEQ, d*/ cond_jump_rel_addr("A_EQ_B", false, false); break;
        case 0xDF: /*JR NLT, d*/ cond_jump_rel_addr("A_LT_B", false, false); break;
        case 0xE0: /*JR NGT, d*/ cond_jump_rel_addr("A_GT_B", false, false); break;
        case 0xE2: /*DJNZ d*/ djnz_rel_addr(); break;
        case 0xE3: /*CALL nn*/ cond_call_imm("C", true); break;
        case 0xE4: /*CALLR d*/ cond_call_rel("C", true); break;
        case 0xE5: /*CALL DP + d*/ call_DP_plus_d(); break;
        case 0xE6: /*RET*/ cond_ret("C", true); break;
        case 0xE7: /*RETI*/ reti(); break;
        case 0xE8: /*OUT (s), A*/ out_dev_reg("A"); break;
        case 0xE9: /*OUT (s), B*/ out_dev_reg("B"); break;
        case 0xEA: /*OUT (s), C*/ out_dev_reg("C"); break;
        case 0xEB: /*OUT (s), D*/ out_dev_reg("D"); break;
        case 0xEC: /*OUT (s), n*/ out_dev_imm(); break;
        case 0xED: /*OUT (s), (DP)*/ out_dev_DP(); break;
        case 0xEE: /*OUTI (s), (DP)*/ out_dev_oper_DP("INC"); break;
        case 0xEF: /*OUTD (s), (DP)*/ out_dev_oper_DP("DEC"); break;
        case 0xF0: /*IN A, (s)*/ in_reg_dev("A"); break;
        case 0xF1: /*IN B, (s)*/ in_reg_dev("B"); break;
        case 0xF2: /*IN C, (s)*/ in_reg_dev("C"); break;
        case 0xF3: /*IN D, (s)*/ in_reg_dev("D"); break;
        case 0xF4: /*IN (DP), (s)*/ in_DP_dev(); break;
        case 0xF5: /*INI (DP), (s)*/ in_oper_DP_dev("INC"); break;
        case 0xF6: /*IND (DP), (s)*/ in_oper_DP_dev("DEC"); break;
        case 0xF7: /*INCIO (s)*/ rd_modif_wr_dev_direct("ADD", 1); break;
        case 0xF8: /*DECIO (s)*/ rd_modif_wr_dev_direct("SUB", 1); break;
        case 0xF9: /*ANDIO (s), A*/ rd_modif_wr_dev_A("AND"); break;
        case 0xFA: /*ANDIO (s), n*/ rd_modif_wr_dev_n("AND"); break;
        case 0xFB: /*ORIO (s), A*/ rd_modif_wr_dev_A("OR"); break;
        case 0xFC: /*ORIO (s), n*/ rd_modif_wr_dev_n("OR"); break;
        case 0xFD: /*XORIO (s), A*/ rd_modif_wr_dev_A("XOR"); break;
        case 0xFE: /*XORIO (s), n*/ rd_modif_wr_dev_n("XOR"); break;
    }
}

function latch_int_start_opcode_fetch() {
    addr_oper("INC"); set_address("PC"); read("MEM"); write("INT_LATCH");
}

function nop() {
     latch_int_start_opcode_fetch(); next = LATCH_IR;  // fetch next opcode to make NOP only 2 cycles long
}

function set_IE_latch(IE_state) {
    next = state + 1;
    switch(state) {
        case EXEC_START + 0: set_interrupts(IE_state); break;  // out data to IE reg
        case EXEC_START + 1: set_interrupts(IE_state); write("IE_LATCH"); next = FETCH_START; break;  // latch it
    }
}

function perform_reset() {
    next = state + 1; // incrementing state is default behaviour
    drive_bus(0); addr_oper("LOAD"); alu_oper("ADD"); flags_src("ALU"); oper_carry(false); // same for all states
    switch(state) {
        case EXEC_START + 0: set_reset(true); set_address("PC"); break;  // clears IE latch and temp addr regs
        case EXEC_START + 1: write("A"); set_address("PC"); write_address("PC"); break;  // clear A and PC
        case EXEC_START + 2: set_address("PC"); write("ADDR_STORE"); break;  // clear addr cache regs
        case EXEC_START + 3: write("B"); break;  // clear B
        case EXEC_START + 4: write("C"); break;  // clear C
        case EXEC_START + 5: write("D"); break;  // clear D
        case EXEC_START + 6: write("F"); break;  // flags will correspond to A + B, so to 0 + 0
        case EXEC_START + 7: write("A_STORE"); break;  // clear A cache
        case EXEC_START + 8: write("B_STORE"); break;  // clear B cache
        case EXEC_START + 9: write("F_STORE"); drive_bus(0x80); break;  // clear flags cache, put 0x80 onto the bus
        case EXEC_START + 10: write("ADDR_L"); drive_bus(0x80); set_address("DP"); break;  // load 0x80 into temp addr L
        case EXEC_START + 11: write("ADDR_H"); drive_bus(0x80); set_address("DP"); break;  // load 0x80 into temp addr H
        case EXEC_START + 12: set_address("DP"); write_address("DP"); drive_bus(0xFF); break;  // set DP to 0x8080, out 0xFF
        case EXEC_START + 13: write("ADDR_L"); drive_bus(0xFF); set_address("SP"); break;  // load 0xFF into temp addr L
        case EXEC_START + 14: write("ADDR_H"); drive_bus(0xFF); set_address("SP"); break;  // load 0xFF into temp addr H
        case EXEC_START + 15: write_address("SP"); set_address("SP"); break;  // set SP to 0xFFFF
        case EXEC_START + 16: set_reset(true); next = FETCH_START; break;  // clear temp addr regs and start program execution
    }
}

function load_reg(dest, src) {  // no additional bytes
    next = state + 1;
    switch(state) {
        case EXEC_START + 0: read(src); update_read_val(src); break;
        case EXEC_START + 1: read(src); write(dest); next = FETCH_START; break;
    }
}

function load_immediate(dest) {  // 1 additional byte: n
    read("MEM"); write(dest); set_address("PC"); addr_oper("INC"); write_address("PC"); next = FETCH_START; // n already on the bus, just write it and increment PC
}

function load_reg_addr_reg_plus_d(dest_reg, addr_reg) {  // 1 additional byte: d
    next = state + 1;
    set_address(addr_reg);  // same for almost all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("ADDR_L"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // load d into ADDR_L, increment PC
        case EXEC_START + 1: read("ADDR_H"); addr_oper("ADD"); write("ADDR_STORE"); break;  // start addr_reg capture, start reading ADDR_H
        case EXEC_START + 2: read("MEM"); write("ADDR_H"); addr_oper("ADD"); write_address(addr_reg); break;  // add d to addr_reg, restore ADDR_H
        case EXEC_START + 3: read("ADDR_L"); write(dest_reg); addr_oper("ADD"); break;  // write (addr_reg + d) into dest_reg
        case EXEC_START + 4: read("ADDR_L"); write("ADDR_L"); addr_oper("LOAD"); break;  // restore ADDR_L
        case EXEC_START + 5: latch_int_start_opcode_fetch(); write_address(addr_reg); next = LATCH_IR; break;  // restore addr_reg, fetch next opcode to save a clock cycle
    }
}

function load_A_addr_reg_plus_D_plus_d(addr_reg) {  // 1 additional byte: d
    next = state + 1;
    set_address(addr_reg);  // same for almost all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("ADDR_L"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // write d into ADDR_L, increment PC
        case EXEC_START + 1: read("D"); addr_oper("ADD"); write("ADDR_STORE"); break;  // start addr_reg capture
        case EXEC_START + 2: read("ADDR_H"); write("ADDR_L"); addr_oper("ADD"); write_address(addr_reg); break;  // add d to addr_reg
        case EXEC_START + 3: read("MEM"); write("ADDR_H"); addr_oper("ADD"); write_address(addr_reg); break;  // add D to addr_reg, restore ADDR_H
        case EXEC_START + 4: read("ADDR_L"); write("A"); addr_oper("ADD"); break;  // write (addr_reg + D + d) into A
        case EXEC_START + 5: read("ADDR_L"); write("ADDR_L"); addr_oper("LOAD"); break;  // restore ADDR_L
        case EXEC_START + 6: latch_int_start_opcode_fetch(); write_address(addr_reg); next = LATCH_IR; break;  // restore addr_reg, fetch next opcode to save a clock cycle
    }
}

function load_addr_reg_plus_D_plus_d_A(addr_reg) {  // 1 additional byte: d
    next = state + 1;
    set_address(addr_reg);  // same for almost all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("ADDR_L"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // write d into ADDR_L, increment PC
        case EXEC_START + 1: read("D"); addr_oper("ADD"); write("ADDR_STORE"); break;  // start addr_reg capture
        case EXEC_START + 2: read("ADDR_H"); write("ADDR_L"); addr_oper("ADD"); write_address(addr_reg); break;  // add d to addr_reg
        case EXEC_START + 3: read("ADDR_L"); write("ADDR_H"); addr_oper("ADD"); write_address(addr_reg); break;  // add D to addr_reg, restore ADDR_H
        case EXEC_START + 4: read("A"); write("ADDR_L"); addr_oper("LOAD"); break;  // restore ADDR_L
        case EXEC_START + 5: read("A"); write("A_STORE"); addr_oper("LOAD"); break;  // update A reg read
        case EXEC_START + 6: read("A"); write("MEM"); addr_oper("LOAD"); break;  // start writing A reg to memory at (addr_reg + D + d)
        case EXEC_START + 7: latch_int_start_opcode_fetch(); write_address(addr_reg); next = LATCH_IR; break;  // end memory write, restore addr_reg, fetch next opcode to save a clock cycle
    }
}

function load_addr_reg_plus_d_reg(src_reg, addr_reg) {  // 1 additional byte: d
    next = state + 1;
    set_address(addr_reg);  // same for almost all states
    if(src_reg == "A" || src_reg == "B") {
        switch(state) {
            case EXEC_START + 0: read("MEM"); write("ADDR_L"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // write d into ADDR_L, increment PC
            case EXEC_START + 1: read("ADDR_H"); addr_oper("ADD"); write("ADDR_STORE"); break;  // start addr_reg capture
            case EXEC_START + 2: read("ADDR_L"); write("ADDR_H"); addr_oper("ADD"); write_address(addr_reg); break;  // add d to addr_reg, restore ADDR_H
            case EXEC_START + 3: read("ADDR_L"); write("ADDR_L"); addr_oper("ADD"); break;  // restore ADDR_L
            case EXEC_START + 4: read(src_reg); update_read_val(src_reg); addr_oper("LOAD"); break;  // update src_reg read
            case EXEC_START + 5: read(src_reg); write("MEM"); addr_oper("LOAD"); break;  // start writing src_reg to memory at (addr_reg + d)
            case EXEC_START + 6: latch_int_start_opcode_fetch(); write_address(addr_reg); next = LATCH_IR; break;  // end memory write, restore addr_reg, fetch next opcode to save a clock cycle
        }
    }
    else {
        switch(state) {
            case EXEC_START + 0: read("MEM"); write("ADDR_L"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // write d into ADDR_L, increment PC
            case EXEC_START + 1: read("ADDR_H"); addr_oper("ADD"); write("ADDR_STORE"); break;  // start addr_reg capture
            case EXEC_START + 2: read("ADDR_L"); write("ADDR_H"); addr_oper("ADD"); write_address(addr_reg); break;  // add d to addr_reg, restore ADDR_H
            case EXEC_START + 3: read("ADDR_L"); write("ADDR_L"); addr_oper("ADD"); break;  // restore ADDR_L
            case EXEC_START + 4: read(src_reg); write("MEM"); addr_oper("LOAD"); break;  // start writing src_reg to memory at (addr_reg + d)
            case EXEC_START + 5: latch_int_start_opcode_fetch(); write_address(addr_reg); next = LATCH_IR; break;  // end memory write, restore addr_reg, fetch next opcode to save a clock cycle
        }
    }
}

function load_reg_imm_addr(dest_reg) {  // 2 additional bytes: nn
    next = state + 1;
    read("MEM"); addr_oper("INC"); // same for all states
    switch(state) {
        case EXEC_START + 0: set_address("PC"); write("ADDR_L"); write_address("PC"); break;  // write ADDR_L, increment PC
        case EXEC_START + 1: set_address("DIR"); write("ADDR_H"); write_address("PC"); break; // write ADDR_H, increment PC, output ADDR onto address bus
        case EXEC_START + 2: set_address("DIR"); write(dest_reg); next = FETCH_START; break;  // write data from (nn) into register
    }
}

function load_reg_DP(dest_reg) {  // no additional bytes
    next = state + 1;
    read("MEM"); set_address("DP");  // same for all states
    switch(state) {
        case EXEC_START + 0: break;  // wait until address is stable
        case EXEC_START + 1: write(dest_reg); next = FETCH_START; break;  // write data from (DP) into register
    }
}

function load_DP_reg(src_reg) {  // no additional bytes
    next = state + 1;
    read(src_reg); set_address("DP");  // src_reg always on data bus, DP always on address bus
    switch(state) {
        case EXEC_START + 0: update_read_val(src_reg); break;  // refresh value that will be read and wait until address is stable
        case EXEC_START + 1: write("MEM"); next = FETCH_START; break;  // write src_reg into memory at (DP)
    }
}

function load_imm_addr_reg(src_reg) {  // 2 additional bytes: nn
    next = state + 1;
    addr_oper("INC");  // same for all states
    if(src_reg == "A" || src_reg == "B") {
        switch(state) {
            case EXEC_START + 0: read("MEM"); write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // write ADDR_L, increment PC
            case EXEC_START + 1: read("MEM"); write("ADDR_H"); set_address("PC"); write_address("PC"); break;  // write ADDR_H, increment PC
            case EXEC_START + 2: read("MEM"); update_read_val(src_reg); set_address("DIR"); break;  // refresh read val, set address to nn
            case EXEC_START + 3: read(src_reg); write("MEM"); set_address("DIR"); next = FETCH_START; break;  // write src_reg into memory at (nn)
        }
    }
    else {
        switch(state) {
            case EXEC_START + 0: read("MEM"); write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // write ADDR_L, increment PC
            case EXEC_START + 1: read(src_reg); write("ADDR_H"); set_address("DIR"); write_address("PC"); break;  // write ADDR_H, increment PC
            case EXEC_START + 2: read(src_reg); write("MEM"); set_address("DIR"); next = FETCH_START; break;  // write src_reg into memory at (nn)
        }
    }
}

function load_imm_addr_imm() {  // 3 additional bytes: n, nn
    next = state + 1;
    addr_oper("INC");  // operation is always INC
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("ADDR_H"); set_address("PC"); write_address("PC"); break;  // write ADDR_H, increment PC
        case EXEC_START + 1: write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // write ADDR_L, increment PC
        case EXEC_START + 2: set_address("DIR"); write("ADDR_STORE"); break;  // put ADDR onto address bus
        case EXEC_START + 3: set_address("PC"); break;  // end ADDR capture, don't read memory immediately, it would possibly trigger I/O read operation (that was very hard to spot bug)
        case EXEC_START + 4: read("MEM"); set_address("PC"); break;  // start reading high address byte
        case EXEC_START + 5: read("ADDR_H"); write("ADDR_H"); set_address("DIR"); write_address("PC"); break;  // write ADDR_H, increment PC, read n
        case EXEC_START + 6: read("ADDR_H"); write("MEM"); set_address("DIR"); next = FETCH_START; break;  // write n into memory at (nn)
    }
}

function load_imm_addr_imm_addr() {  // 4 additional bytes: src_l, src_h, dest_l, dest_h
    next = state + 1;
    read("MEM"); addr_oper("INC");  // same for almost all states
    switch(state) {
        case EXEC_START + 0: write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // store src_l in ADDR_L, increment PC
        case EXEC_START + 1: write("ADDR_H"); set_address("DIR"); write_address("PC"); break;  // store src_h in ADDR_H, increment PC, switch to DIR
        case EXEC_START + 2: write("ADDR_L"); set_address("DIR"); break;  // store source data in ADDR_L
        case EXEC_START + 3: write("ADDR_STORE"); set_address("DIR"); break;  // capture ADDR to save source data
        case EXEC_START + 4: set_address("PC"); break;  // switch back to PC
        case EXEC_START + 5: write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // store dest_l in ADDR_L, increment PC
        case EXEC_START + 6: read("ADDR_L"); write("ADDR_H"); set_address("DIR"); write_address("PC"); break;  // store dest_h in ADDR_L, increment PC, switch to DIR
        case EXEC_START + 7: read("ADDR_L"); write("MEM"); set_address("DIR"); next = FETCH_START; break;  // write source data into memory at (dest)
    }
}

function load_A_CD() {  // no additional bytes
    next = state + 1;
    set_address("DIR");  // DIR address always on address bus
    switch(state) {
        case EXEC_START + 0: read("C"); break;  // read C, output direct address
        case EXEC_START + 1: read("D"); write("ADDR_L"); break;  // write C into ADDR_L, start reading D
        case EXEC_START + 2: read("MEM"); write("ADDR_H"); break;  // write D into ADDR_H, start memory read
        case EXEC_START + 3: read("MEM"); write("A"); next = FETCH_START; break;  // write memory data into A
    }
}

function load_CD_A() {  // no additional bytes
    next = state + 1;
    set_address("DIR");  // DIR address always on address bus
    switch(state) {
        case EXEC_START + 0: read("C"); write("A_STORE"); break; // read C, update A reg read, output direct address
        case EXEC_START + 1: read("D"); write("ADDR_L"); break;  // write C into ADDR_L, start reading D
        case EXEC_START + 2: write("ADDR_H"); read("A"); break;  // write D into ADDR_H, output A reg
        case EXEC_START + 3: read("A"); write("MEM"); next = FETCH_START; break;  // write A reg into memory
    }
}


function load_reg16_imm(dest_reg) {  // 2 additional bytes: nn
    next = state + 1;
    read("MEM"); // memory data always on data bus
    switch(state) {
        case EXEC_START + 0: set_address("PC"); addr_oper("INC"); write("ADDR_L"); write_address("PC"); break;  // write ADDR_L, increment PC
        case EXEC_START + 1: set_address("PC"); addr_oper("LOAD"); write("ADDR_H"); write_address("PC"); break;  // write ADDR_H, increment PC
        case EXEC_START + 2: latch_int_start_opcode_fetch(); write_address(dest_reg); next = LATCH_IR; break;  // write new value, fetch next opcode to save a clock cycle
    }
}

function load_CD_DP(dest_reg) {  // no additional bytes
    next = state + 1;
    read("MEM"); set_address("DP"); // same for all states
    switch(state) {
        case EXEC_START + 0: addr_oper("INC"); break;  // wait until address is stable
        case EXEC_START + 1: write("C"); addr_oper("DEC"); write_address("DP"); break;  // write C reg, increment DP
        case EXEC_START + 2: write("D"); addr_oper("DEC"); write_address("DP"); next = FETCH_START; break;  // write D reg, decrement DP to restore it
    }
}

function load_CD_SP() {  // no additional bytes
    next = state + 1;
    set_address("SP");  // same for all states
    switch(state) {
        case EXEC_START + 0: read("ADDR_L"); write("ADDR_STORE"); break;  // capture SP
        case EXEC_START + 1: read("ADDR_H"); write("C"); break;  // load SPl into C
        case EXEC_START + 2: read("ADDR_H"); write("D"); next = FETCH_START; break;  // load SPh into D
    }
}

function load_DP_CD() {  // no additional bytes
    next = state + 1;
    set_address("DP");  //address is always DP
    switch(state) {
        case EXEC_START + 0: read("C"); addr_oper("INC"); break;  // start reading C reg
        case EXEC_START + 1: read("C"); write("MEM"); addr_oper("INC"); break;  // write C reg into memory
        case EXEC_START + 2: read("D"); addr_oper("INC"); write_address("DP"); break;  // end memory write, increment DP, start reading D reg
        case EXEC_START + 3: read("D"); write("MEM"); addr_oper("DEC"); break;  // write D  reg into memory
        case EXEC_START + 4: latch_int_start_opcode_fetch(); write_address("DP"); next = LATCH_IR; break;  // end memory write, decrement DP to restore it
    }
}

function load_DP_AB() {  // no additional bytes
    next = state + 1;
    set_address("DP"); addr_oper("LOAD"); // same for all states
    switch(state) {
        case EXEC_START + 0: read("A"); write("A_STORE"); break;  // update A reg read
        case EXEC_START + 1: read("A"); write("ADDR_L"); break;  // load A into ADDR_L
        case EXEC_START + 2: read("B"); write("B_STORE"); break;  // update B reg read
        case EXEC_START + 3: read("B"); write("ADDR_H"); break;  // load B into ADDR_H
        case EXEC_START + 4: latch_int_start_opcode_fetch(); write_address("DP"); next = LATCH_IR; break;  // write AB into DP, fetch next opcode to save a clock cycle
    }
}

function load_DP_CD_plus_d() {  // 1 additional byte: d
    next = state + 1;
    set_address("PC");  // same for almost all states
    switch(state) {
        case EXEC_START + 0: read("C"); break;  // start reading C
        case EXEC_START + 1: read("D"); write("ADDR_L"); break;  // load C into ADDR_L
        case EXEC_START + 2: read("MEM"); write("ADDR_H"); addr_oper("LOAD"); break;  // load D into ADDR_H
        case EXEC_START + 3: write("ADDR_L"); set_address("DP"); addr_oper("ADD"); write_address("DP"); break;  // load CD into DP, load d into ADDR_L
        case EXEC_START + 4: addr_oper("INC"); write_address("DP"); break;  // add d to DP
        case EXEC_START + 5: latch_int_start_opcode_fetch(); write_address("PC"); next = LATCH_IR; break;  // increment PC, fetch next opcode to save a clock cycle
    }
}

function load_addr_reg_addr_reg_plus_d(dest_reg, src_reg) {  // 1 additional byte: d
    next = state + 1;
    set_address(src_reg); addr_oper("ADD"); // same for all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("ADDR_L"); write_address("PC"); break;  // load d into ADDR_L, increment PC
        case EXEC_START + 1: latch_int_start_opcode_fetch(); write_address(dest_reg); next = LATCH_IR; break;  // write src_reg + d into dest_reg, fetch next opcode to save a clock cycle
    }
}

function ex_AB_CD() {  // no additional bytes
    next = state + 1;
    switch(state) {
        case EXEC_START + 0: read("C"); write("A_STORE"); break;  // capture A, start reading C
        case EXEC_START + 1: read("C"); write("A"); break;  // write C into A
        case EXEC_START + 2: read("D"); write("B_STORE"); break;  // capture B, start reading D
        case EXEC_START + 3: read("A"); write("B"); break;  // write D into B, start reading captured A
        case EXEC_START + 4: read("B"); write("C"); break;  // write A into C, start reading captured B
        case EXEC_START + 5: read("B"); write("D"); next = FETCH_START; break;  // write B into D
    }
}

function ex_CD_DP() {  // no additional bytes
    next = state + 1;
    set_address("DP"); addr_oper("LOAD"); // same for all states
    switch(state) {
        case EXEC_START + 0: read("C"); write("ADDR_STORE"); break;  // read C, start DP capture
        case EXEC_START + 1: read("D"); write("ADDR_L"); break;  // write C into ADDR_L, start reading D
        case EXEC_START + 2: read("ADDR_L"); write("ADDR_H"); break;  // write D into ADDR_H, start reading ADDR_L
        case EXEC_START + 3: read("ADDR_H"); write("C"); write_address("DP"); break; // load CD into DP, write ADDR_L into C
        case EXEC_START + 4: read("ADDR_H"); write("D"); next = FETCH_START; break;  // write ADDR_H into D
    }
}

function ex_DP_nn() {  // 2 additional bytes: nn
    next = state + 1;
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("ADDR_L"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // load nl into ADDR_L, increment PC
        case EXEC_START + 1: read("MEM"); write("ADDR_H"); set_address("DP"); addr_oper("INC"); write_address("PC"); break;  // load nh into ADDR_H, increment PC
        case EXEC_START + 2: read("MEM"); write("ADDR_STORE"); set_address("DP"); addr_oper("LOAD"); break;  // start DP capture
        case EXEC_START + 3: read("MEM"); set_address("DP"); addr_oper("INC"); write_address("DP"); break;  // load nn into DP
        case EXEC_START + 4: read("MEM"); write("ADDR_L"); set_address("DP"); addr_oper("DEC"); write_address("DP"); break;  // load data from (nn) into ADDR_L, increment DP
        case EXEC_START + 5: read("ADDR_L"); write("ADDR_H"); set_address("DP"); addr_oper("DEC"); write_address("DP"); break;  // load data from (nn + 1) into ADDR_H, decrement DP
        case EXEC_START + 6: read("ADDR_L"); write("MEM"); set_address("DP"); addr_oper("INC"); break;  // write DPl into memory at (nn)
        case EXEC_START + 7: read("ADDR_H"); set_address("DP"); addr_oper("INC"); write_address("DP"); break;  // end memory write, increment DP
        case EXEC_START + 8: read("ADDR_H"); write("MEM"); set_address("DP"); addr_oper("LOAD"); break;  // write DPh into memory at (nn + 1)
        case EXEC_START + 9: latch_int_start_opcode_fetch(); write_address("DP"); next = LATCH_IR; break;  // end memory write, load new data into DP, fetch next opcode to save a clock cycle
    }
}

function push_n() {  // 1 additional byte: n
    next = state + 1;
    switch(state) {
        case EXEC_START + 0: write("ADDR_L"); set_address("DIR"); addr_oper("INC"); write_address("PC"); break;  // store n in ADDR_L, increment PC
        case EXEC_START + 1: read("ADDR_L"); write("ADDR_STORE"); set_address("DIR"); break;  // pass ADDR_L via address bus so that it can be read
        case EXEC_START + 2: read("ADDR_L"); set_address("SP"); addr_oper("DEC"); break;  // switch to SP
        case EXEC_START + 3: read("ADDR_L"); write("MEM"); set_address("SP"); addr_oper("DEC"); write_address("SP"); next = FETCH_START; break;  // decrement SP, push n
    }
}

function push_nn() {  // 2 additional bytes: nn
    next = state + 1;
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("ADDR_L"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // store nl in ADDR_L, increment PC
        case EXEC_START + 1: read("MEM"); write("ADDR_H"); set_address("DIR"); addr_oper("INC"); write_address("PC"); break;  // store nh in ADDR_H, increment PC
        case EXEC_START + 2: read("MEM"); write("ADDR_L"); set_address("DIR"); break;  // load data from (nn) into ADDR_L
        case EXEC_START + 3: read("ADDR_L"); write("ADDR_STORE"); set_address("DIR"); break;  // pass ADDR_L via address bus so that it can be read
        case EXEC_START + 4: read("ADDR_L"); set_address("SP"); addr_oper("DEC"); break;  // switch to SP
        case EXEC_START + 5: read("ADDR_L"); write("MEM"); set_address("SP"); addr_oper("DEC"); write_address("SP"); next = FETCH_START; break;  // decrement SP, push value from (nn)
    }
}

function push8(reg) {  // no additional bytes
    next = state + 1;
    read(reg); set_address("SP"); addr_oper("DEC");  // same for all states
    switch(state) {
        case EXEC_START + 0: update_read_val(reg); break;  // refresh reg read val, wait until address is stable
        case EXEC_START + 1: write_address("SP"); write("MEM"); next = FETCH_START; break;  // decrement SP, write reg into memory
    }
}

function push_CD() {  // no additional bytes
    next = state + 1;
    set_address("SP"); addr_oper("DEC");  // same for all states
    switch(state) {
        case EXEC_START + 0: read("D"); break;  // output D, wait until address is stable
        case EXEC_START + 1: read("D"); write_address("SP"); write("MEM"); break;  // decrement SP, push D
        case EXEC_START + 2: read("C"); break;  // end memory write, output C
        case EXEC_START + 3: read("C"); write_address("SP"); write("MEM"); next = FETCH_START; break;  // decrement SP, push C
    }
}

function push_DP() {  // no additional bytes
    next = state + 1;
    addr_oper("DEC"); // same for all states
    switch(state) {
        case EXEC_START + 0: write("ADDR_STORE"); set_address("DP"); break;  // set address to DP, capture it
        case EXEC_START + 1: read("ADDR_H"); set_address("SP"); break;  // set address to SP, start reading DPh
        case EXEC_START + 2: read("ADDR_H"); write("MEM"); set_address("SP"); write_address("SP"); break;  // decrement SP, push DPh
        case EXEC_START + 3: read("ADDR_L"); set_address("SP"); break;  // end memory write
        case EXEC_START + 4: read("ADDR_L"); write("MEM"); set_address("SP"); write_address("SP"); next = FETCH_START; break;  // decrement SP, push DPl
    }
}

function push_all() {  // no additional bytes
    next = state + 1;
    set_address("SP"); addr_oper("DEC");  // same for almost all states
    switch(state) {
        case EXEC_START + 0: read("A"); write("A_STORE"); break;  // output A, wait until address is stable
        case EXEC_START + 1: read("A"); write_address("SP"); write("MEM"); break;  // decrement SP, push A
        case EXEC_START + 2: read("B"); write("B_STORE"); break;  // end memory write, output B
        case EXEC_START + 3: read("B"); write_address("SP"); write("MEM"); break;  // decrement SP, push B
        case EXEC_START + 4: read("F"); write("F_STORE"); break;  // end memory write, output F
        case EXEC_START + 5: read("F"); write_address("SP"); write("MEM"); break;  // decrement SP, push F
        case EXEC_START + 6: read("D"); break;  // end memory write, output D
        case EXEC_START + 7: read("D"); write_address("SP"); write("MEM"); break;  // decrement SP, push D
        case EXEC_START + 8: read("C"); break;  // end memory write, output C
        case EXEC_START + 9: read("C"); write_address("SP"); write("MEM"); break;  // decrement SP, push C
        case EXEC_START + 10: set_address("DP"); write("ADDR_STORE"); break;  // set address to DP and capture it
        case EXEC_START + 11: set_address("SP"); read("ADDR_H"); break;  // set address to SP
        case EXEC_START + 12: read("ADDR_H"); write_address("SP"); write("MEM"); break;  // decrement SP, push DPh
        case EXEC_START + 13: read("ADDR_L"); break;  // end memory write
        case EXEC_START + 14: read("ADDR_L"); write_address("SP"); write("MEM"); next = FETCH_START; break;  // decrement SP, push DPl
    }
}

function push_all() {  // no additional bytes
    next = state + 1;
    set_address("SP"); addr_oper("DEC");  // same for almost all states
    switch(state) {
        case EXEC_START + 0: write("ADDR_STORE"); set_address("DP"); break;  // set address to DP and capture it
        case EXEC_START + 1: read("ADDR_H"); write("A_STORE"); set_address("SP"); break;  // set address to SP, capture A value
        case EXEC_START + 2: read("ADDR_H"); write("MEM"); write_address("SP"); break;  // decrement SP, push DPh
        case EXEC_START + 3: read("ADDR_L"); write("B_STORE"); break;  // end memory write, capture B value
        case EXEC_START + 4: read("ADDR_L"); write("MEM"); write_address("SP"); break;  // decrement SP, push DPl
        case EXEC_START + 5: read("D"); write("F_STORE"); break;  // end memory write, output D, capture F value
        case EXEC_START + 6: read("D"); write("MEM"); write_address("SP"); break;  // decrement SP, push D
        case EXEC_START + 7: read("C"); break;  // end memory write, output C
        case EXEC_START + 8: read("C"); write("MEM"); write_address("SP"); break;  // decrement SP, push C
        case EXEC_START + 9: read("F"); break;  // end memory write, output F
        case EXEC_START + 10: read("F"); write("MEM"); write_address("SP"); break;  // decrement SP, push F
        case EXEC_START + 11: read("B"); break;  // end memory write, output B
        case EXEC_START + 12: read("B"); write("MEM"); write_address("SP"); break;  // decrement SP, push B
        case EXEC_START + 13: read("A"); break;  // end memory write, output A
        case EXEC_START + 14: read("A"); write("MEM"); write_address("SP"); next = FETCH_START; break;  // decrement SP, push A
    }
}

function pop_nn() {  // 2 additional bytes: nn
    next = state + 1;
    read("MEM"); addr_oper("INC");  // same for almost all states
    switch(state) {
        case EXEC_START + 0: write("ADDR_L"); set_address("SP"); write_address("PC"); break;  // store nl in ADDR_L, increment PC, switch to SP
        case EXEC_START + 1: write("ADDR_H"); set_address("SP"); write_address("SP"); break;  // pop value into ADDR_H, increment SP
        case EXEC_START + 2: write("ADDR_STORE"); set_address("DIR"); break;  // pass ADDR_H via address bus and capture it
        case EXEC_START + 3: set_address("PC"); break;  // switch to PC
        case EXEC_START + 4: read("ADDR_H"); write("ADDR_H"); set_address("DIR"); write_address("PC"); break;  // store nh in ADDR_H, increment PC
        case EXEC_START + 5: read("ADDR_H"); write("MEM"); set_address("DIR"); next = FETCH_START; break;  // load data from ADDR_H to location (nn)
    }
}

// Another bug spotted: when popping F, flags source has to be set to data bus! The amount of traps here is just astonishing!!!
function pop8(reg) {  // no additional bytes
    next = state + 1;
    read("MEM"); set_address("SP"); addr_oper("INC"); flags_src("BUS"); // same for all states
    switch(state) { //                                       ^- bug fix
        case EXEC_START + 0: break;  // wait until address is stable
        case EXEC_START + 1: write(reg); write_address("SP"); next = FETCH_START; break;  // restore register value, increment SP
    }
}

function pop_CD() {  // no additional bytes
    next = state + 1;
    read("MEM"); set_address("SP"); addr_oper("INC");  // same for all states
    switch(state) {
        case EXEC_START + 0: break;  // wait until address is stable
        case EXEC_START + 1: write("C"); write_address("SP"); break;  // restore C reg value, increment SP
        case EXEC_START + 2: write("D"); write_address("SP"); next = FETCH_START; break;  // restore D reg value, increment SP
    }
}

function pop_DP() {  // no additional bytes
    next = state + 1;
    read("MEM"); set_address("SP"); addr_oper("INC");  // same for almost all states
    switch(state) {
        case EXEC_START + 0: break;  // wait until address is stable
        case EXEC_START + 1: write("ADDR_L"); write_address("SP"); break;  // write ADDR_L, increment SP
        case EXEC_START + 2: write("ADDR_H"); write_address("SP"); addr_oper("LOAD"); break;  // write ADDR_H, increment SP
        case EXEC_START + 3: latch_int_start_opcode_fetch(); write_address("DP"); next = LATCH_IR; break;  // restore DP, fetch next opcode to save a clock cycle
    }
}

function pop_all() {  // no additional bytes
    next = state + 1;
    read("MEM"); set_address("SP"); addr_oper("INC");  // same for almost all states
    switch(state) {
        case EXEC_START + 0: break;  // wait until address is stable
        case EXEC_START + 1: write("A"); write_address("SP");break;  // restore A reg value, increment SP
        case EXEC_START + 2: write("B"); write_address("SP"); break;  // restore B reg value, increment SP
        case EXEC_START + 3: write("F"); write_address("SP"); break;  // restore F reg value, increment SP
        case EXEC_START + 4: write("C"); write_address("SP"); break;  // restore C reg value, increment SP
        case EXEC_START + 5: write("D"); write_address("SP"); break;  // restore D reg value, increment SP
        case EXEC_START + 6: write("ADDR_L"); write_address("SP"); break;  // write ADDR_L, increment SP
        case EXEC_START + 7: write("ADDR_H"); write_address("SP"); addr_oper("LOAD"); break;  // write ADDR_H, increment SP
        case EXEC_START + 8: latch_int_start_opcode_fetch(); write_address("DP"); next = LATCH_IR; break;  // restore DP, fetch next opcode to save a clock cycle
    }
}

function alu_A_reg(src_reg, opcode, include_carry) {  // no additional bytes
    next = state + 1;
    alu_oper(opcode); oper_carry(include_carry); flags_src("ALU");  // same for all states
    if(!include_carry) {
        if(src_reg == "B") {
            if(opcode == "ADD") {  // default operation, no need to wait for opcode to stabilize
                switch(state) {
                    case EXEC_START + 0: read("ALU_L"); write("F"); break;  // data was already stable, so flags can be updated instantly
                    case EXEC_START + 1: write("A"); next = FETCH_START; break;
                }
            }
            else {
                switch(state) {
                    case EXEC_START + 0: break;  // wait until opcode is stable
                    case EXEC_START + 1: read("ALU_L"); write("F"); break;  // update flags, start reading the result
                    case EXEC_START + 2: write("A"); next = FETCH_START; break;
                }
            }
        }
        else if(src_reg == "A") {
            switch(state) {
                case EXEC_START + 0: read(src_reg); write("A_STORE"); break;  // start reading src_reg and capture A reg value
                case EXEC_START + 1: read(src_reg); write("B_STORE"); break;  // capture B reg value
                case EXEC_START + 2: read(src_reg); write("B"); break;  // load src_reg into B reg
                case EXEC_START + 3: read("ALU_L"); write("F"); break;  // update flags, start reading the result
                case EXEC_START + 4: read("B"); write("A"); break;  // write result into A, start reading captured B
                case EXEC_START + 5: read("B"); write("B"); next = FETCH_START; break;  // restore B
            }
        }
        else {
            switch(state) {
                case EXEC_START + 0: read(src_reg); write("B_STORE"); break;  // start reading src_reg and capture B reg value
                case EXEC_START + 1: read(src_reg); write("B"); break;  // load src_reg into B reg
                case EXEC_START + 2: read("ALU_L"); write("F"); break;  // update flags, start reading the result
                case EXEC_START + 3: read("B"); write("A"); break;  // write result into A, start reading captured B
                case EXEC_START + 4: read("B"); write("B"); next = FETCH_START; break;  // restore B
            }
        }
    }
    else {  // ADDC / SUBB result depends on flags, flags depend on result. So the result must be temporarily stored in ADDR_L before flags are updated. Fuck it!
        if(src_reg == "B") {
            switch(state) {
                case EXEC_START + 0: read("ALU_L"); break;  // start reading the result
                case EXEC_START + 1: read("ALU_L"); write("ADDR_L"); set_address("DIR"); break;  // store result in ADDR_L
                case EXEC_START + 2: read("ADDR_L"); write("ADDR_STORE"); set_address("DIR"); break;  // pass result to readable ADDR_L
                case EXEC_START + 3: read("ADDR_L"); write("F"); set_address("DIR"); break;  // update flags
                case EXEC_START + 4: read("ADDR_L"); write("A"); next = FETCH_START; break;  // store the result in A
            }
        }
        else if(src_reg == "A") {
            switch(state) {
                case EXEC_START + 0: read(src_reg); write("A_STORE"); break;  // start reading src_reg and capture A reg value
                case EXEC_START + 1: read(src_reg); write("B_STORE"); break;  // capture B reg value
                case EXEC_START + 2: read("ALU_L"); write("B"); break;  // load src_reg into B reg
                case EXEC_START + 3: read("ALU_L"); write("ADDR_L"); set_address("DIR"); break;  // store result in ADDR_L
                case EXEC_START + 4: read("ADDR_L"); write("ADDR_STORE"); set_address("DIR"); break;  // pass result to readable ADDR_L, start reading it
                case EXEC_START + 5: read("ADDR_L"); write("F"); set_address("DIR"); break;  // update flags
                case EXEC_START + 6: read("B"); write("A"); break;  // write result into A, start reading captured B
                case EXEC_START + 7: read("B"); write("B"); next = FETCH_START; break;  // restore B
            }
        }
        else {
            switch(state) {
                case EXEC_START + 0: read(src_reg); write("B_STORE"); break;  // start reading src_reg and capture B reg value
                case EXEC_START + 1: read("ALU_L"); write("B"); break;  // load src_reg into B reg
                case EXEC_START + 2: read("ALU_L"); write("ADDR_L"); set_address("DIR"); break;  // store result in ADDR_L
                case EXEC_START + 3: read("ADDR_L"); write("ADDR_STORE"); set_address("DIR"); break;  // pass result to readable ADDR_L, start reading it
                case EXEC_START + 4: read("ADDR_L"); write("F"); set_address("DIR"); break;  // update flags
                case EXEC_START + 5: read("B"); write("A"); break;  // write result into A, start reading captured B
                case EXEC_START + 6: read("B"); write("B"); next = FETCH_START; break;  // restore B
            }
        }
    }
}

function alu_reg_imm(dest_reg, opcode, include_carry) {  // 1 additional byte: n
    next = state + 1;
    alu_oper(opcode); oper_carry(include_carry); flags_src("ALU"); set_address("PC"); addr_oper("INC"); // same for almost all states
    if(!include_carry) {
        if(dest_reg == "A") {  // no need to restore A
            switch(state) {
                case EXEC_START + 0: read("MEM"); write("B_STORE"); break;  // capture B value
                case EXEC_START + 1: read("MEM"); write("B"); write_address("PC"); break;  // write n into B, increment PC
                case EXEC_START + 2: read("ALU_L"); write("F"); break;  // start reading the result, update flags
                case EXEC_START + 3: read("B"); write("A"); break;  // write result into A, start reading captured B
                case EXEC_START + 4: read("B"); write("B"); next = FETCH_START; break;  // restore B
            }
        }
        else if(dest_reg == "B") {  // no need to restore B
            switch(state) {
                case EXEC_START + 0: read(dest_reg); update_read_val(dest_reg); break;  // refresh dest_reg read value
                case EXEC_START + 1: read(dest_reg); write("A_STORE"); break;  // capture A value
                case EXEC_START + 2: read("MEM"); write("A"); break;  // write dest_reg into A
                case EXEC_START + 3: read("MEM"); write("B"); write_address("PC"); break;  // write n into B, increment PC
                case EXEC_START + 4: read("ALU_L"); write("F"); break;  // start reading the result, update flags
                case EXEC_START + 5: write(dest_reg); read("A"); break;  // write result into dest_reg, start reading captured A
                case EXEC_START + 6: read("A"); write("A"); next = FETCH_START; break;  // restore A
            }
        }
        else {
            switch(state) {
                case EXEC_START + 0: read(dest_reg); write("A_STORE"); break;  // capture A value
                case EXEC_START + 1: read(dest_reg); write("A"); break;  // write dest_reg into A
                case EXEC_START + 2: read("MEM"); write("B_STORE"); break;  // capture B value
                case EXEC_START + 3: read("MEM"); write("B"); write_address("PC"); break;  // write n into B, increment PC
                case EXEC_START + 4: read("ALU_L"); write("F"); break;  // start reading the result, update flags
                case EXEC_START + 5: write(dest_reg); read("A"); break;  // write result into dest_reg, start reading captured A
                case EXEC_START + 6: read("B"); write("A"); break;  // restore A
                case EXEC_START + 7: read("B"); write("B"); next = FETCH_START; break;  // restore B
            }
        }
    }
    else {
        if(dest_reg == "A") {  // no need to restore A
            switch(state) {
                case EXEC_START + 0: read("MEM"); write("B_STORE"); break;  // capture B value
                case EXEC_START + 1: read("ALU_L"); write("B"); write_address("PC"); break;  // write n into B, increment PC
                case EXEC_START + 2: read("ALU_L"); write("ADDR_L"); set_address("DIR"); break;  // store result in ADDR_L
                case EXEC_START + 3: read("ADDR_L"); write("ADDR_STORE"); set_address("DIR"); break;  // pass result to readable ADDR_L
                case EXEC_START + 4: read("ADDR_L"); write("F"); set_address("DIR"); break;  // update flags
                case EXEC_START + 5: read("B"); write("A"); break;  // write result into A, start reading captured B
                case EXEC_START + 6: read("B"); write("B"); next = FETCH_START; break;  // restore B
            }
        }
        else if(dest_reg == "B") {  // no need to restore B
            switch(state) {
                case EXEC_START + 0: read(dest_reg); update_read_val(dest_reg); break;  // refresh dest_reg read value
                case EXEC_START + 1: read(dest_reg); write("A_STORE"); break;  // capture A value
                case EXEC_START + 2: read("MEM"); write("A"); break;  // write dest_reg into A
                case EXEC_START + 3: read("ALU_L"); write("B"); write_address("PC"); break;  // write n into B, increment PC, start reading the result
                case EXEC_START + 4: read("ALU_L"); write("ADDR_L"); set_address("DIR"); break;  // store result in ADDR_L
                case EXEC_START + 5: read("ADDR_L"); write("ADDR_STORE"); set_address("DIR"); break;  // pass result to readable ADDR_L
                case EXEC_START + 6: read("ADDR_L"); write("F"); set_address("DIR"); break;  // update flags
                case EXEC_START + 7: read("A"); write(dest_reg); break;  // store the result in dest_reg
                case EXEC_START + 8: read("A"); write("A"); next = FETCH_START; break;  // restore A
            }
        }
        else {
            switch(state) {
                case EXEC_START + 0: read(dest_reg); write("A_STORE"); break;  // capture A value
                case EXEC_START + 1: read(dest_reg); write("A"); break;  // write dest_reg into A
                case EXEC_START + 2: read("MEM"); write("B_STORE"); break;  // capture B value
                case EXEC_START + 3: read("ALU_L"); write("B"); write_address("PC"); break;  // write n into B, increment PC, start reading the result
                case EXEC_START + 4: read("ALU_L"); write(dest_reg); break;  // write result into dest_reg
                case EXEC_START + 5: read("A"); write("F"); break;  // update flags
                case EXEC_START + 6: read("B"); write("A"); break;  // restore A
                case EXEC_START + 7: read("B"); write("B"); next = FETCH_START; break;  // restore B
            }
        }
    }
}

function alu_reg_imm_direct(dest_reg, opcode, direct_arg) {  // no additional bytes
    next = state + 1;
    alu_oper(opcode); oper_carry(false); flags_src("ALU"); // same for all states
    if(dest_reg == "A") {  // no need to restore A
        switch(state) {
            case EXEC_START + 0: drive_bus(direct_arg); write("B_STORE"); break;  // capture B value
            case EXEC_START + 1: read("ALU_L"); write("B"); break;  // write arg into B, start reading the result
            case EXEC_START + 2: read("ALU_L"); write("F"); break;  // update flags
            case EXEC_START + 3: read("B"); write("A"); break;  // write result into A, start reading captured B
            case EXEC_START + 4: read("B"); write("B"); next = FETCH_START; break;  // restore B
        }
    }
    else if(dest_reg == "B") {  // no need to restore B
        switch(state) {
            case EXEC_START + 0: read(dest_reg); update_read_val(dest_reg); break;  // refresh dest_reg read value
            case EXEC_START + 1: read(dest_reg); write("A_STORE"); break;  // capture A value
            case EXEC_START + 2: drive_bus(direct_arg); write("A"); break;  // write dest_reg into A
            case EXEC_START + 3: read("ALU_L"); write("B"); break;  // write arg into B, start reading the result
            case EXEC_START + 4: read("ALU_L"); write("F"); break;  // update flags
            case EXEC_START + 5: write(dest_reg); read("A"); break;  // write result into dest_reg, start reading captured A
            case EXEC_START + 6: read("A"); write("A"); next = FETCH_START; break;  // restore A
        }
    }
    else {
        switch(state) {
            case EXEC_START + 0: read(dest_reg); write("A_STORE"); break;  // capture A value
            case EXEC_START + 1: read(dest_reg); write("A"); break;  // write dest_reg into A
            case EXEC_START + 2: drive_bus(direct_arg); write("B_STORE"); break;  // capture B value
            case EXEC_START + 3: read("ALU_L"); write("B"); break;  // write arg into B, start reading the result
            case EXEC_START + 4: read("ALU_L"); write("F"); break;  // update flags
            case EXEC_START + 5: write(dest_reg); read("A"); break;  // write result into dest_reg, start reading captured A
            case EXEC_START + 6: read("B"); write("A"); break;  // restore A
            case EXEC_START + 7: read("B"); write("B"); next = FETCH_START; break;  // restore B
        }
    }
}

function alu_A_DP(opcode, include_carry) {  // no additional bytes
    next = state + 1;
    alu_oper(opcode); oper_carry(include_carry); flags_src("ALU"); set_address("DP"); // same for almost all states
    if(!include_carry) {
        switch(state) {
            case EXEC_START + 0: read("MEM"); write("B_STORE"); break;  // start reading the data, capture B
            case EXEC_START + 1: read("MEM"); write("B"); break;  // write data from (DP) into B
            case EXEC_START + 2: read("ALU_L"); write("F"); break;  // start reading the result, update flags
            case EXEC_START + 3: read("B"); write("A"); break;  // write the result into A, start reading B
            case EXEC_START + 4: write("B"); next = FETCH_START; break;  // restore B
        }
    }
    else {
        switch(state) {
            case EXEC_START + 0: read("MEM"); write("B_STORE"); break;  // start reading the data, capture B
            case EXEC_START + 1: read("ALU_L"); write("B"); break;  // write data from (DP) into B
            case EXEC_START + 2: read("ALU_L"); write("ADDR_L"); set_address("DIR"); break;  // store result in ADDR_L
            case EXEC_START + 3: read("ADDR_L"); write("ADDR_STORE"); set_address("DIR"); break;  // pass result to readable ADDR_L
            case EXEC_START + 4: read("ADDR_L"); write("F"); set_address("DIR"); break;  // update flags
            case EXEC_START + 5: read("B"); write("A"); break;  // write the result into A, start reading B
            case EXEC_START + 6: write("B"); next = FETCH_START; break;  // restore B
        }
    }
}

function alu_DP_A(opcode, include_carry) {  // no additional bytes
    next = state + 1;
    alu_oper(opcode); oper_carry(include_carry); flags_src("ALU"); set_address("DP"); // same for all states
    switch(state) {
        case EXEC_START + 0: read("A"); write("B_STORE"); break;  // capture B
        case EXEC_START + 1: read("A"); write("A_STORE"); break;  // capture A
        case EXEC_START + 2: read("MEM"); write("B"); break;  // write A into B, start reading data
        case EXEC_START + 3: read("ALU_L"); write("A"); break;  // write data from (DP) into A, start reading the result
        case EXEC_START + 4: read("ALU_L"); write("MEM"); break;  // write modified data back
        case EXEC_START + 5: read("A"); write("F"); break;  // update flags, start reading A
        case EXEC_START + 6: read("B"); write("A"); break;  // restore A, start reading B
        case EXEC_START + 7: read("B"); write("B"); next = FETCH_START; break;  // restore B
    }
}

function alu_DP_n(opcode, include_carry) {  // 1 additional byte: n
    next = state + 1;
    alu_oper(opcode); oper_carry(include_carry); flags_src("ALU"); set_address("DP"); // same for almost states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("B_STORE"); set_address("PC"); addr_oper("INC"); break;  // capture B
        case EXEC_START + 1: read("MEM"); write("B"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // load n into B, increment PC
        case EXEC_START + 2: read("MEM"); write("A_STORE"); break;  // capture A, switch to DP
        case EXEC_START + 3: read("ALU_L"); write("A"); break;  // write data from (DP) into A, start reading the result
        case EXEC_START + 4: read("ALU_L"); write("MEM"); break;  // write modified data back
        case EXEC_START + 5: read("A"); write("F"); break;  // update flags, start reading A
        case EXEC_START + 6: read("B"); write("A"); break;  // restore A, start reading B
        case EXEC_START + 7: read("B"); write("B"); next = FETCH_START; break;  // restore B
    }
}

function alu_DP_direct(opcode, include_carry, direct_arg) {  // no additional bytes
    next = state + 1;
    alu_oper(opcode); oper_carry(include_carry); flags_src("ALU"); set_address("DP"); // same for all states
    switch(state) {
        case EXEC_START + 0: write("A_STORE"); break;  // capture A
        case EXEC_START + 1: read("MEM"); write("B_STORE"); break;  // capture B, start reading data
        case EXEC_START + 2: drive_bus(direct_arg); write("A"); break;  // load data from (DP) into A, put direct_arg onto data bus
        case EXEC_START + 3: read("ALU_L"); write("B"); break;  // load direct_arg into B, start reading the result
        case EXEC_START + 4: read("ALU_L"); write("MEM"); break;  // write modified data back
        case EXEC_START + 5: read("A"); write("F"); break;  // update flags, start reading A
        case EXEC_START + 6: read("B"); write("A"); break;  // restore A, start reading B
        case EXEC_START + 7: read("B"); write("B"); next = FETCH_START; break;  // restore B
    }
}

function alu_imm_direct(opcode, include_carry, direct_arg) {  // 2 additional bytes: nn
    next = state + 1;
    alu_oper(opcode); oper_carry(include_carry); flags_src("ALU"); set_address("DIR"); // same for almost all states
    switch(state) {
        case EXEC_START + 0: write("ADDR_L"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // fetch ADDR_L, increment PC
        case EXEC_START + 1: write("ADDR_H"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // fetch ADDR_H, increment PC
        case EXEC_START + 2: write("A_STORE"); break;  // capture A
        case EXEC_START + 3: read("MEM"); write("B_STORE"); break;  // capture B, start reading data
        case EXEC_START + 4: drive_bus(direct_arg); write("A"); break;  // load data from (nn) into A, put direct_arg onto data bus
        case EXEC_START + 5: read("ALU_L"); write("B"); break;  // load direct_arg into B, start reading the result
        case EXEC_START + 6: read("ALU_L"); write("MEM"); break;  // write modified data back
        case EXEC_START + 7: read("A"); write("F"); break;  // update flags, start reading A
        case EXEC_START + 8: read("B"); write("A"); break;  // restore A, start reading B
        case EXEC_START + 9: read("B"); write("B"); next = FETCH_START; break;  // restore B
    }
}

function alu_CD_AB_flags(opcode, include_carry) {  // no additional bytes
    next = state + 1;
    alu_oper(opcode); oper_carry(include_carry); flags_src("ALU"); // same for almost all states
    switch(state) {
        case EXEC_START + 0: read("C"); write("A_STORE"); break;  // capture A
        case EXEC_START + 1: read("C"); write("B_STORE"); break;  // capture B
        case EXEC_START + 2: read("A"); write("A"); break;  // load C into A
        case EXEC_START + 3: read("A"); write("B"); break;  // load A into B
        case EXEC_START + 4: read("ALU_L"); write("F"); break;  // update flags after C oper A
        case EXEC_START + 5: read("D"); write("C"); break;  // store low byte in C
        case EXEC_START + 6: read("B"); write("A"); break;  // load D into A
        case EXEC_START + 7: read("ALU_L"); write("B"); oper_carry(true); break;  // restore B, include carry from previous operation
        case EXEC_START + 8: read("ALU_L"); write("D"); oper_carry(true); break;  // store high byte in D
        case EXEC_START + 9: read("A"); write("F"); oper_carry(true); break;  // update flags after D oper B
        case EXEC_START + 10: read("A"); write("A"); next = FETCH_START; break;  // restore A
    }
}

function alu_CD_nn(opcode, include_carry) {  // 2 additional bytes: nn
    next = state + 1;
    alu_oper(opcode); oper_carry(include_carry); flags_src("ALU"); set_address("PC"); addr_oper("INC"); // same for almost all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("A_STORE"); break;  // capture A
        case EXEC_START + 1: read("MEM"); write("B_STORE"); break;  // capture B
        case EXEC_START + 2: read("C"); write("B"); write_address("PC"); break;  // load nl into B, increment PC
        case EXEC_START + 3: read("ALU_L"); write("A"); break;  // load C into A
        case EXEC_START + 4: read("ALU_L"); write("F"); break;  // update flags after C oper A
        case EXEC_START + 5: read("MEM"); write("C"); break;  // store low byte in C
        case EXEC_START + 6: read("D"); write("B"); write_address("PC"); break;  // load nh into B, increment PC
        case EXEC_START + 7: read("ALU_L"); write("A"); oper_carry(true); break;  // load D into A
        case EXEC_START + 8: read("ALU_L"); write("D"); oper_carry(true); break;  // store high byte in D
        case EXEC_START + 9: read("A"); write("F"); oper_carry(true); break;  // update flags after D oper B
        case EXEC_START + 10: read("B"); write("A"); break;  // restore A
        case EXEC_START + 11: read("B"); write("B"); next = FETCH_START; break;  // restore B
    }
}

function alu_AB_AB(opcode) {  // no additional bytes
    next = state + 1;
    alu_oper(opcode); oper_carry(false); set_address("DIR"); // same for all states
    switch(state) {
        case EXEC_START + 0: read("ALU_L"); break;  // start reading low byte
        case EXEC_START + 1: read("ALU_L"); write("ADDR_L"); break;  // temporarily store low byte in ADDR_L
        case EXEC_START + 2: read("ALU_H"); write("ADDR_STORE"); break;  // capture ADDR
        case EXEC_START + 3: read("ADDR_L"); write("B"); break;  // write high byte into B, start reading ADDR_L
        case EXEC_START + 4: read("ADDR_L"); write("A"); next = FETCH_START; break;  // write low byte from ADDR_L into A
    }
}

function alu_CD_AB(opcode) {  // no additional bytes
    next = state + 1;
    alu_oper(opcode); oper_carry(false); // same for all states
    switch(state) {
        case EXEC_START + 0: read("ALU_L"); break;  // start reading low byte
        case EXEC_START + 1: read("ALU_H"); write("C"); break;  // write low byte into C, start reading high byte
        case EXEC_START + 2: read("ALU_H"); write("D"); next = FETCH_START; break;  // write high byte into D
    }
}

function alu_DPl_DPh(opcode) {  // no additional bytes
    next = state + 1;
    alu_oper(opcode); oper_carry(false); set_address("DP"); // same for all states
    switch(state) {
        case EXEC_START + 0: read("ALU_L"); write("MEM"); addr_oper("INC"); break;  // write low byte
        case EXEC_START + 1: read("ALU_L"); addr_oper("INC"); write_address("DP"); break;  // increment DP
        case EXEC_START + 2: read("ALU_H"); write("MEM"); addr_oper("DEC"); break;  // write high byte
        case EXEC_START + 3: latch_int_start_opcode_fetch(); write_address("DP"); next = LATCH_IR; break;  // decrement DP to restore it, fetch next opcode to save a clock cycle
    }
}

function alu_AB_A_imm(opcode) {  // 1 additional byte: n
    next = state + 1;
    alu_oper(opcode); oper_carry(false); set_address("DIR") // same for almost all states
    switch(state) {
        case EXEC_START + 0: read("ALU_L"); write("B"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // load n into B, increment PC
        case EXEC_START + 1: read("ALU_L"); write("ADDR_L"); break;  // temporarily store low byte in ADDR_L
        case EXEC_START + 2: read("ALU_H"); write("ADDR_STORE"); break;  // refresh ADDR read val, start reading high byte
        case EXEC_START + 3: read("ADDR_L"); write("B"); break;  // write high byte into B
        case EXEC_START + 4: read("ADDR_L"); write("A"); next = FETCH_START; break;  // write low byte from ADDR_L into A
    }
}

function alu_DIVNR() {  // no additional bytes
    next = state + 1;
    alu_oper("DIV"); oper_carry(false); // same for all states
    switch(state) {
        case EXEC_START + 0: read("ALU_L"); break;  // start reading the result
        case EXEC_START + 1: read("ALU_L"); write("A"); next = FETCH_START; break;  // write result into A
    }
}

function alu_EXTDIRL() {  // 1 additional byte: n
    next = state + 1;
    alu_oper("EXT"); oper_carry(false); // same for all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("B_STORE"); set_address("PC"); addr_oper("INC"); break;  // capture B
        case EXEC_START + 1: read("ALU_L"); write("B"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // load n into B, increment PC
        case EXEC_START + 2: read("B"); write("A"); break;  // store the result in A
        case EXEC_START + 3: read("B"); write("B"); next = FETCH_START; break;  // restore B
    }
}

function alu_MUL16_8() {  // no additional bytes
    next = state + 1;
    alu_oper("MUL"); oper_carry(false); flags_src("ALU"); set_address("DIR"); // same for all states
    switch(state) {
        case EXEC_START + 0: read("C"); write("B_STORE"); break;  // capture B
        case EXEC_START + 1: read("ALU_L"); write("B"); break;  // load C into B
        case EXEC_START + 2: read("ALU_H"); write("ADDR_L"); break;  // store low byte in ADDR_L (A*C_L)
        case EXEC_START + 3: read("B"); write("ADDR_H"); break;  // store 1st mid byte in ADDR_H (A*C_H)
        case EXEC_START + 4: read("ALU_H"); write("A"); break;  // load B into A
        case EXEC_START + 5: read("ALU_L"); write("C"); break;  // load high byte into C (B*C_H)
        case EXEC_START + 6: read("ALU_L"); write("B"); break;  // load 2nd mid byte into B (B*C_L)
        case EXEC_START + 7: read("ADDR_H"); write("ADDR_STORE"); break;  // capture ADDR
        case EXEC_START + 8: read("ADDR_H"); write("A"); break;  // transfer A*C_H to A
        case EXEC_START + 9: read("ALU_L"); write("F_STORE"); alu_oper("ADD"); break;  // capture flags
        case EXEC_START + 10: read("ALU_L"); write("F"); alu_oper("ADD"); break;  // update flags after A*C_H + B*C_L
        case EXEC_START + 11: read("C"); write("B"); alu_oper("ADD"); oper_carry(true); break;  // store A*C_H + B*C_L in B
        case EXEC_START + 12: read("C"); write("A"); alu_oper("ADD"); oper_carry(true); break;  // load C into A
        case EXEC_START + 13: drive_bus(0); write("B_STORE"); alu_oper("ADD"); oper_carry(true); break;  // capture B
        case EXEC_START + 14: read("ALU_L"); write("B"); alu_oper("ADD"); oper_carry(true); break;  // clear B
        case EXEC_START + 15: read("B"); write("C"); alu_oper("ADD"); oper_carry(true); break;  // C = C + carry
        case EXEC_START + 16: read("F"); write("B"); flags_src("BUS"); break;  // restore B with A*C_H + B*C_L
        case EXEC_START + 17: read("ADDR_L"); write("F"); flags_src("BUS"); break;  // restore flags
        case EXEC_START + 18: read("ADDR_L"); write("A"); next = FETCH_START; break;  // load A*C_L into A
    }
}

function cp_A_reg(src_reg) {
    next = state + 1;
    alu_oper("SUB"); oper_carry(false); flags_src("ALU"); // same for all states
    if(src_reg == "B") {
        switch(state) {
            case EXEC_START + 0: break;  // wait until opcode is stable
            case EXEC_START + 1: write("F"); next = FETCH_START;  // update flags
        }
    }
    else {
        switch(state) {
            case EXEC_START + 0: read(src_reg); write("B_STORE"); break;  // capture B value
            case EXEC_START + 1: read(src_reg); write("B"); break;  // load src_reg into B
            case EXEC_START + 2: read("B"); write("F"); break;  // update flags
            case EXEC_START + 3: read("B"); write("B"); next = FETCH_START; break;  // restore B
        }
    }
}

function cp_A_imm() {  // 1 additional byte: n
    next = state + 1;
    alu_oper("SUB"); oper_carry(false); flags_src("ALU"); addr_oper("INC"); set_address("PC");  // same for all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("B_STORE"); break;  // capture B
        case EXEC_START + 1: read("MEM"); write("B"); write_address("PC"); break;  // load n into B, increment PC
        case EXEC_START + 2: read("B"); write("F"); break;  // update flags
        case EXEC_START + 3: read("B"); write("B"); next = FETCH_START; break;  // restore B
    }
}

function cp_A_DP() {  // no additional bytes
    next = state + 1;
    alu_oper("SUB"); oper_carry(false); flags_src("ALU"); set_address("DP");  // same for all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("B_STORE"); break;  // capture B
        case EXEC_START + 1: read("MEM"); write("B"); break;  // load data from (DP) into B
        case EXEC_START + 2: read("B"); write("F"); break;  // update flags
        case EXEC_START + 3: read("B"); write("B"); next = FETCH_START; break;  // restore B
    }
}

function cp_DP_n() {  // 1 additional byte: n
    next = state + 1;
    alu_oper("SUB"); oper_carry(false); flags_src("ALU"); addr_oper("INC"); // same for all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("A_STORE"); set_address("PC"); break;  // capture A
        case EXEC_START + 1: read("MEM"); write("B_STORE"); set_address("PC"); break;  // capture B
        case EXEC_START + 2: read("MEM"); write("B"); set_address("DP"); write_address("PC"); break;  // load n into B, increment PC
        case EXEC_START + 3: read("MEM"); write("A"); set_address("DP"); break;  // load data from (DP) into A
        case EXEC_START + 4: read("A"); write("F"); break;  // update flags
        case EXEC_START + 5: read("B"); write("A"); break;  // restore A
        case EXEC_START + 6: read("B"); write("B"); next = FETCH_START; break;  // restore B
    }
}

function cp_reg_n(src_reg) {  // 1 additional byte: n
    next = state + 1;
    set_address("PC"); addr_oper("INC"); alu_oper("SUB"); oper_carry(false); flags_src("ALU"); // same for all states
    switch(state) {
        case EXEC_START + 0: read(src_reg); write("A_STORE"); break;  // capture A
        case EXEC_START + 1: read(src_reg); write("B_STORE"); break;  // capture B
        case EXEC_START + 2: read("MEM"); write("A"); break;  // write src_reg into A
        case EXEC_START + 3: read("MEM"); write("B"); write_address("PC"); break;  // load n into B, increment PC
        case EXEC_START + 4: read("A"); write("F"); break;  // update flags
        case EXEC_START + 5: read("B"); write("A"); break;  // restore A
        case EXEC_START + 6: read("B"); write("B"); next = FETCH_START; break;  // restore B
    }
}

function addr_alu(dest_reg, opcode) {  // no additional bytes
    next = state + 1;
    set_address(dest_reg); addr_oper(opcode); // same for all states
    switch(state) {
        case EXEC_START + 0: break;  // wait until opcode is stable
        case EXEC_START + 1: latch_int_start_opcode_fetch(); write_address(dest_reg); next = LATCH_IR; break;  // modify register, fetch next opcode to save a clock cycle
    }
}

function addr_alu_A(dest_reg, opcode) {  // no additional bytes
    next = state + 1;
    set_address(dest_reg); addr_oper(opcode); // same for all states
    switch(state) {
        case EXEC_START + 0: read("A"); write("A_STORE"); break;  // update A reg read value
        case EXEC_START + 1: read("A"); write("ADDR_L"); break;  // write A into ADDR_L
        case EXEC_START + 2: latch_int_start_opcode_fetch(); write_address(dest_reg); next = LATCH_IR; break;  // perform operation on dest_reg, fetch next opcode to save a clock cycle
    }
}

function addr_alu_n(dest_reg, opcode) {  // 1 additional byte: d
    next = state + 1;
    set_address(dest_reg); addr_oper(opcode); // same for almost all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("ADDR_L"); write_address("PC"); break;  // load n into ADDR_L, increment PC
        case EXEC_START + 1: latch_int_start_opcode_fetch(); write_address(dest_reg); next = LATCH_IR; break;  // perform operation on dest_reg, fetch next opcode to save a clock cycle
    }
}

function test_A_bits() {  // 1 additional byte: n
    next = state + 1;
    alu_oper("AND"); oper_carry(false); flags_src("ALU");  // same for all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("B_STORE"); set_address("PC"); addr_oper("INC"); break;  // capture B
        case EXEC_START + 1: read("MEM"); write("B"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // load n into B, increment PC
        case EXEC_START + 2: read("B"); write("F"); break;  // update flags
        case EXEC_START + 3: read("B"); write("B"); next = FETCH_START; break;  // restore B
    }
}

function reg_clr(dest_reg) {  // no additional bytes
    next = state + 1;
    switch(state) {
        case EXEC_START + 0: drive_bus(0); break;  // put 0 onto data bus
        case EXEC_START + 1: drive_bus(0); write(dest_reg); next = FETCH_START; break;  // write 0 to dest_reg
    }
}

function djnz_rel_addr() {  // 1 additional byte: d
    next = state + 1;
    alu_oper("ADD"); oper_carry(false); flag_sel("Z"); flags_src("ALU"); set_address("PC"); addr_oper("INC"); // same for almost all states
    switch(state) {
        case EXEC_START + 0: drive_bus(0xFF); write("A_STORE"); break;  // capture A
        case EXEC_START + 1: read("ALU_L"); write("A"); break;  // write 0xFF into A
        case EXEC_START + 2: read("ALU_L"); write("F_STORE"); break;  // capture flags
        case EXEC_START + 3: read("ALU_L"); write("F"); break;  // update flags
        case EXEC_START + 4: read("MEM"); write("B"); break;  // decrement B (255 + B results in B - 1 and zero flag set if B was 1 before decrement)
        case EXEC_START + 5: read("A"); write("ADDR_L"); write_address("PC"); break;  // load d into ADDR_L, increment PC
        case EXEC_START + 6: read("F"); write("A"); addr_oper("ADD"); flags_src("BUS"); break;  // restore A
        case EXEC_START + 7: {
            if(!flag) {  // 255 + B is not 0, so B must have been greater than 1 (or was 0 for 256 repetitions)
                read("F"); flags_src("BUS"); write("F"); addr_oper("ADD"); write_address("PC"); next = FETCH_START; break;  // restore F, add d to PC
            }
            else {  // 255 + B is 0, so B must have been 1 before and now it is 0
                read("F"); flags_src("BUS"); write("F"); next = FETCH_START; break;  // restore F and exit
            }
        }
        break;
    }
}

function cond_jump_imm_addr(tested_flag, state_to_jump, bypass) {  // 2 additional bytes: nn
    next = state + 1;
    read("MEM"); set_address("PC"); flag_sel(tested_flag); // same for all states
    switch(state) {
        case EXEC_START + 0: addr_oper("INC"); write("ADDR_L"); write_address("PC"); break;  // write ADDR_L, increment PC
        case EXEC_START + 1: addr_oper("LOAD"); write("ADDR_H"); write_address("PC"); break;  // write ADDR_H, increment PC
        case EXEC_START + 2: {
            latch_int_start_opcode_fetch();  // fetch next opcode to save a clock cycle
            if(flag == state_to_jump || bypass) {  // condition met
                write_address("PC");  // perform a jump
            }
            next = LATCH_IR;
        }
        break;
    }
}

function cond_jump_rel_addr(tested_flag, state_to_jump, bypass) {  // 1 additional byte: d
    next = state + 1;
    read("MEM"); set_address("PC"); flag_sel(tested_flag); // same for all states
    switch(state) {
        case EXEC_START + 0: addr_oper("ADD"); write("ADDR_L"); write_address("PC"); break;  // write ADDR_L, increment PC
        case EXEC_START + 1: {
            latch_int_start_opcode_fetch();  // fetch next opcode to save a clock cycle
            if(flag == state_to_jump || bypass) {  // condition met
                write_address("PC");  // perform a jump
            }
            next = LATCH_IR;
        }
        break;
    }
}

function call_DP_plus_d() {  // no additional bytes
    next = state + 1;
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("ADDR_L"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // load d into ADDR_L, increment PC
        case EXEC_START + 1: read("ADDR_H"); write("ADDR_STORE"); set_address("PC"); break;  // capture return address
        case EXEC_START + 2: read("ADDR_H"); set_address("DP"); addr_oper("ADD"); break;  // switch to DP to get DP + d at PC latch input
        case EXEC_START + 3: read("ADDR_H"); set_address("SP"); addr_oper("DEC"); write_address("PC"); break;  // load DP + d into PC, switch to SP
        case EXEC_START + 4: read("ADDR_H"); write("MEM"); set_address("SP"); addr_oper("DEC"); write_address("SP"); break;  // decrement SP, push PC high
        case EXEC_START + 5: read("ADDR_H"); set_address("SP"); addr_oper("DEC"); break;  // end memory write
        case EXEC_START + 6: read("ADDR_L"); write("MEM"); set_address("SP"); addr_oper("DEC"); write_address("SP"); next = FETCH_START; break;  // decrement SP, push PC low
    }
}

function cond_call_imm(tested_flag, bypass) {  // 2 additional bytes: nn
    next = state + 1;
    flag_sel(tested_flag);  // same for all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("ADDR_L"); set_address("PC"); addr_oper("INC"); write_address("PC"); break;  // fetch ADDR_L and increment PC
        case EXEC_START + 1: {
            read("MEM"); write("ADDR_H"); set_address("PC"); addr_oper("INC"); write_address("PC");  // fetch ADDR_H and increment PC
            if(!flag && !bypass) next = FETCH_START;  // if condition not met, exit here
        }
        break;
        case EXEC_START + 2: read("MEM"); write("ADDR_STORE"); set_address("PC"); addr_oper("LOAD"); break;  // capture return address
        case EXEC_START + 3: read("ADDR_H"); set_address("SP"); addr_oper("DEC"); write_address("PC"); break;  // load call address into PC, switch to SP
        case EXEC_START + 4: read("ADDR_H"); write("MEM"); set_address("SP"); addr_oper("DEC"); write_address("SP"); break;  // decrement SP, push PC high
        case EXEC_START + 5: read("ADDR_H"); set_address("SP"); addr_oper("DEC"); break;  // end memory write
        case EXEC_START + 6: read("ADDR_L"); write("MEM"); set_address("SP"); addr_oper("DEC"); write_address("SP"); next = FETCH_START; break;  // decrement SP, push PC low
    }
}

function cond_call_rel(tested_flag, bypass) {  // 1 additional byte: d
    next = state + 1;
    flag_sel(tested_flag);  // same for all states
    switch(state) {
        case EXEC_START + 0: {
            read("MEM"); write("ADDR_L"); set_address("PC"); addr_oper("INC"); write_address("PC");  // fetch d and increment PC
            if(!flag && !bypass) next = FETCH_START;  // if condition not met, exit here
        }
        break;
        case EXEC_START + 1: read("MEM"); write("ADDR_STORE"); set_address("PC"); addr_oper("ADD"); break;  // capture return address
        case EXEC_START + 2: read("ADDR_H"); set_address("SP"); addr_oper("DEC"); write_address("PC"); break;  // add d to PC, switch to SP
        case EXEC_START + 3: read("ADDR_H"); write("MEM"); set_address("SP"); addr_oper("DEC"); write_address("SP"); break;  // decrement SP, push PC high
        case EXEC_START + 4: read("ADDR_H"); set_address("SP"); addr_oper("DEC"); break;  // end memory write
        case EXEC_START + 5: read("ADDR_L"); write("MEM"); set_address("SP"); addr_oper("DEC"); write_address("SP"); next = FETCH_START; break;  // decrement SP, push PC low
    }
}

function cond_ret(tested_flag, bypass) {  // no additional bytes
    next = state + 1;
    flag_sel(tested_flag); read("MEM"); set_address("SP"); addr_oper("INC");  // same for almost all states
    switch(state) {
        case EXEC_START + 0: break;  // wait until flag is stable
        case EXEC_START + 1: {
            if(!flag && !bypass) {
                next = FETCH_START;  // if condition not met, exit here
            }
            else {
                write("ADDR_L"); write_address("SP");  // pop ADDR_L and increment SP
            }
        }
        break;
        case EXEC_START + 2: write("ADDR_H"); write_address("SP"); addr_oper("LOAD"); break;  // pop ADDR_H and increment SP
        case EXEC_START + 3: latch_int_start_opcode_fetch(); write_address("PC"); next = LATCH_IR; break;  // restore PC, no need to set address to PC for LOAD; fetch next opcode to save a clock cycle
    }
}

function reti() {  // no additional bytes
    next = state + 1;
    read("MEM"); set_address("SP"); addr_oper("INC");  // same for almost all states
    switch(state) {
        case EXEC_START + 0: break;  // wait until address is stable
        case EXEC_START + 1: write("ADDR_L"); write_address("SP"); break;  // pop ADDR_L and increment SP
        case EXEC_START + 2: set_interrupts(true); write("ADDR_H"); addr_oper("LOAD"); write_address("SP"); break;  // pop ADDR_H and increment SP
        case EXEC_START + 3: write("IE_LATCH"); set_address("PC"); write_address("PC"); next = LATCH_IR; break;  // restore PC, enable interrupts
        // skip FETCH_START and go directly to LATCH_IR to execute at least one main program instruction between interrupts
    }
}

function out_dev_reg(src_reg) {  // 1 additional byte: s
    next = state + 1;
    addr_oper("INC");  // same for all states
    switch(state) {
        case EXEC_START + 0: drive_bus(0x80); write("ADDR_L"); set_address("PC"); write_address("PC"); break;  //  load s into ADDR_L, increment PC
        case EXEC_START + 1: drive_bus(0x80); write("ADDR_H"); set_address("PC"); break;  // load 0x80 into ADDR_H
        case EXEC_START + 2: read(src_reg); update_read_val(src_reg); set_address("DIR"); break;  // refresh src_reg read value, select the device
        case EXEC_START + 3: read(src_reg); write("MEM"); set_address("DIR"); break;  // start I/O write
        case EXEC_START + 4: read(src_reg); set_address("DIR"); break;  // end I/O write, keep valid address & data
        case EXEC_START + 5: read("NONE"); write("NONE"); set_address("PC"); next = FETCH_START; break;  // make sure device is safely deselected
    }
}

function out_dev_imm() {  // 2 additional bytes: val, s
    next = state + 1;
    addr_oper("INC");  // same for all states
    switch(state) {
        case EXEC_START + 0: read("NONE"); write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // load val into ADDR_L, increment PC
        case EXEC_START + 1: read("NONE"); write("ADDR_STORE"); set_address("DIR"); break;  // capture ADDR_L
        case EXEC_START + 2: drive_bus(0x80); set_address("PC"); break;  // put 0x80 onto address bus, switch to PC to prevent glitches when read starts
        case EXEC_START + 3: read("MEM"); write("ADDR_H"); set_address("PC"); break;  // load 0x80 into ADDR_H
        case EXEC_START + 4: read("ADDR_L"); write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // load s into ADDR_L, increment PC
        case EXEC_START + 5: read("ADDR_L"); set_address("DIR"); break;  // data & address setup
        case EXEC_START + 6: read("ADDR_L"); write("MEM"); set_address("DIR"); break;  // start I/O write
        case EXEC_START + 7: read("ADDR_L"); set_address("DIR"); break;  // end I/O write, keep valid address & data
        case EXEC_START + 8: read("NONE"); write("NONE"); set_address("PC"); next = FETCH_START; break;  // make sure device is safely deselected
    }
}

function out_dev_DP() {  // 1 additional byte: s
    next = state + 1;
    addr_oper("INC");  // same for all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); set_address("DP"); break;  // switch to DP
        case EXEC_START + 1: read("NONE"); write("ADDR_L"); set_address("DP"); break;  // load data from (DP) into ADDR_L
        case EXEC_START + 2: write("ADDR_STORE"); set_address("DIR"); break;  // capture ADDR
        case EXEC_START + 3: read("NONE"); set_address("PC"); break;  // change address before initiating read to prevent glitches
        case EXEC_START + 4: read("MEM"); set_address("PC"); break;   // read s
        case EXEC_START + 5: drive_bus(0x80); write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // load s into ADDR_L, increment PC
        case EXEC_START + 6: read("ADDR_L"); write("ADDR_H"); set_address("DIR"); break;  // load 0x80 into ADDR_H, set valid address & data
        case EXEC_START + 7: read("ADDR_L"); write("MEM"); set_address("DIR"); break;  // start I/O write
        case EXEC_START + 8: read("ADDR_L"); set_address("DIR"); break;  // end I/O write
        case EXEC_START + 9: read("NONE"); write("NONE"); set_address("PC"); next = FETCH_START; break;  // make sure device is safely deselected
    }
}

function out_dev_oper_DP(opcode) {  // 1 additional byte: s
    next = state + 1;
    addr_oper("INC");  // same for almost all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); set_address("DP"); addr_oper(opcode); break;  // switch to DP
        case EXEC_START + 1: read("NONE"); write("ADDR_L"); set_address("DP"); addr_oper(opcode); write_address("DP"); break;  // load data from (DP) into ADDR_L, modify DP
        case EXEC_START + 2: write("ADDR_STORE"); set_address("DIR"); break;  // capture ADDR
        case EXEC_START + 3: read("NONE"); set_address("PC"); break;  // change address before initiating read to prevent glitches
        case EXEC_START + 4: read("MEM"); set_address("PC"); break;   // read s
        case EXEC_START + 5: drive_bus(0x80); write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // load s into ADDR_L, increment PC
        case EXEC_START + 6: read("ADDR_L"); write("ADDR_H"); set_address("DIR"); break;  // load 0x80 into ADDR_H, set valid address & data
        case EXEC_START + 7: read("ADDR_L"); write("MEM"); set_address("DIR"); break;  // start I/O write
        case EXEC_START + 8: read("ADDR_L"); set_address("DIR"); break;  // end I/O write
        case EXEC_START + 9: read("NONE"); write("NONE"); set_address("PC"); next = FETCH_START; break;  // make sure device is safely deselected
    }
}

function in_reg_dev(dest_reg) {  // 1 additional byte: s
    next = state + 1;
    addr_oper("INC");  // same for all states
    switch(state) {
        case EXEC_START + 0: drive_bus(0x80); write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // load s into ADDR_L, put 0x80 onto data bus, increment PC
        case EXEC_START + 1: drive_bus(0x80); write("ADDR_H"); set_address("DIR"); break;  // load 0x80 into ADDR_H, select the device
        case EXEC_START + 2: read("MEM"); set_address("DIR"); break;  // start reading from I/O when address is stable
        case EXEC_START + 3: write(dest_reg); set_address("DIR"); break;  // write dest_reg, end read pulse but keep the address
        case EXEC_START + 4: read("NONE"); write("NONE"); set_address("PC"); next = FETCH_START; break;  // make sure device is safely deselected
    }
}

function in_DP_dev() {  // 1 additional byte: s
    next = state + 1;
    addr_oper("INC");  // same for all states
    switch(state) {
        case EXEC_START + 0: drive_bus(0x80); write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // load s into ADDR_L, increment PC
        case EXEC_START + 1: drive_bus(0x80); write("ADDR_H"); set_address("DIR"); break;  // load 0x80 into ADDR_H, select the device
        case EXEC_START + 2: read("MEM"); set_address("DIR"); break;   // start reading I/O data
        case EXEC_START + 3: write("ADDR_L"); set_address("DIR"); break;  // store read value in ADDR_L, end read pulse but keep the address
        case EXEC_START + 4: write("ADDR_STORE"); set_address("DIR"); break;  // capture read value
        case EXEC_START + 5: read("ADDR_L"); set_address("DP"); break;  // safely deselect the device
        case EXEC_START + 6: read("ADDR_L"); write("MEM"); set_address("DP"); next = FETCH_START; break;  // store read value at (DP)
    }
}

function in_oper_DP_dev(opcode) {  // 1 additional byte: s
    next = state + 1;
    addr_oper("INC");  // same for all states
    switch(state) {
        case EXEC_START + 0: drive_bus(0x80); write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // load s into ADDR_L, increment PC
        case EXEC_START + 1: drive_bus(0x80); write("ADDR_H"); set_address("DIR"); break;  // load 0x80 into ADDR_H, select the device
        case EXEC_START + 2: read("MEM"); set_address("DIR"); break;   // start reading I/O data
        case EXEC_START + 3: write("ADDR_L"); set_address("DIR"); break;  // store read value in ADDR_L, end read pulse but keep the address
        case EXEC_START + 4: read("ADDR_L"); write("ADDR_STORE"); set_address("DIR"); break;  // capture read value
        case EXEC_START + 5: read("ADDR_L"); set_address("DP"); break;  // safely deselect the device
        case EXEC_START + 6: read("ADDR_L"); write("MEM"); set_address("DP"); addr_oper(opcode); break;  // store read value at (DP)
        case EXEC_START + 7: read("ADDR_L"); set_address("DP"); addr_oper(opcode); write_address("DP"); next = FETCH_START; break;  // modify DP
    }
}

function rd_modif_wr_dev_direct(opcode, arg) {  // 1 additional byte: s
    next = state + 1;
    alu_oper(opcode); flags_src("ALU"); oper_carry(false); addr_oper("INC");  // same for all states
    switch(state) {
        case EXEC_START + 0: drive_bus(0x80); write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // load s into ADDR_L, increment PC
        case EXEC_START + 1: drive_bus(0x80); write("ADDR_H"); set_address("PC"); break;  // load 0x80 into ADDR_H
        case EXEC_START + 2: write("A_STORE"); set_address("PC"); break;  // capture A
        case EXEC_START + 3: drive_bus(arg); write("B_STORE"); set_address("DIR"); break;  // capture B, select the device
        case EXEC_START + 4: read("MEM"); write("B"); set_address("DIR"); break;  // load arg into B, start I/O read
        case EXEC_START + 5: read("ALU_L"); write("A"); set_address("DIR"); break;  // load data from I/O into A
        case EXEC_START + 6: read("ALU_L"); write("MEM"); set_address("DIR"); break;  // write modified data back
        case EXEC_START + 7: read("ALU_L"); write("F"); set_address("DIR"); break;  // end write, keep the data, update flags
        case EXEC_START + 8: read("A"); set_address("PC"); break;  // start reading A, safely deselect the device
        case EXEC_START + 9: read("B"); write("A"); set_address("PC"); break;  // restore A
        case EXEC_START + 10: read("B"); write("B"); set_address("PC"); next = FETCH_START; break;  // restore B
    }
}

function rd_modif_wr_dev_A(opcode) {  // 1 additional byte: s
    next = state + 1;
    alu_oper(opcode); flags_src("ALU"); oper_carry(false); addr_oper("INC");  // same for all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("B_STORE"); set_address("PC"); break;  // capture B
        case EXEC_START + 1: drive_bus(0x80); write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // load s into ADDR_L, increment PC
        case EXEC_START + 2: drive_bus(0x80); write("ADDR_H"); set_address("DIR"); break;  // load 0x80 into ADDR_H, select the device
        case EXEC_START + 3: read("MEM"); set_address("DIR"); break;  // start I/O read
        case EXEC_START + 4: read("ALU_L"); write("B"); set_address("DIR"); break;  // load data from I/O into B
        case EXEC_START + 5: read("ALU_L"); write("MEM"); set_address("DIR"); break;  // write modified data back
        case EXEC_START + 6: read("ALU_L"); write("F"); set_address("DIR"); break;  // end write, keep the data, update flags
        case EXEC_START + 7: read("B"); set_address("PC"); break;  // start reading B, safely deselect the device
        case EXEC_START + 8: read("B"); write("B"); set_address("PC"); next = FETCH_START; break;  // restore B
    }
}

function rd_modif_wr_dev_n(opcode) {  // 2 additional bytes: s, arg
    next = state + 1;
    alu_oper(opcode); flags_src("ALU"); oper_carry(false); addr_oper("INC");  // same for all states
    switch(state) {
        case EXEC_START + 0: read("MEM"); write("A_STORE"); set_address("PC"); break;  // capture A
        case EXEC_START + 1: read("MEM"); write("B_STORE"); set_address("PC"); break;  // capture B
        case EXEC_START + 2: read("MEM"); write("ADDR_L"); set_address("PC"); write_address("PC"); break;  // load s into ADDR_L, increment PC
        case EXEC_START + 3: drive_bus(0x80); write("B"); set_address("PC"); write_address("PC"); break;  // load arg into B
        case EXEC_START + 4: drive_bus(0x80); write("ADDR_H"); set_address("DIR"); break;  // load 0x80 into ADDR_H, select the device
        case EXEC_START + 5: read("MEM"); set_address("DIR"); break;  // start I/O read
        case EXEC_START + 6: read("ALU_L"); write("A"); set_address("DIR"); break;  // load data from I/O into A
        case EXEC_START + 7: read("ALU_L"); write("MEM"); set_address("DIR"); break;  // write modified data back
        case EXEC_START + 8: read("ALU_L"); write("F"); set_address("DIR"); break;  // end write, keep the data, update flags
        case EXEC_START + 9: read("A"); set_address("PC"); break;  // start reading A, safely deselect the device
        case EXEC_START + 10: read("B"); write("A"); set_address("PC"); break;  // restore A
        case EXEC_START + 11: read("B"); write("B"); set_address("PC"); next = FETCH_START; break;  // restore B
    }
}

switch(EPROM_select) {
    case EPROM_A: {  // state counter
        D[2, 0, 3, 4, 6, 5] = next;
        D[1] = software_reset;
    }
    break;
    case EPROM_B: {  // address bus controller
        D[6, 7] = address_out;
        D[4, 5] = address_write;
        D[0, 3] = address_operation;
        D[1] = interrupt_ack;
        D[2] = data_read & 0x01;  // rd_sel0
    }
    break;
    case EPROM_C: {  // data bus controller
        D[4:6] = data_read >> 1;  // rd_sel3 - rd_sel1
        D[2:0, 3] = data_write;  // wr_sel3 - wr_sel0
        D[7] = !(data_write >> 3);  // !wr_sel3
    }
    break;
    case EPROM_D: {  // opcode & flags controller
        if(data_read == READ_TARGETS["BUS_DRIVE"]) {
            D[2:0, 3:7] = bus_value;
        }
        else {
            D[5:7] = flag_select;
            D[4] = with_carry;
            D[1, 0, 3] = alu_operation;
            D[2] = flags_source;
        }
    }
    break;
}
