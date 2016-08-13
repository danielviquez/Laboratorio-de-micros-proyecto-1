;-------------------------Seccion de datos-------------------------------
;Se definen las constantes que se van a usar en el programa
;David Marin Soto
SECTION	.data

	num0: equ 0
	num1: equ 1
	num2: equ 3
	num3: equ 26
	num4: equ 14

	escSeq db 27,"[03;02H"
	escSeq1 db 27,"[05;02H"
	
	B1med db 27,"[04;02H"
	
	B2 db 27,"[03;17H"
	B_2 db 27,"[05;17H"

	B2med db 27,"[04;17H"
		
	B3 db 27,"[03;32H"
	B_3 db 27,"[05;32H"
	
	B3med db 27,"[04;32H"	
	fin_pantalla db 27,"[29;00H"
		
	;db variable
	escLen equ 8
	superior:	db '+-------------+',0xa
	tamano:	equ $-superior
	
	middle:	db '|             |',0xa
	tamanomiddle:	equ $-middle
	
	Espacio:	db '               ',0xa
	tamanoEspacio:	equ $-Espacio
	
	
	cons_BordesVbloques: db '|---------------------------------------------|',0xa		;contiene el valor a imprimir
	cons_tamanoBloques: equ $-cons_BordesVbloques		;contiene la cantidad de caracteres a imprimir
	
	cons_Vacio: db '|                                             |',0xa		;contiene el valor a imprimir
	cons_tamanovacio: equ $-cons_Vacio		;contiene la cantidad de caracteres a imprimir
	
	Press: db '|         Presione X para iniciar             |',0xa		;contiene el valor a imprimir
	tamanoPress: equ $-Press		;contiene la cantidad de caracteres a imprimir
	
	cons_Piso: dw '+*********************|***********************|',0xa		;contiene el valor a imprimir
	cons_tamanoPiso: equ $-cons_Piso		;contiene la cantidad de caracteres a imprimir
	
	
SECTION .text
	global _start
	
	
_start:	
	call Techo
	call Paredes
	call Bloque1
	call Bloque2
	call Bloque3
	;call ubicar
	;call lin
	;call ubicar2
	;call lin
	;call DelB1
	call ubicarfinal
	call segunda
	
Techo:
	mov rax,1
	mov rdi,1
	mov rsi,cons_BordesVbloques
	mov rdx,cons_tamanoBloques
	syscall
	ret	

Paredes:
	.InicioVacio:
		add r8,num1
		
		mov rax, num3			
		cmp rax,r8
		je .printpiso
	
		mov rax,1
		mov rdi,1
		mov rsi,cons_Vacio
		mov rdx,cons_tamanovacio
		syscall

		mov rax,num4
		cmp rax,r8
		je .Pulse
		jne .InicioVacio
	.Pulse:
		add r8,num1
		mov rax,1
		mov rdi,1
		mov rsi,Press
		mov rdx,tamanoPress
		syscall

		mov rax,num1
		mov rbx,num1
		cmp rax,rbx
		je .InicioVacio
		

	.printpiso:
		mov rax,1
		mov rdi,1
		mov rsi,cons_Piso
		mov rdx,cons_tamanoPiso
		syscall
ret
	
Bloque1:
	call ubicar
	call lin
	call ubicarmedio1
	call Medio
	call ubicar2
	call lin
	ret			

Bloque2:
	call ubicarb2
	call lin
	call ubicarmedio2
	call Medio
	call ubicar2b2
	call lin
	ret			

Bloque3:
	call ubicarb3
	call lin
	call ubicarmedio3
	call Medio
	call ubicar3b3
	call lin
	ret
		
ubicar:	
    	
	mov rax,4
	mov rbx,1	
	mov rcx,escSeq
	mov rdx,escLen
	int 80h
	ret	
	
ubicar2:
		
	mov rax,4
	mov rbx,1	
	mov rcx,escSeq1
	mov rdx,escLen
	int 80h
	ret	
ubicarmedio1:
	mov rax,4
	mov rbx,1	
	mov rcx,B1med
	mov rdx,escLen
	int 80h
	ret	
ubicarb2:	 	
	mov rax,4
	mov rbx,1	
	mov rcx,B2
	mov rdx,escLen
	int 80h
	ret	

ubicar2b2:	 	
	mov rax,4
	mov rbx,1	
	mov rcx,B_2
	mov rdx,escLen
	int 80h
	ret	
ubicarmedio2:
	mov rax,4
	mov rbx,1	
	mov rcx,B2med
	mov rdx,escLen
	int 80h
	ret	
ubicarb3:	 	
	mov rax,4
	mov rbx,1	
	mov rcx,B3
	mov rdx,escLen
	int 80h
	ret	

ubicar3b3:	 	
	mov rax,4
	mov rbx,1	
	mov rcx,B_3
	mov rdx,escLen
	int 80h
	ret	
ubicarmedio3:
	mov rax,4
	mov rbx,1	
	mov rcx,B3med
	mov rdx,escLen
	int 80h
	ret	
DelB1:
	call ubicar
	call Blanco
	call ubicar2
	call Blanco
	ret			
lin:
	mov rax,1
	mov rdi,1
	mov rsi,superior
	mov rdx,tamano
	syscall
	ret

Blanco:
	mov rax,1
	mov rdi,1
	mov rsi,Espacio
	mov rdx,tamanoEspacio
	syscall
	ret

Medio:
	mov rax,1
	mov rdi,1
	mov rsi,middle
	mov rdx,tamanomiddle
	syscall
	ret

ubicarfinal:
		
	mov rax,4
	mov rbx,1	
	mov rcx,fin_pantalla
	mov rdx,escLen
	int 80h
	ret		
	
segunda:
	
    mov rax,60
	mov rdi,0
	syscall
	ret
