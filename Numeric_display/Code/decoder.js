A[11:0];
D[7:0] = 0;
let input = A[3:0];
const dHigh = !A[4];
const dMid = !A[5];
const dLow = !A[6];
const hexHigh = A[9:8];
const digitAt = A[6:4];
const mode = A[7];

const values = [32, 16, 2, 4, 1, 64, 8];
const letters = "abcdefg";
const segments = ["abcdef", "bc", "abdeg", "abcdg", "bcfg", "acdfg", "acdefg", "abc", "abcdefg", "abcdfg", "abcefg", "cdefg", "adef", "bcdeg", "adefg", "aefg"];
const h = "cefg";
const minus = "g";

let word = 0;
let overflow = false;

if(mode) {  // hex format
    if(hexHigh == 0 && dLow) {
        word = getDataWord(h);
    }
    else {
        word = getDataWord(segments[input]);
    }
}
else {
    if(!dLow && input == 14) {
        word = getDataWord(minus);
    }
    else if(dHigh && hexHigh == 3 && input == 0) {
        word = getDataWord(segments[1]);
        overflow = true;
    }
    else if(input != 15) {
        input = Math.min(input, 9);
        word = getDataWord(segments[input]);
    }
}

D[6:0] = ~word;
D[7] = ~overflow;


function getDataWord(segmentSel) {
    let result = 0;
    for(let i=0; i<segmentSel.length; i++) {
        let pos = letters.indexOf(segmentSel.charAt(i));
        if(pos != -1) {
            result |= values[pos];
        }
    }
    return result;
}