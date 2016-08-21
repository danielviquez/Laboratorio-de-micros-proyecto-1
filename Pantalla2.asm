SECTION	.data
;**************************************************************************************************************
;Seccion de constantes de pantalla Inicio
;**************************************************************************************************************

	cons_limp db 27,"[2J"
	cons_lim_tam equ 4
	
	cons_bien: db '***************BIENVENIDO A MICRONOID****************', 0xa
	cons_bien_tam: equ $-cons_bien
	
	cleaner: db '       m                                              ', 0xa
	tamcleaner: equ $-cleaner
	
	cons_bienvenida: db 'ESCRIBA SU NOMBRE DE USUARIO Y LUEGO PRESIONE "ENTER"', 0xa
	cons_tamano_bienve: equ $-cons_bienvenida
	
	cons_cur: db '    EL-4313 Lab de Estructura de Microprocesadores   ', 0xa
	cons_cur_tam: equ $-cons_cur
	
	cons_sem: db '               2º Semestre - 2016                    ', 0xa
	cons_sem_tam: equ $-cons_sem

	Vacio: db '  ',0xa		;contiene el valor a imprimir
	tamanovacio: equ $-Vacio		;contiene la cantidad de caracteres a imprimir
	
	num5: equ 5
	num10: equ 10
	num15: equ 15
	num20: equ 20
	num25: equ 25
	
	buf: db''
;**************************************************************************************************************
;Seccion de contantes del area de Juego
;**************************************************************************************************************
	num0: equ 0
	num1: equ 1
	num2: equ 3
	num3: equ 26
	num4: equ 14
	
	irinicio db 27,"[40;00H"
	
	escSeq db 27,"[43;02H"
	escSeq1 db 27,"[45;02H"
	
	B1med db 27,"[44;02H"
	
	B2 db 27,"[43;17H"
	B_2 db 27,"[45;17H"

	B2med db 27,"[44;17H"
		
	B3 db 27,"[43;32H"
	B_3 db 27,"[45;32H"
	
	B3med db 27,"[44;32H"	
	fin_pantalla db 27,"[49;00H"
	
	;Dejar espacio para ubicaciones de bloques 4-6
	
	escSeqB4ar db 27,"[46;02H"
	escSeqB4me db 27,"[47;02H"
	escSeqB4ab db 27,"[48;02H"

	escSeqB5ar db 27,"[46;17H"
	escSeqB5me db 27,"[47;17H"
	escSeqB5ab db 27,"[48;17H"

	escSeqB6ar db 27,"[46;32H"
	escSeqB6me db 27,"[47;32H"
	escSeqB6ab db 27,"[48;32H"
	
	;Termina espacio
	
	B7 db 27,"[49;02H"
	B_7 db 27,"[51;02H"
	B7med db 27,"[50;02H"
	
	B8 db 27,"[49;17H"
	B_8 db 27,"[51;17H"
	B8med db 27,"[50;17H"
	
	B9 db 27,"[49;32H"
	B_9 db 27,"[51;32H"
	B9med db 27,"[50;32H"

	quitarx db 27,"[57;00H"
	
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
	call PantallaInicial
	call lect_usuario
	call limpieza
	call area
	
PantallaInicial:	
	.Begin:
		add r8,num1
		
		mov rax, num25			
		cmp rax,r8
		je .Digite
	
		mov rax,1
		mov rdi,1
		mov rsi,Vacio
		mov rdx,tamanovacio
		syscall

		mov rax,num5
		cmp rax,r8
		je .Welcome

		mov rax,num10
		cmp rax,r8
		je .LabMicros
		
		mov rax,num15
		cmp rax,r8
		je .SegSem
		
		mov rax,num20
		cmp rax,r8
		je .Instruc
		jne .Begin 

		
	.Welcome:
		add r8,num1
		mov rax,1
		mov rdi,1
		mov rsi,cons_bien
		mov rdx,cons_bien_tam
		syscall

		mov rax,num1
		mov rbx,num1
		cmp rax,rbx
		je .Begin
	
	.LabMicros:
		add r8,num1
		mov rax,1
		mov rdi,1
		mov rsi,cons_cur 
		mov rdx,cons_cur_tam
		syscall

		mov rax,num1
		mov rbx,num1
		cmp rax,rbx
		je .Begin
		
	.SegSem:
		add r8,num1
		mov rax,1
		mov rdi,1
		mov rsi,cons_sem 
		mov rdx,cons_sem_tam
		syscall

		mov rax,num1
		mov rbx,num1
		cmp rax,rbx
		je .Begin
		
	.Instruc:	
		add r8,num1
		mov rax,1
		mov rdi,1
		mov rsi,cons_bienvenida 
		mov rdx,cons_tamano_bienve
		syscall

		mov rax,num1
		mov rbx,num1
		cmp rax,rbx
		je .Begin
		
	.Digite:
		mov rax,1
		mov rdi,1
		mov rsi,Vacio 
		mov rdx,tamanovacio
		syscall
		
		;mov rax,60
		;mov rdi,0
		;syscall
ret

lect_usuario:
	mov rax,0
	mov rdi,0
	mov rsi,buf
	mov rdx,10 
	syscall 
	ret

 

limpieza:
	mov rax,4
	mov rbx,1
	mov rcx,cons_limp
	mov rdx,cons_lim_tam
	int 80h
	ret
	
	;mov rax,60
	;mov rdi,0
	;syscall	

	;call ubica_empezar
	;call ciclo_vacio
	;ret
	
;ubica_empezar:
;	mov rax, 4
;	mov rbx, 1
;	mov rcx, irinicio
;	mov rdx, escLen
;	int 80h
;	ret	

;ciclo_vacio:
;	.Comience:
;		add r8,num1
	
;		mov rax, num3			
;		cmp rax,r8
;		je .termine
		
;		mov rax,1
;		mov rdi,1
;		mov rsi,cleaner
;		mov rdx,tamcleaner
;		syscall
		
;		mov rax,num3			
;		cmp rax,num3
;		je .Comience
		
;	.termine:
;		mov rax,60
;		mov rdi,0
;		syscall	
	
area:
;	call ubica_empezar
	call Techo
	;call ubica_empezar
	call Paredes
	;call ubica_empezar
	call Bloque1
	call Bloque2
	call Bloque3
	call Bloque4
	call Bloque5
	call Bloque6
	call Bloque7
	call Bloque8
	call Bloque9
	;call DelB1
	;call DelB2
	;call DelB3
	;call Bloque4tr
	;call Bloque5tr
	;call Bloque6tr
	;call Bloque7tr
	;call Bloque8tr
	;call Bloque9tr
	call ubicarfinal
	;call Paredes
	ret
	;call segunda

ubica_empezar:
	mov rax, 4
	mov rbx, 1
	mov rcx, irinicio
	mov rdx, escLen
	int 80h
	ret	
	
Techo:
	mov rax,1
	mov rdi,1
	mov rsi,cons_BordesVbloques
	mov rdx,cons_tamanoBloques
	syscall
	ret	

Paredes:
	;call ubica_empezar
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

;Funciones de borrado
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

DelB3:
	call ubicarb3
	call Blanco
	call ubicarmedio3
	call Blanco
	call ubicar3b3
	call Blanco
	ret		
Bloque4tr:			;Bloque 4 transparente o borrado
	
	call ubicarb4ar  ;cambiar el nombre de linea	
	call Blanco	
	call ubicarb4me		;cambiar el nombre de linea	
	call Blanco	
	call ubicarb4ab		;cambiar el nombre de linea	
	call Blanco	
	ret	
	
Bloque5tr:			;Bloque 4 transparente o borrado	
	call ubicarb5ar  ;cambiar el nombre de linea	
	call Blanco
	call ubicarb5me		;cambiar el nombre de linea	
	call Blanco	
	call ubicarb5ab		;cambiar el nombre de linea	
	call Blanco
	ret	
	

Bloque6tr:			;Bloque 4 transparente o borrado	
	call ubicarb6ar  ;cambiar el nombre de linea	
	call Blanco	
	call ubicarb6me		;cambiar el nombre de linea	
	call Blanco	
	call ubicarb6ab		;cambiar el nombre de linea	
	call Blanco	
	ret	
	

Bloque7tr:	
	call ubicarb7  ;cambiar el nombre de linea
	call Blanco
	call ubicarmedio7		;cambiar el nombre de linea
	call Blanco
	call ubicar7b7		;cambiar el nombre de linea
	call Blanco
	ret	
	
	

Bloque8tr:	
	call ubicarb8  ;cambiar el nombre de linea
	call Blanco
	call ubicarmedio8		;cambiar el nombre de linea
	call Blanco
	call ubicar8b8		;cambiar el nombre de linea
	call Blanco	
	ret	
	

Bloque9tr:		
	call ubicarb9  ;cambiar el nombre de linea	
	call Blanco	
	call ubicarmedio9		;cambiar el nombre de linea
	call Blanco
	call ubicar9b9		;cambiar el nombre de linea
	call Blanco
	ret	
; Fin de funciones de borrado

;Funciones de Impresion de caracteres
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

; Fin de funciones de borrado 

; Funciones de salida del sistema
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

;------------------------Fin-------------------------------------
	
