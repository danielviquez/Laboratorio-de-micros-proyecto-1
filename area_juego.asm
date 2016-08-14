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
	
	;Dejar espacio para ubicaciones de bloques 4-6
	
	escSeqB4ar db 27,"[06;02H"
	escSeqB4me db 27,"[07;02H"
	escSeqB4ab db 27,"[08;02H"

	escSeqB5ar db 27,"[06;17H"
	escSeqB5me db 27,"[07;17H"
	escSeqB5ab db 27,"[08;17H"

	escSeqB6ar db 27,"[06;32H"
	escSeqB6me db 27,"[07;32H"
	escSeqB6ab db 27,"[08;32H"
	
	;Termina espacio
	
	B7 db 27,"[09;02H"
	B_7 db 27,"[11;02H"

	B7med db 27,"[10;02H"
	
	B8 db 27,"[09;17H"
	B_8 db 27,"[11;17H"

	B8med db 27,"[10;17H"
	
	B9 db 27,"[09;32H"
	B_9 db 27,"[11;32H"

	B9med db 27,"[10;32H"
		
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
	call Bloque4
	call Bloque5
	call Bloque6
	call Bloque7
	call Bloque8
	call Bloque9
	call DelB1
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

; Dejar espacio para bloques 4-7

Bloque4:
	
	call ubicarb4ar  ;cambiar el nombre de linea
	call lin
	call ubicarb4me		;cambiar el nombre de linea
	call Medio
	call ubicarb4ab		;cambiar el nombre de linea
	call lin
	ret	

Bloque5:
	
	call ubicarb5ar  ;cambiar el nombre de linea	
	call lin	
	call ubicarb5me		;cambiar el nombre de linea	
	call Medio	
	call ubicarb5ab		;cambiar el nombre de linea	
	call lin	
	ret	

Bloque6:
	call ubicarb6ar  ;cambiar el nombre de linea	
	call lin	
	call ubicarb6me		;cambiar el nombre de linea	
	call Medio	
	call ubicarb6ab		;cambiar el nombre de linea	
	call lin	
	ret		

; Terminar espacio

Bloque7:
	call ubicarb7
	call lin
	call ubicarmedio7
	call Medio
	call ubicar7b7
	call lin
	ret
	
Bloque8:
	call ubicarb8
	call lin
	call ubicarmedio8
	call Medio
	call ubicar8b8
	call lin
	ret
Bloque9:
	call ubicarb9
	call lin
	call ubicarmedio9
	call Medio
	call ubicar9b9
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
;Dejar espacio para ubicar blques del 4-7

ubicarb4ar:
	mov rax,4	
	mov rbx,1		
	mov rcx,escSeqB4ar   ;declarar nueva variable	
	mov rdx,escLen	
	int 80h
	ret	

ubicarb4me:		
	mov rax,4
	mov rbx,1	
	mov rcx,escSeqB4me		;declarar nueva variable	
	mov rdx,escLen
	int 80h
	ret	

ubicarb4ab:	
	mov rax,4
	mov rbx,1	
	mov rcx,escSeqB4ab		;declarar nueva variable
	mov rdx,escLen
	int 80h
	ret

ubicarb5ar:
	mov rax,4	
	mov rbx,1		
	mov rcx,escSeqB5ar   ;declarar nueva variable	
	mov rdx,escLen	
	int 80h
	ret	
		
ubicarb5me: 
	mov rax,4	
	mov rbx,1		
	mov rcx,escSeqB5me   ;declarar nueva variable	
	mov rdx,escLen	
	int 80h
	ret	
	
ubicarb5ab: 
	mov rax,4
	mov rbx,1	
	mov rcx,escSeqB5ab   ;declarar nueva variable
	mov rdx,escLen
	int 80h
	ret
		
ubicarb6ar:
	mov rax,4
	mov rbx,1		
	mov rcx,escSeqB6ar   ;declarar nueva variable	
	mov rdx,escLen
	int 80h
	ret	
	
	

ubicarb6me: 	
	mov rax,4	
	mov rbx,1		
	mov rcx,escSeqB6me   ;declarar nueva variable	
	mov rdx,escLen	
	int 80h
	ret	
	

ubicarb6ab: 
	mov rax,4
	mov rbx,1	
	mov rcx,escSeqB6ab   ;declarar nueva variable
	mov rdx,escLen	
	int 80h
	ret	

;Terminar

ubicarb7:	 	
	mov rax,4
	mov rbx,1	
	mov rcx,B7
	mov rdx,escLen
	int 80h
	ret	

ubicar7b7:	 	
	mov rax,4
	mov rbx,1	
	mov rcx,B_7
	mov rdx,escLen
	int 80h
	ret	
ubicarmedio7:
	mov rax,4
	mov rbx,1	
	mov rcx,B7med
	mov rdx,escLen
	int 80h
	ret	

ubicarb8:	 	
	mov rax,4
	mov rbx,1	
	mov rcx,B8
	mov rdx,escLen
	int 80h
	ret	

ubicar8b8:	 	
	mov rax,4
	mov rbx,1	
	mov rcx,B_8
	mov rdx,escLen
	int 80h
	ret	
ubicarmedio8:
	mov rax,4
	mov rbx,1	
	mov rcx,B8med
	mov rdx,escLen
	int 80h
	ret	

ubicarb9:	 	
	mov rax,4
	mov rbx,1	
	mov rcx,B9
	mov rdx,escLen
	int 80h
	ret	

ubicar9b9:	 	
	mov rax,4
	mov rbx,1	
	mov rcx,B_9
	mov rdx,escLen
	int 80h
	ret	
ubicarmedio9:
	mov rax,4
	mov rbx,1	
	mov rcx,B9med
	mov rdx,escLen
	int 80h
	ret	

DelB1:
	call ubicar
	call Blanco
	call ubicarmedio1
	call Blanco
	call ubicar2
	call Blanco
	ret			

DelB2:
	call ubicarb2
	call Blanco
	call ubicarmedio2
	call Blanco
	call ubicar2b2
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
