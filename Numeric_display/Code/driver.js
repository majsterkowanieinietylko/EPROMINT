A[15:0];
D[7:0] = 0;

const clk = A[11];
const clk_fb = A[10];
D[7] = !clk;
const clk_rise = clk & clk_fb;
const clk_fall = !clk & !clk_fb;
const format = A[14];
const input = A[15, 12, 7:0];
let state = A[13, 8, 9];

let digits = [0, 0, 0];

if(format) {  // hex format
    for(let i=2; i>=0; i--) {
        digits[i] = (input >> ((2 - i) * 4)) & 0x0F;
    }
    if(digits[0] == 0) {
        digits.shift();
        digits.push(0);
    }
}
else {
    let input_temp = input;
    for(let i=2; i>=0; i--) {
        digits[i] = input_temp % 10;
        input_temp = Math.floor(input_temp / 10);
    }
    for(let i=0; i<2; i++) {
        if(digits[i] == 0 && input < 1000) {
            digits[i] = 15;
            continue;
        }
        break;
    }
}

let output = 15;
let next_state = state;
let invalid = false;

switch(state) {
    case 6:
        output = digits[0];
        next_state = 5;
    break;
    case 5:
        output = digits[1];
        next_state = 3;
    break;
    case 3:
        output = digits[2];
        next_state = 6;
    break;
    default:
        invalid = true;
}

D[3:0] = output;

if(invalid && clk_fall) {
    D[6:4] = 6;
}
else {
    D[6:4] = clk_rise ? next_state : state;
}