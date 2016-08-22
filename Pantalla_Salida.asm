SECTION .data
	
	thanks: db '*********************************************************GRACIAS POR JUGAR MICRONOID**********************************************************', 0xa
	tamthanks: equ $-thanks

	;cons_borra: db '                                                                                                                                            ', 0xa
	;cons_borra_tam: equ $-cons_borra
	
	David: db '                                                          David Marin Soto 201214031                                                              ', 0xa
	tamanoDavid: equ $-David

	Daniel: db '                                                         Daniel Viquez Gomez 201236251                                                            ', 0xa
	tamanoDaniel: equ $-Daniel

	Pollo: db '                                                         Daniel Rojas Chacon 201246882                                                            ', 0xa
	tamanoPollo: equ $-Pollo

	Luis: db '                                                          Luis Alfaro Rojas 201214010                                                             ', 0xa
	tamanoLuis: equ $-Luis

	Ending: db '                                                          Presione ENTER Para Terminar                                                            ', 0xa
	tamanoEnding: equ $-Ending


	;cons_cur: db 'EL-4313 Lab de Estructura de Microprocesadores', 0xa
	;cons_cur_tam: equ $-cons_cur

	;cons_sem: db '2º Semestre - 2016', 0xa
	;cons_sem_tam: equ $-cons_sem
	
	Vacio: db '  ',0xa		;contiene el valor a imprimir
	tamanovacio: equ $-Vacio		;contiene la cantidad de caracteres a imprimir
	
	num5: equ 5
	num10: equ 10
	num11: equ 11
	num12: equ 12
	num13: equ 13
	num14: equ 14
	num15: equ 15
	num20: equ 20
	num25: equ 25
	num30: equ 30
	
	buf: db''
;**************************************************************************************************************
;Seccion de contantes del area de Juego
;**************************************************************************************************************
	num0: equ 0
	num1: equ 1
	num2: equ 3
	num3: equ 26
	num4: equ 14

SECTION .text
	global _start
	
_start:		
	.Begin:
		add r8,num1
		
		mov rax, num25			
		cmp rax,r8
		je .DigiteSalir
	
		mov rax,1
		mov rdi,1
		mov rsi,Vacio
		mov rdx,tamanovacio
		syscall

		mov rax,num1
		cmp rax,r8
		je .muchasgracias
				
		mov rax,num10
		cmp rax,r8
		je .Marin

		mov rax,num11
		cmp rax,r8
		je .Viquez
		
		mov rax,num12
		cmp rax,r8
		je .Alfaro

		mov rax,num13
		cmp rax,r8
		je .Recuero
		
		mov rax,num20
		cmp rax,r8
		je .Exit
		jne .Begin 

		
	.muchasgracias:
		add r8,num1
		mov rax,1
		mov rdi,1
		mov rsi,thanks
		mov rdx,tamthanks
		syscall

		mov rax,num1
		mov rbx,num1
		cmp rax,rbx
		je .Begin
	
	.Marin:
		mov rax,1
		mov rdi,1
		mov rsi,David 
		mov rdx,tamanoDavid
		syscall

		mov rax,num1
		mov rbx,num1
		cmp rax,rbx
		je .Begin
		
	.Viquez:
		mov rax,1
		mov rdi,1
		mov rsi,Daniel 
		mov rdx,tamanoDaniel
		syscall

		mov rax,num1
		mov rbx,num1
		cmp rax,rbx
		je .Begin
	
	.Alfaro:	
		mov rax,1
		mov rdi,1
		mov rsi,Luis 
		mov rdx,tamanoLuis
		syscall

		mov rax,num1
		mov rbx,num1
		cmp rax,rbx
		je .Begin	
		
	.Recuero:
		mov rax,1
		mov rdi,1
		mov rsi,Pollo 
		mov rdx,tamanoPollo
		syscall

		mov rax,num1
		mov rbx,num1
		cmp rax,rbx
		je .Begin
		
	.Exit:
		add r8,num1
		mov rax,1
		mov rdi,1
		mov rsi,Ending 
		mov rdx,tamanoEnding
		syscall

		mov rax,num1
		mov rbx,num1
		cmp rax,rbx
		je .Begin
		
	
		
	.DigiteSalir:
		mov rax,1
		mov rdi,1
		mov rsi,Vacio 
		mov rdx,tamanovacio
		syscall
		
		mov rax,0
		mov rdi,0
		mov rsi,buf
		mov rdx,10 
		syscall 
				
		mov rax,60
		mov rdi,0
		syscall
