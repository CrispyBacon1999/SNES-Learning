lda #$00
sta $0000 ; Set number of coins to 0
lda #$03
sta $0001 ; Set number of lives to 3

; do some game code

; check number of coins for new life
lda $0000 ; pull number of coins
cmp #100 ; check if greater than 100
bcc Done ; if not, skip this section
lda #$00 ; reset number of coins
sta $0000
lda $0001 ; load number of lives
clc       ; clear the carry
adc #$01  ; add 1 to number in A
sta $0001 ; store new number of lives
Done:
