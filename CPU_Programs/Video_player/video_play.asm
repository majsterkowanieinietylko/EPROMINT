; basic video player for EPROMINT with 256x64 VFD
; arguments: vid* high, vid* mid, vid* low, dest* high, dest* low
;   vid* - location of .tvc header in SPI flash
;   dest* - display memory start
; assuming SPI data register @ 0x8030, SPI CS register @ 0x8040
; assuming VFD data @ 0x8020, VFD command @ 0x8021
; assuming 4MHz clock
; 
; Stack layout:
;
; header[0] (SP + 0) t <- SP on function entry after push all and ADD SP, -16
; header[1] (SP + 1) v
; header[2] (SP + 2) c
; header[3] (SP + 3) _
; header[4] (SP + 4) frames_L
; header[5] (SP + 5) frames_H
; header[6] (SP + 6) fps
; header[7] (SP + 7) frame_size_L
; header[8] (SP + 8) frame_size_H
; displayed_L (SP + 9)
; displayed_H (SP + 10)
; cycles_L (SP + 11)
; cycles_H (SP + 12)
; var13 (SP + 13)
; var14 (SP + 14)
; var15 (SP + 15)
; -
; -
; -
; -
; -
; -
; -
; -
; -
; dest* L (SP + 25)
; dest* H (SP + 26)
; vid* L (SP + 27)
; vid* M (SP + 28)
; vid* H (SP + 29)

out (0x40), 0xFF ; all #CS lines high
call vfd_clear
push all
add SP, -16 ; create a stack frame

ld B, 0
ld (SP + 9), B ; displayed_L = 0
ld (SP + 10), B ; displayed_H = 0
ld (SP + 11), B ; cycles_L = 0
ld (SP + 12), B ; cycles_H = 0

out (0x40), 0xFE ; #CS0 low
out (0x30), 0x03 ; read command
ld B, (SP + 29)
out (0x30), B ; high address byte
ld B, (SP + 28)
out (0x30), B ; middle address byte
ld B, (SP + 27)
out (0x30), B ; low address byte

ld DP, SP + 0 ; set DP to header[0]
ld B, 9
input_loop: ; input 9 file header bytes
    out (0x30), A ; request next byte, sent data doesn't matter
    ini (DP), (0x30)
    djnz input_loop
    
ld DP, SP + 0
CP (DP), 't'
jr neq, exit
inc DP
CP (DP), 'v'
jr neq, exit
inc DP
CP (DP), 'c'
jr neq, exit
inc DP
CP (DP), '_'
jr neq, exit
add DP, 3
CP (DP), 0
jr ngt, exit

; cycles: number of 256 clock cycle groups to drop in a busy loop
; 4000000 / 256 = 0x3D09
ld B, (SP + 6) ; fps
ld C, 0x09
ld D, 0x3D
inefficient_divide_loop:
    ld A, C
    sub A, B
    ld C, A
    subb D, 0
    jr neg, continue
    ld DP, SP + 11
    nop ; just a hole patch
    inc (DP) ; cycles_L++
    jr nc, inefficient_divide_loop
    inc DP
    inc (DP) ; cycles_H++
    jr inefficient_divide_loop
    
continue:

out (0x21), 0x04 ; cursor auto inc
jr main_loop

exit:
    out (0x40), 0xFF ; all #CS lines high
    call vfd_clear
    add SP, 16 ; destroy the stack frame
    pop all
    ret

main_loop:
xorio (0x00), 0x08 ; toggle I/O line to measure fps ; 14 cycles
ld C, (SP + 25) ; 7 cycles
ld B, (SP + 26) ; 7 cycles
ld A, C ; 4 cycles
out (0x21), 0x0E ; set cursor_L cmd ; 11 cycles
out (0x20), A ; dest* L ; 8 cycles
out (0x21), 0x0F ; set cursor_H cmd ; 11 cycles
out (0x20), B ; dest* H ; 8 cycles
out (0x21), 0x08 ; data write mode ; 11 cycles

ld B, (SP + 10) ; 7 cycles
ld A, B ; displayed_H ; 4 cycles
ld B, (SP + 5) ; frames_H ; 7 cycles
cp A, B ; 3 cycles
jr lt, frame_init ; displayed_H < frames_H ; 3 cycles
jr gt, exit ; displayed_H > frames_H ; 3 cycles

; displayed_H == frames_H
ld B, (SP + 9) ; 7 cycles
ld A, B ; displayed_L ; 4 cycles
ld B, (SP + 4) ; frames_L ; 7 cycles
cp A, B ; 3 cycles
jr nlt, exit ; displayed_L >= frames_L ; 3 cycles

frame_init:
    ld A, 0 ; lower byte counter ; 3 cycles
    ld B, 1 ; 3 cycles
    ld C, 0 ; upper byte counter ; 3 cycles
next_frame:
    out (0x30), B ; request next byte, sent data doesn't matter  ; 8 cycles
    in D, (0x30) ; fetch next byte from SPI ; 7 cycles
    out (0x20), D ; send it to VFD ; 8 cycles
    add A, B ; increment A ; 4 cycles
    jr nc, next_frame ; continue if no carry ; 3 cycles
    add C, 1 ; increment C ; 10 cycles
    cp C, 8 ; 9 cycles
    jr lt, next_frame ; continue if less that 8 * 256 bytes were sent ; 3 cycles
    ; (30 * 255 + 52) * 8 + 246 = 61862 cycles per frame, max fps is ~65
    ; 4000000 / fps - 61862 = number of cycles to drop in a busy loop
    
ld C, (SP + 11) ; cycles_L ; 7 cycles
ld D, (SP + 12) ; cycles_H ; 7 cycles
sub C, 241 ; subtract 61862 / 256 ; 10 cycles
subb D, 0 ; 10 cycles
jr nneg, busy_loop ; 3 cycles
jr main_loop ; 3 cycles

busy_loop: ; takes CD * 256 cycles
    nop ; 2 cycles
    ld B, 21 ; 3 cycles
    djnz itself ; 21 * 10 cycles
    sub C, 1 ; 10 cycles
    subb D, 0 ; 10 cycles
    clr A ; 4 cycles
    or A, C ; 7 cycles
    or A, D ; 7 cycles
    jr nz, busy_loop ; 3 cycles
    
; count displayed frames
ld B, (SP + 9) ; displayed_L ; 7 cycles
ld C, (SP + 10) ; displayed_H ; 7 cycles
add B, 1 ; 9 cycles
addc C, 0 ; 10 cycles
ld (SP + 9), B ; 8 cycles
ld (SP + 10), C ; 7 cycles
jr main_loop
