.386
.model FLAT, C

.data
S 	DD 0, 0
S1 	DD 00001111000011110000111100001111B, 1010101B 
S2 	DD 00111100001111000011110000111100B, 1000001B 
L 	DD 39 

; S1	= 00001111000011110000111100001111B, 00000000000000000000000001010101B 
; S2	= 00111100001111000011110000111100B, 00000000000000000000000001000001B 
; AuB	= 00111111001111110011111100111111B, 00000000000000000000000001010101B

.code
	include Macrolib.txt

	start proc
		;count offset S1, 39, eax		; не можем отправить строку (2 части)
		;setcler offset S, 33, 1			
		;AuB offset S1, offset S2, L
		pushr <ebx, ecx>
		;KONSTRUKTOR offset S, <1, 32>
		popr  <ecx, ebx>
		RET
	start endp
END

