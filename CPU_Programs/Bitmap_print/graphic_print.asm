; bitmap print on a 256x64 VFD
; arguments: src* H, src* L, dest* H, dest* L
;
; Stack layout:
;
; - <- SP on function entry after push all
; -
; -
; -
; -
; -
; -
; -
; -
; dest* L (SP + 9)
; dest* H (SP + 10)
; src* L (SP + 11)
; src* H (SP + 12)

push all
out (0x21), 0x04 ; cursor auto inc
ld C, (SP + 9)
ld B, (SP + 10)
ld A, C
out (0x21), 0x0E ; set cursor_L cmd
out (0x20), A ; dest* L
out (0x21), 0x0F ; set cursor_H cmd
out (0x20), B ; dest* H
out (0x21), 0x08 ; data write mode
ld C, (SP + 11) ; src* L
ld B, (SP + 12) ; src* H
ld A, C
ld DP, AB ; src* in DP
ld A, 0 ; lower byte counter
ld B, 1
ld C, 0 ; upper byte counter

out_loop:
    outi (0x20), (DP)
    add A, B ; increment A
    jr nc, out_loop ; continue if no carry
    add C, 1 ; increment C
    cp C, 8
    jr lt, out_loop ; continue if less that 8 * 256 bytes were sent
    
pop all
ret
    
    