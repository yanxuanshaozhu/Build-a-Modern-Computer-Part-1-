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

@ 24575
D = A
@ R0
M = D                     // R[0] = 24575, the address of keyboard

@ SCREEN
D = A
@ R1
M = D                     // R[1] = 16384, the current position, starting from 16384, ending at 24575, so the size is 8192, which is the size of the screen

(LOOP)
@ KBD
D = M                    // if D = 0, then no pressed key, then whiten, else blacken

@ WHITEN
D; JEQ

@ BLACKEN
0; JMP

(WHITEN)
@ SCREEN                
D = A
@ R1
D = D - M
@ LOOP
D; JGT                     // if the screen is all white, stop the loop

@ R1
D = M
A = M
M = 0

@ R1
M = D - 1

@ LOOP
0; JMP

(BLACKEN)
@ R0
D = M
@ R1
D = D - M
@LOOP
D;JLT                    // if the screen is all black, stop the loop

@ R1
D = M
A = M
M = -1


@ R1
M = D + 1

@LOOP
0;JMP