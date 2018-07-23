.386
.model flat, pascal

public x_u_y

.code
x_u_y:
	push ebp
	mov  ebp, esp
	add  ebp, 8
	
	mov  eax, [ebp + 8] ; x
	mov  ebx, [ebp + 4] ; y
	mov  ecx, [ebp]		; l
	xor  edx, edx
	
	circ:
		bt   [ebx], edx
		jnc  e_cir
		
		bts  [eax], edx
	
	e_cir:
		inc  edx
	
		loop circ

exit:
	pop  ebp

	ret  12
end
