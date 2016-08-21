
section .data
	escSeq db 27,"[05;10H"
	escLen equ 8
	cons_hola: db 'o',0xa
	cons_espacio: db ' ',0xa
	cons_tamano1: equ $-cons_hola
	cons_tamano2: equ $-cons_espacio
	posx dd 24
	posy dd 20
	
	tiemposist dd 00000000h
	random dw 0000h
	
	posxf: dq 24.0
	posyf: dq 20.0
	deltax: dq 0.0
	deltay: dq 0.0
	rangoangulos: dq 2.7925
	diezgrados: dq 0.1745
	angulo: dq 1.5708

section .text

	global _start

_start:
	finit
	call aleatorio
	
	ciclo:
	call borrabola
	
	;Actualiza posicion en x
	fld qword[posxf]
	fadd qword[deltax]
	fist dword[posx]
	fstp qword[posxf]
	
	;Actualiza posicion en y
	fld qword[posyf]
	fadd qword[deltay]
	fist dword[posy]
	fstp qword[posyf]
	
	call modificastr
	call dibujabola
	call espera
	jmp ciclo
	
	;Codigo de finalizacion
	mov rax,60
	mov rdi,0
	syscall
	
espera:
	mov ecx, 01dcd650h
	ciclo2:
	loop ciclo2
	ret
	
dibujabola:
	;Coloca el cursor
	mov rax,4
	mov rbx,1
	mov rcx, escSeq
	mov rdx, escLen
	int 80h

	;Imprime la bola
	mov rax,1
	mov rdi,1
	mov rsi,cons_hola
	mov rdx,cons_tamano1
	syscall
	ret
	
borrabola:
	;Coloca el cursor
	mov rax,4
	mov rbx,1
	mov rcx, escSeq
	mov rdx, escLen
	int 80h

	;Borra la bola
	mov rax,1
	mov rdi,1
	mov rsi,cons_espacio
	mov rdx,cons_tamano2
	syscall
	ret
	
	
modificastr:
	;Separar unidades y decenas de posy
	mov rax, 0
	mov eax, [posy]
	mov bl, 0ah
	div bl
	
	;Convertir a ascii, sumando 48
	add ah, 30h
	add al, 30h
	
	;Mover a memoria
	mov rcx, escSeq
	mov byte[rcx+2], al
	mov byte[rcx+3], ah
	
	;Separar unidades y decenas de posx
	mov rax, 0
	mov eax, [posx]
	div bl
	
	;Convertir a ascii, sumando 48
	add ah, 30h
	add al, 30h
	
	;Mover a memoria
	mov byte[rcx+5], al
	mov byte[rcx+6], ah
	ret

aleatorio:
	;Obtengo el tiempo del sistema
	mov rax, 13
	mov rbx, tiemposist
	int 0x80
	mov ecx, dword[tiemposist]
	movzx eax, cl
	
	;Extraigo un numero entre 1 y 10 que me permitira 
	;obtener el angulo de salida
	mov bl, 0ah
	div bl
	mov bl, ah
	mov rax, 0
	mov al, bl
	add al, 01h ;ajustar para evitar division por cero
	mov word[random], ax
	
	;Obtengo el angulo de salida de la plataforma
	fld qword[rangoangulos]
	fidiv word[random] 
	fadd qword[diezgrados]
	fst qword[angulo]
	
	;Calculo el deltaX (coseno del angulo)
	fcos
	fstp qword[deltax]
	
	;Calculo el deltaY (negativo del seno del angulo)
	fld qword[angulo]
	fsin
	fchs
	fstp qword[deltay]
	ret
	
