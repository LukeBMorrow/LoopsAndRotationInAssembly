;Lab3-2.asm
;Purpose: print the letter A if user enters '0', print Z if user enters '1'.
;Input: char from keyboard
;Output: char from memory

;The addresses of memory locations of 'A' and 'Z' are stored in chr1 and chr2.
;Access 'A' and 'Z' through chr1Ptr and chr2Ptr.
;	r0 input
;	r1 negative ascii offset

	.orig x3000

	;PUT YOUR CODE HERE
	LEA R0,prompt	;prompts the user
	PUTS
	GETC	;gets the input
	LD R1,removeAsciiOffset	
	ADD R0,R0,R1
	BRz if
		LDI R0,chr2Ptr ;'1' situation
	BR endif
	if
		LDI R0,chr1Ptr ;'0' situation
	endif

	putc
	lea	r0,eopMessage
	puts
	halt


chr1Ptr	.fill	chr1
chr2Ptr	.fill	chr2

chr1	.fill	x0041		;'A'
chr2	.fill	x005A		;'Z'
prompt	.STRINGZ "ENTER '1' OR '0' \n"
removeAsciiOffset .fill #-48

eopMessage
	.stringz	"\nEnd of processing.\n"
	.end
