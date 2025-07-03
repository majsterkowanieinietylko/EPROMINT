/*
    Address bus controller for EPROMINT CPU written by MINT: https://www.youtube.com/@__MINT_
    Use provided memory map generator software to compile it, 128KB and 64KB EPROMs are needed.
    Check provided schematics and documentation for details.
    
    This software comes with absolutely no warranty!
*/

/* ========== Compile this for lower (64KB) EPROM ============ */

// lower 7 bits

D[7:0] = 0;
A[15:0];

const INC = 0;
const DEC = 1;
const ADD = 2;
const LOAD = 3;

let addr_now = A[15, 14, 13, 8, 9, 11, 10];
let modifier = A[6:0];
const change_mode = A[12, 7];

let carry = false;
let new_addr = addr_now;

switch(change_mode) {
    case INC:
        new_addr = addr_now + 1;
        carry = new_addr > 0x7F;
    break;
    case DEC:
        new_addr = addr_now - 1;
        carry = new_addr >= 0;
    break;
    case ADD:
        new_addr = addr_now + modifier;
        carry = new_addr > 0x7F;
    break;
    case LOAD:
        new_addr = modifier;
    break;
}

D[7] = carry;
D[6:3, 0:2] = new_addr;

/* ===================================================== */


/* ========== Compile this for upper (128KB) EPROM ============ */

// upper 7 bits

D[7:0] = 0;
A[16:0];

const INC = 0;
const DEC = 1;
const ADD = 2;
const LOAD = 3;

let addr_now = A[16, 14, 15, 13, 8, 9, 11];
let carry_in = A[10];
let modifier = A[6:0];
let sign = A[0];
const change_mode = A[12, 7];

let carry_out = false;
let new_addr = addr_now;

switch(change_mode) {
    case INC:
        new_addr = addr_now + carry_in;
        carry_out = new_addr > 0x7F;
    break;
    case DEC:
        new_addr = addr_now + carry_in - 1;
        carry_out = new_addr >= 0;
    break;
    case ADD:
        new_addr = addr_now + carry_in;
        if(sign) {
            new_addr -= 1;  // sign bit has negative weight
            carry_out = new_addr >= 0;
        }
        else {
            carry_out = new_addr > 0x7F;
        }
    break;
    case LOAD:
        new_addr = modifier;
    break;
}

D[7] = carry_out;  // unused anyways, but why not handle it
D[6:3, 0:2] = new_addr;

/* ===================================================== */
