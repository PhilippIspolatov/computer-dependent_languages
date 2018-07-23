SSTACK	SEGMENT PARA STACK 'STACK'
		DB	 64 DUP('СТЕК____')
SSTACK	ENDS

DSEG	SEGMENT PARA PUBLIC 'DATA'
		M DW 5
		fakt2 DW ?
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG,DS:DSEG,SS:SSTACK

BEGIN	PROC FAR
		MOV	 AX, DSEG
		MOV	 DS, AX
		
		mov	 cx, m
		lea	 di, fakt2
		
		call p
		
EXIT:	MOV	 AH, 4CH
		MOV	 AL, 0
		INT	 21H

BEGIN	ENDP

p proc
.L1:
		push bp
		mov	 bp, cx
		cmp	 bp, 1
		jg	 .L2
		mov	 ax, 1
		jmp	 .L3
.L2:
		dec	 cx
		call p
		imul bp
		mov	 [di], ax
.L3:
		pop	 bp
		ret
p endp

CSEG	ENDS
END BEGIN