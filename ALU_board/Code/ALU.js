/*
    ALU for EPROMINT CPU written by MINT: https://www.youtube.com/@__MINT_
    Use provided memory map generator software to compile it, two 512KB EPROMs are needed.
    Check provided schematics and documentation for details.
    
    This software comes with absolutely no warranty!
*/


A[18:0];    // address lines
D[7:0] = 0; // data lines

const HIGH_BYTE = true;  // selects either low or high EPROM

const ADD = 0;
const SUB = 1;
const MUL = 2;
const DIV = 3;
const AND = 4;
const OR = 5;
const XOR = 6;
const EXT = 7;

const INSERT_0s = 0;
const INSERT_1s = 1;
const SLICE = 2;
const LOGIC_MATH = 3;

const argA = A[0:7]
const argB = A[18, 17, 14, 13, 8, 9, 11, 10];
const ext_opcode = argB >> 6;
const ext_arg = argB & 0x3F;
const opcode = A[16, 15, 12];

let result = 0;
let result_signed = 0;
let remainder = 0;
let with_flags = true;

let carry_flag = false;
let overflow_flag = false;
let zero_flag = false;
let neg_flag = false;
let pos_flag = false;
let eq_flag = false;
let argA_lt_argB_flag = false;
let argA_gt_argB_flag = false;

let argA_signed = (argA & 0x7F) - (argA & 0x80);
let argB_signed = (argB & 0x7F) - (argB & 0x80);

switch(opcode) {
    case ADD:
        result = argA + argB;
        result_signed = argA_signed + argB_signed;
    break;
    case SUB:
        result = argA - argB;
        result_signed = argA_signed - argB_signed;
    break;
    case MUL:
        result = argA * argB;
        with_flags = false;
    break;
    case DIV:
        if(argB != 0) {
            result = Math.floor(argA / argB);
            remainder = argA % argB;
        }
        else if(argA != 0) {
            result = 0xFFFF;
            remainder = 0xFF;
        }
        else {
            result = 0;
            remainder = 0;
        }
        with_flags = false;
    break;
    case AND:
        result = argA & argB;
        result_signed = (result & 0x7F) - (result & 0x80);
    break;
    case OR:
        result = argA | argB;
        result_signed = (result & 0x7F) - (result & 0x80);
    break;
    case XOR:
        result = argA ^ argB;
        result_signed = (result & 0x7F) - (result & 0x80);
    break;
    case EXT:  // extended operation
        result = handle_extended();
        with_flags = false;
    break;
}


carry_flag = (result > 255 || result < 0);
overflow_flag = (result_signed > 127 || result_signed < -128);
zero_flag = ((result & 0xFF) == 0);
result_signed = (result_signed & 0x7F) - (result_signed & 0x80);  // truncate result_signed to 8 bits
neg_flag = (result_signed < 0);
pos_flag = (result_signed > 0);
eq_flag = (argA == argB);
argA_lt_argB_flag = (argA < argB);
argA_gt_argB_flag = (argA > argB);


if(HIGH_BYTE) {
    if(with_flags) {
        D[3] = argA_gt_argB_flag;
        D[4] = argA_lt_argB_flag;
        D[5] = eq_flag;
        D[6] = pos_flag;
        D[7] = neg_flag;
        D[2] = zero_flag;
        D[1] = overflow_flag;
        D[0] = carry_flag;
    }
    else {
        D[3:7, 2:0] = (opcode == DIV) ? remainder : (result >> 8) & 0xFF;
    }
}
else {
    D[3:7, 2:0] = result & 0xFF;
}

function handle_extended() {
    switch(ext_opcode) {
        case SLICE: {  // bit slicing (10lllsss, where: l - slice length; s - start bit; MSB is 0, LSB is 7)
            const slice_len = (ext_arg >> 3) & 0x07;
            const slice_start = ext_arg & 0x07;
            const mask = 0xFF >> (8 - slice_len);
            const shift_by = 8 - slice_start - slice_len;
            const remaining = (shift_by < 0) ? -shift_by : 0;
            return (remaining << 8) | (shift_right_signed(argA, shift_by) & mask);
        }
        case INSERT_0s:  
        case INSERT_1s: {  // mask for bit insertion (0tlllsss, where: t - mask type (0 - reset, 1 - set); l - insert length; s - start bit; MSB is 0, LSB is 7)
            const insert_len = (ext_arg >> 3) & 0x07;
            const insert_start = ext_arg & 0x07;
            const mask = 0xFF >> (8 - insert_len);
            const shift_by = 8 - insert_start - insert_len;
            const remaining = (shift_by < 0) ? -shift_by : 0;
            const input_remain_mask = 0xFF >> (8 - remaining);
            const input_masked = argA & mask;
            const input_remaining = argA & input_remain_mask;
            const mask_adj = shift_left_signed(mask, shift_by);
            const input_adj = shift_left_signed(input_masked, shift_by);
            const mask_remain_adj = input_remain_mask << (8 - remaining);
            const input_remain_adj = input_remaining << (8 - remaining);
            const final_mask = (ext_opcode == INSERT_0s) ? ((~mask_adj & 0xFF) | input_adj) : (mask_adj & input_adj);
            const remaining_mask = (ext_opcode == INSERT_0s) ? ((~mask_remain_adj & 0xFF) | input_remain_adj) : (mask_remain_adj & input_remain_adj);
            return (remaining_mask << 8) | final_mask;
        }
        case LOGIC_MATH: {  // bitwise, arithmetic and mathematical operations
            const oper_type = (ext_arg >> 3) & 0x07;
            const oper_arg = ext_arg & 0x07;
            switch(oper_type) {
                case 0:  // left shift
                    return argA << oper_arg;
                    
                case 1: { // right shift
                    let result_shift = argA >> oper_arg;
                    let result_overflow = ((argA << 8) >> oper_arg) & 0xFF;
                    return (result_overflow << 8) | result_shift;
                }
                    
                case 2:  // rotate left
                    return ((argA << oper_arg) | (argA >> (8 - oper_arg))) & 0xFF;
                    
                case 3:  // rotate right
                    return ((argA >> oper_arg) | (argA << (8 - oper_arg))) & 0xFF;
                
                default:  // different argument syntax
                    const oper_select = ext_arg & 0x1F;
                    const argA_norm_1 = argA / 256;
                    const argA_signed_norm_1 = argA_signed / 128;
                    const argA_to_rad = argA_signed_norm_1 * Math.PI;
                    const rad_normalize_16 = 32768 / Math.PI;
                    switch(oper_select) {  // up to 32 additional operations
                        case 0:  // bitwise negation
                            return ~argA;
                            
                        case 1:  // swap nibbles
                            return ((argA & 0x0F) << 4) | ((argA >> 4) & 0x0F);
                            
                        case 2:  // mirror bits
                            return mirror(argA);
                            
                        case 3:  // count set bits
                            return countSet(argA);
                            
                        case 4:  // arithmetic negation
                            return -argA_signed;
                            
                        case 5: { // arithmetic shift right
                            let result_shift = (argA >> 1) | (argA & 0x80);
                            let result_overflow = (argA & 0x01) << 7;
                            return (result_overflow << 8) | result_shift;
                        }
                            
                        case 6:  // absolute value
                            return Math.abs(argA_signed);
                            
                        case 7:  // 2's complement <-> sign-module
                            return (argA_signed < 0) ? (-argA_signed | 0x80) : argA_signed;  // -0 is -128
                        
                        case 8:  // square
                            return clamp16unsigned(Math.pow(argA, 2));
                        case 24:  // square 0-1
                            return clamp16unsigned(Math.round(Math.pow(argA_norm_1, 2) * 65536));
                            
                        case 9:  // cube
                            return clamp16unsigned(Math.pow(argA, 3));
                        case 25:  // cube 0-1
                            return clamp16unsigned(Math.round(Math.pow(argA_norm_1, 3) * 65536));
                            
                        case 10:  // sqrt
                            return clamp16unsigned(Math.round(Math.sqrt(argA) * 256));
                        case 26:  // sqrt 0-1
                            return clamp16unsigned(Math.round(Math.sqrt(argA_norm_1) * 65536));
                            
                        case 11:  // cbrt
                            return clamp16unsigned(Math.round(Math.cbrt(argA) * 256));
                        case 27:  // cbrt 0-1
                            return clamp16unsigned(Math.round(Math.cbrt(argA_norm_1) * 65536));
                            
                        case 12:  // exp
                            return clamp16unsigned(Math.round(Math.exp(argA)));
                        case 28:  // exp 0-1
                            return clamp16unsigned(Math.round(Math.exp(argA_norm_1) * 256));
                            
                        case 13:  // ln
                            return clamp16signed(Math.round(Math.log(argA) * 256));
                        case 29:  // ln 0-1
                            return clamp16signed(Math.round(Math.log(argA_norm_1) * 256));
                            
                        case 14:  // log2
                            return clamp16signed(Math.round(Math.log2(argA) * 256));
                        case 30:  // log2 0-1
                            return clamp16signed(Math.round(Math.log2(argA_norm_1) * 256));
                            
                        case 15:  // log10
                            return clamp16signed(Math.round(Math.log10(argA) * 256));
                        case 31:  // log10 0-1
                            return clamp16signed(Math.round(Math.log10(argA_norm_1) * 256));
                            
                        case 16:  // sin
                            return clamp16signed(Math.round(Math.sin(argA_to_rad) * 32768));
                        case 17:  // asin
                            return clamp16signed(Math.round(Math.asin(argA_signed / 128) * rad_normalize_16));
                            
                        case 18:  // cos
                            return clamp16signed(Math.round(Math.cos(argA_to_rad) * 32767));
                        case 19:  // acos
                            return clamp16signed(Math.round(Math.acos(Math.max(argA_signed / 127, -1)) * rad_normalize_16));
                            
                        case 20:  // tan
                            return clamp16signed(Math.round(Math.tan(argA_to_rad / 2) * 256));  // 256 for 45deg, 64 at the input
                        case 21:  // atan
                            return clamp16signed(Math.round(Math.atan(argA_signed / 16) * rad_normalize_16 * 2));  // 16 at the input is 1
                        
                        case 22:  // square signed
                            return clamp16unsigned(Math.pow(argA_signed, 2));
                        case 23:  // square signed 0-1
                            return clamp16unsigned(Math.round(Math.pow(argA_signed_norm_1, 2) * 65536));
                        
                        default:
                            return 0;
                            
                    }
                    break;
            }
            break;
        }
    }
}

function mirror(value) {
    let mirrored = 0;
    for(let i=0; i<8; i++) {
        mirrored <<= 1;
        mirrored |= value & 1;
        value >>= 1;
    }
    return mirrored;
}

function countSet(value) {
    let count = 0;
    for(let i=0; i<8; i++) {
        count += value & 1;
        value >>= 1;
    }
    return count;
}

function clamp16signed(value) {
    return Math.max(Math.min(value, 32767), -32768);
}

function clamp16unsigned(value) {
    return Math.max(Math.min(value, 65535), 0);
}

function shift_left_signed(value, by) {
    return (by < 0) ? ((value >> (-by)) & 0xFF) : ((value << by) & 0xFF);
}

function shift_right_signed(value, by) {
    return (by < 0) ? ((value << (-by)) & 0xFF) : ((value >> by) & 0xFF);
}
