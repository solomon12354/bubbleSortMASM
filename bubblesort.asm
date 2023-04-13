TITLE Addand Subtract(AddSub.asm)

; This program addsand subtracts 32 - bit integers.
; Last update : 06 / 01 / 2006

INCLUDE Irvine32.inc


.386
.model flat,stdcall
.stack 4096

.data
vector WORD 2, 14, 30, 39, 60
vector2 WORD 30, 20, 50, 30, 40
tmp DWORD 0
fir DWORD 0
sec DWORD 0
first DWORD 0
second DWORD 0
pri DWORD 0
siz DWORD 5

vectorSize equ ($ - vector2) ;



.code
mov esi,OFFSET vector2;

main PROC
    
mov eax, siz;    
    
mov fir, eax  ;
mov sec, eax  ;
mov ecx, eax  ;
mov pri, eax  ;

mov ecx, eax  ;

;call	DumpRegs;


;call	DumpRegs;

B1:
   mov fir, ecx ;
   
   mov eax, siz  ;
   mov first, eax;

   ;call	DumpRegs;
   mov ecx, fir;

   B2:
        
        mov sec, ecx    ;

        mov esi, fir  ;
        mov eax, 0  ;
        mov ax, [esi*2 + vector2]  ;

        mov esi, sec  ;
        mov ebx, 0  ;
        mov bx, [esi*2 + vector2] ;

        .IF ax < bx
            mov esi, fir    ;
            mov [esi*2 + vector2], bx ;
            mov esi, sec    ;
            mov [esi*2 + vector2], ax ;
        .ENDIF

        loop B2 ;
    
    mov ecx, fir;
    loop B1 ;

mov ecx, siz;
F1:
     mov fir, ecx    ;

     mov esi, fir  ;
     mov eax, 0  ;
     mov ax, [esi*2 + vector2]  ;

     mov esi, 0  ;
     mov ebx, 0  ;
     mov bx, [vector2] ;

     .IF ax < bx
         mov esi, fir    ;
         mov [esi*2 + vector2], bx ;
         
         mov [vector2], ax ;
     .ENDIF

     mov ecx, fir;
     loop F1 ;

mov ecx, pri;

C1:
    
    mov esi, ecx    ;
    mov eax, 0      ;
    mov esi, ecx    ;
    mov ax, [esi*2 + vector2];
    call	DumpRegs
    ; more code here

    loop C1;

mov ax, [vector2];

exit
main ENDP
END main

