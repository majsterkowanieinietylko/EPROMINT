; floating string on 256x64 VFD
; arguments: char* H, char* L, col_inc, row_inc, delay
;
; Stack layout:
;
; string_len (DP + 0)  <- SP on function entry
; col_pos (DP + 1)
; row_pos (DP + 2)
; col_dir (DP + 3)
; row_dir (DP + 4)
; last_col (DP + 5)
; overflow (DP + 6)
; var7 (DP + 7)
; -
; -
; -
; -
; -
; -
; -
; -
; -
; delay   (DP + 17)
; row_inc (DP + 18)
; col_inc (DP + 19)
; char* L (DP + 20)
; char* H (DP + 21)

call vfd_clear
push all
add sp, -8 ; create space for 8 variables
ld DP, SP + 0 ; initialize frame pointer
clr A
ld (DP + 0), A ; initialize string_len with 0
ld (DP + 1), A ; initialize col_pos with 0
ld (DP + 2), A ; initialize row_pos with 0
ld A, (DP + 19)
ld (DP + 3), A ; initialize col_dir with col_inc
ld A, (DP + 18)
ld (DP + 4), A ; initialize row_dir with row_inc
push DP
ex CD, DP ; frame pointer in CD
pop DP
ld A, (DP + 20)
ld B, (DP + 21)
ld DP, AB ; char* in DP

len_loop:
    cp (DP), 0
    jr eq, loop_exit
    ex CD, DP ; switch to frame pointer
    inc (DP) ; increment string_len
    ex CD, DP ; switch back to char*
    inc DP ; go to next string element
    jr len_loop

loop_exit:
ex CD, DP ; restore frame pointer
ld A, (DP + 0)
cp A, 0 ; check if string length is > 0
jr gt, not_empty
add SP, 8 ; destroy the stack frame
pop all
ret

not_empty:
ld A, 43
ld B, (DP + 0)
sub A, B
ld (DP + 5), A ; last_col = 43 - string_len

main_loop:

clr A
ld (DP + 6), A ; overflow = false
ld A, (DP + 3) ; col_dir
ld C, A
ld A, (DP + 1) ; col_pos
add A, C ; add col_dir to col_pos for test purposes
jr nneg, col_not_neg
    ld B, 1
    ld (DP + 6), B ; overflow = true
    jr test_col_flag
col_not_neg:
    ld B, (DP + 5) ; load last_col
    cp A, B  ; compare new col_pos with last_col
    jr ngt, test_col_flag ; new_col <= last_col
    ld B, 1
    ld (DP + 6), B ; overflow = true

test_col_flag:
    ld B, (DP + 6) ; load overflow flag
    cp B, 0
    jr eq, update_col ; overflow = false
    ld A, (DP + 3)
    extdir A, negate
    ld (DP + 3), A ; col_dir = -col_dir
    
update_col:
    ld B, (DP + 3) ; load col_dir
    ld A, (DP + 1) ; col_pos
    add A, B
    ld (DP + 1), A ; col_pos += col_dir


jr bypass_jump
longen_jump:
    jr main_loop
bypass_jump:

clr A
ld (DP + 6), A ; overflow = false
ld A, (DP + 4) ; row_dir
ld C, A
ld A, (DP + 2) ; row_pos
add A, C ; add row_dir to row_pos for test purposes
jr nneg, row_not_neg
    ld B, 1
    ld (DP + 6), B ; overflow = true
    jr test_row_flag
row_not_neg:
    cp A, 7  ; compare new row_pos with 7, which is last_row
    jr ngt, test_row_flag ; new_row <= last_row
    ld B, 1
    ld (DP + 6), B ; overflow = true

test_row_flag:
    ld B, (DP + 6) ; load overflow flag
    cp B, 0
    jr eq, update_row ; overflow = false
    ld A, (DP + 4)
    extdir A, negate
    ld (DP + 4), A ; row_dir = -row_dir
    
update_row:
    ld B, (DP + 4) ; load row_dir
    ld A, (DP + 2) ; row_pos
    add A, B
    ld (DP + 2), A ; row_pos += row_dir

push ' ' ; fill data
ld A, (DP + 0) ; string_len
push A ; length L
push 0 ; length H
ld A, (DP + 1)
ld B, (DP + 3)
sub A, B ; get previous col_pos
ld C, A
ld A, (DP + 2)
ld B, (DP + 4)
sub A, B ; get previous row_pos
mul A, 0x80
add A, C
addc B, 0 ; AB = row_pos * 0x80 + col_pos
push A ; start_pos L
push B ; start_pos H
call vfd_fill
add SP, 5

ld A, (DP + 21)
push A ; char* H
ld A, (DP + 20)
push A ; char* L
ld A, (DP + 1)
push A ; col_pos
ld A, (DP + 2)
push A ; row_pos
push 0 ; no delays during print
call vfd_print
add SP, 5
ld B, (DP + 17) ; delay

outer_loop: ; generates a 10ms * (DP + 17) delay
    ld C, 0xB8
    ld D, 0x03
    inner_loop:
        sub C, 1
        subb D, 0
        clr A
        or A, C
        or A, D
        jr nz, inner_loop
    djnz outer_loop
in A, (0x02)
test A, 0x01 ; continue if PC0 is high
jr nz, longen_jump
add SP, 8 ; destroy the stack frame
call vfd_clear
pop all
ret
