TITLE		LAB_03
	
	SSTACK	SEGMENT PARA STACK	'STACK'
			DB	 64 DUP('СТЕК____')
	SSTACK	ENDS
	
	DSEG	SEGMENT PARA PUBLIC 'DATA'
	X		DB	 1,2,3,4,5
			DB	 1,2,3,4,5
			DB	 1,2,3,4,5
			DB	 1,2,3,4,5
			DB	 1,2,3,4,5
	DSEG	ENDS

SUBTTL		MAIN
PAGE
	CSEG	SEGMENT PARA PUBLIC 'CODE'
			ASSUME CS:CSEG,DS:DSEG,SS:SSTACK
	
	BEGIN	PROC FAR
			MOV	 AX, DSEG
			MOV	 DS, AX
			
	M1:		MOV	 AL, 4 ; Ранг - 1
			
			MOV	 BX, OFFSET X
			
			MOV	 CL, AL
	
	M2:		MOV	 SI, 1
			MOV	 DI, 5
	
	M3:		XCHG DL, X[BX][SI]
			XCHG DL, X[BX][DI]
			XCHG X[BX][SI], DL
			
			INC	 SI
			ADD	 DI, 5

			LOOP M3
			
			MOV	 CL, AL
			
			DEC	 AL
			ADD	 BX, 6
			
			LOOP M2
			
	EXIT:	MOV	 AH, 4CH
			MOV	 AL, 0
			INT	 21H
	
	BEGIN	ENDP
	
	CSEG	ENDS
			END BEGIN