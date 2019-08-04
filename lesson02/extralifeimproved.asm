coins = $0000
lives = $0001


lda #$00
sta coins ; Set number of coins to 0
lda #$03
sta lives ; Set number of lives to 3

; do some game code

; check number of coins for new life
lda coins ; pull number of coins
cmp #100 ; check if greater than 100
bcc Done ; if not, skip this section
lda #$00 ; reset number of coins
sta coins
lda lives ; load number of lives
clc       ; clear the carry
adc #$01  ; add 1 to number in A
sta lives ; store new number of lives
Done:
