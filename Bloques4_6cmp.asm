;*********************************************************************************************************************
;Segmentos de codigo que incluye las comparaciones del rebote de la bola con los bloques del 4 al 6
;*********************************************************************************************************************
Bloque4Encendido db 1
Bloque5Encendido db 1
Bloque6Encendido db 1

Bloque4cmp:

	mov rax,qword [Bloque4Encendido]
	cmp rax,1
	jne Bloque5cmp
	
	cmp posy,14		
	jnge Bloque5cmp
	
	cmp posy,16
	jge Bloque5cmp
	
	cmp posx,2
	je cambiadeltax
	
	cmp posx,16
	je cambiadeltax
	
	cmp posx,2
	jnge Bloque5cmp
	
	cmp posx,16
	jge Bloque5cmp
	
	cmp posy,14	
	je cambiadeltay
	
	cmp posy,16
	jne Bloque5cmp
		
	call cambiadeltay

ret

Bloque5cmp:

	mov rax,qword [Bloque5Encendido]
	cmp rax,1
	jne Bloque6cmp
	
	cmp posy,14		
	jnge Bloque6cmp
	
	cmp posy,16
	jge Bloque6cmp
	
	cmp posx,17
	je cambiadeltax
	
	cmp posx,31
	je cambiadeltax
	
	cmp posx,17
	jnge Bloque6cmp
	
	cmp posx,31
	jge Bloque6cmp
	
	cmp posy,14	
	je cambiadeltay
	
	cmp posy,16
	jne Bloque6cmp
		
	call cambiadeltay

ret

Bloque5cmp:

	mov rax,qword [Bloque5Encendido]
	cmp rax,1
	jne Bloque6cmp
	
	cmp posy,14		
	jnge Bloque6cmp
	
	cmp posy,16
	jge Bloque6cmp
	
	cmp posx,17
	je cambiadeltax
	
	cmp posx,31
	je cambiadeltax
	
	cmp posx,17
	jnge Bloque6cmp
	
	cmp posx,31
	jge Bloque6cmp
	
	cmp posy,14	
	je cambiadeltay
	
	cmp posy,16
	jne Bloque6cmp
		
	call cambiadeltay

ret	

Bloque6cmp:

	mov rax,qword [Bloque6Encendido]
	cmp rax,1
	jne Bloque7cmp
	
	cmp posy,14		
	jnge Bloque7cmp
	
	cmp posy,16
	jge Bloque7cmp
	
	cmp posx,32
	je cambiadeltax
	
	cmp posx,46
	je cambiadeltax
	
	cmp posx,32
	jnge Bloque7cmp
	
	cmp posx,46
	jge Bloque7cmp
	
	cmp posy,14	
	je cambiadeltay
	
	cmp posy,16
	jne Bloque7cmp
		
	call cambiadeltay

ret	

