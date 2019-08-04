; ---------------------------------------
; File: nihil.s
; Description: Your very first SNES game!
; ---------------------------------------


; ---- Assembler Directives
.p816
.i16
.a8

.segment "CODE"
.proc ResetHandler    ; Program entry point
  sei                 ; disable interrupts
  clc                 ; clear the carry flag
  xce                 ; switch to native mode

  lda #$81            ; enable...
  sta $4200           ; ...non-maskable interrupt

  jmp GameLoop        ; Jump to the game loop
.endproc

.proc GameLoop
  wai                 ; Wait for NMI interrupt
  jmp GameLoop        ; Restart game loop
.endproc

.proc NMIHandler
  lda $4210           ; read NMI status
  rti                 ; interruopt done, return to main game loop
.endproc

.segment "VECTOR"
; native mode   COP         BRK         ABT
.addr           $0000,      $0000,      $0000
;               NMI         RST         IRQ
.addr           NMIHandler, $0000,      $0000

.word           $0000, $0000 ; four unused bytes

; emulation m.  COP         BRK         ABT
.addr           $0000,      $0000,      $0000
;               NMI         RST         IRQ
.addr           $0000,      ResetHandler, $0000
