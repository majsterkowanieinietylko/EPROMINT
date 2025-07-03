# EPROMINT
Completely custom <b>8-bit CPU</b> built from the ground up. Inspired by the <b>Z80 CPU</b>, has <b>more flexible instruction set</b> than Z80 and much <b>more powerful ALU</b>.

# Main Features
- Architecture: Von Neumann, 8-bit CISC
- Data width: 8-bit
- Address width: 16-bit
- Number of 8-bit registers: 5
- Number of 16-bit registers: 3
- Interrupt support: Yes
- Number of instructions: 256 (+ extended ALU operations)
- ALU operations: ADD, SUB, ADDC, SUBB, OR, AND, XOR, MUL, DIV, EXT
- EXT operation includes bit shifting, bit slicing, bit concatenation, logarithms, exponents, trigonometric functions, (...)
- Maximum clock speed: Depends on used ICs, 8 MHz in my case
- Power requirements: 5 V, 0.25 A (drawn current depends on used ICs)

# Project Files
This package includes everything you need to make your own <b>EPROMINT CPU</b>. Its contents are listed below:
- CPU Documentation and block diagram
- Schematics for all boards
- Codes for generating memory maps for each board
- Already generated memory maps
- Software for generating memory maps
- Assembled sample programs for the CPU and the demo used in YT video
