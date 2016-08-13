


section .data

cons_limp db 27,"[2J"
cons_lim_tam equ 4

cons_bien: db '************************************************************************BIENVENIDO A MICRONOID*************************************************************************', 0xa
cons_bien_tam: equ $-cons_bien

cons_bienvenida: db 'ESCRIBA SU NOMBRE DE USUARIO Y LUEGO PRESIONE "ENTER"', 0xa
cons_tamano_bienve: equ $-cons_bienvenida

cons_cur: db 'EL-4313 Lab de Estructura de Microprocesadores', 0xa
cons_cur_tam: equ $-cons_cur

cons_sem: db '2º Semestre - 2016', 0xa
cons_sem_tam: equ $-cons_sem

escSeq1 db 27, "[07;00H"
esqLen1 equ 8, 
 
escSeq2 db 27, "[15;58H"
esqLen2 equ 8, 

escSeq3 db 27, "[23;70H"
esqLen3 equ 8, 

escSeq4 db 27, "[31;55H"
esqLen4 equ 8, 

escSeq5 db 27, "[39;83H"
esqLen5 equ 8, 

section .bss 

	buffer resb 10 



section .text 

	global _start		

_start:
	
	call Limpia_la_pantalla
	call imprime_bienvenida
	call curso
	call semestre
	call mensaje_usuario
	call lect_usuario
	call salir


Limpia_la_pantalla:

	mov rax, 4
	mov rbx, 1
	mov rcx, cons_limp
	mov rdx, cons_lim_tam
	int 80h
	ret

imprime_bienvenida:

	mov rax, 4			;mueve el cursor para imprimir 1º linea
	mov rbx, 1
	mov rcx, escSeq1
	mov rdx, esqLen1
	int 80h
	
	
	mov rax, 1
	mov rdi, 1
	mov rsi, cons_bien
	mov rdx, cons_bien_tam
	syscall
	ret

curso:

	mov rax, 4			;mueve el cursor para imprimir 2º linea
	mov rbx, 1
	mov rcx, escSeq2
	mov rdx, esqLen2
	int 80h


	mov rax, 1
	mov rdi, 1
	mov rsi, cons_cur
	mov rdx, cons_cur_tam
	syscall
	ret 

semestre:

	mov rax, 4
	mov rbx, 1
	mov rcx, escSeq3
	mov rdx, esqLen3
	int 80h


	mov rax, 1
	mov rdi, 1
	mov rsi, cons_sem
	mov rdx, cons_sem_tam
	syscall
	ret 

mensaje_usuario: 

	mov rax, 4
	mov rbx, 1
	mov rcx, escSeq4
	mov rdx, esqLen4
	int 80h

	mov rax,1							
	mov rdi,1							
	mov rsi,cons_bienvenida		
	mov rdx,cons_tamano_bienve
	syscall 	
	ret 

lect_usuario:
	mov rax, 4
	mov rbx, 1
	mov rcx, escSeq5
	mov rdx, escSeq5
	int 80h

	mov rax, 0
	mov rdi, 0
	mov rsi, buffer
	mov rdx, 10 
	syscall 
	ret 

salir:
	mov rax, 60
	mov rdi, 0
	syscall 
	ret
