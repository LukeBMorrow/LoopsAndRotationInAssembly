;Lab3-1.asm
;Purpose: compute sum of positive #s and sum of negative #s
;Input: array in memory
;Output: counts stored in memory
;
;	r0 loop counter
;	r1 pos counter
;	r2 neg counter
;	r4 current item
;	r5 array pointer

	.orig x3000

	;PUT YOUR CODE HERE
	LD R0,n
	LEA R5,array
	LD R1,sumPos
	LD R2,sumNeg
	loop
		LDR R4,R5,#0
		
		BRn ifneg
			ADD R1,R1,R4	;add the pos number to the counter
		BR endblock
		ifneg
			ADD R2,R2,R4	;add the neg number to the counter
		endblock
		ADD R5,R5,#1	;shift the array
		ADD R0,R0,#-1	;decrement the counter
	BRp loop
	ST R1,sumPos	;store the pos number
	ST R2,sumNeg	;store the neg number

	lea	r0,eopMessage
	puts
	halt

sumPos
	.fill    0      ;sum of positive numbers
sumNeg
	.fill    0      ;sum of negative numbers

n	.fill    10     ;length of Data array
array
	.fill    -3     ;array of data values
	.fill    -10
	.fill    0
	.fill    6
	.fill    -6
	.fill    3
	.fill    4
	.fill    0
	.fill    5
	.fill    -9
eopMessage
	.stringz "\nEnd of processing.\n"
	.end
