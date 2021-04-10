// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
@ 8192
D = A
@ I
M = D             //n = 8192, size of the screen, which is 24576 - 16384

@ KBD
D = M

@ WHITEN         // if not pressed, whiten the screen
D; JEQ

@ BLACKEN        // if pressed, blacken the screen
0;JMP

(END)
@ END
0; JMP

(BLACKEN)


(WHITEN)
@ SCREEN
D = M
@ LOOP
D; JEQ
@ i
M = M - 1
@ SCREEN
D = A
@ i
A = D + M
M = 0
@ END
0; JMP