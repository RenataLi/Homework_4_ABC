; file.asm - использование файлов в NASM
extern printf
extern fscanf

extern AUTOMOBILE
extern BUS
extern TRUCK

;----------------------------------------------
; Ввод параметров автобуса из файла
global InAutomobile
InAutomobile:
section .data
    .infmt db "%d%d%lg",0
section .bss
    .FILE   resq    1   ; временное хранение указателя на файл
    .prect  resq    1   ; адрес поезда
section .text
push rbp
mov rbp, rsp

    ; Сохранение принятых аргументов
    mov     [.prect], rdi          ; сохраняется адрес поезда
    mov     [.FILE], rsi          ; сохраняется указатель на файл

    ; Ввод автобуса из файла
    mov     rdi, [.FILE]
    mov     rsi, .infmt         ; Формат - 1-й аргумент
    mov     rdx, [.prect]       ; &x - int numberOfRailwayCarriage 
    mov     rcx, [.prect]
    add     rcx, 4              ; &y = &x + 4 - int speed
    mov     r8, [.prect]     
    add     r8, 8               ;&z = &x + 4+4 - double distance
    mov     rax, 1
    call    fscanf   
leave
ret

; // Ввод параметров bus из файла
global InBus
InBus:
section .data
    .infmt db "%d%d%lg",0
    .outf db "InBus",0

section .bss
    .FILE   resq    1   ; временное хранение указателя на файл
    .bus  resq    1   ; адрес bus
section .text
push rbp
mov rbp, rsp

    ; Сохранение принятых аргументов
    mov     [.bus], rdi          ; сохраняется адрес bus
    mov     [.FILE], rsi          ; сохраняется указатель на файл

     ; Ввод поезда из файла
    mov     rdi, [.FILE]
    mov     rsi, .infmt         ; Формат - 1-й аргумент
    mov     rdx, [.bus]       
    mov     rcx, [.bus]
    add     rcx, 4             
    mov     r8, [.bus]     
    add     r8, 8               ;&z = &x + 4+4 - double distance
    mov     rax, 1
    call    fscanf   
    ;mov rdi,.outf
;    call printf
leave
ret

global InTruck
InTruck:
section .data
    .infmt db "%d%d%lg",0
    .outf db "truck",0
section .bss
    .FILE   resq    1   ; временное хранение указателя на файл
    .truck  resq    1   ; адрес треугольника
section .text
push rbp
mov rbp, rsp

    ; Сохранение принятых аргументов
    mov     [.truck], rdi          ; сохраняется адрес треугольника
    mov     [.FILE], rsi          ; сохраняется указатель на файл

     mov     rdi, [.FILE]
    mov     rsi, .infmt         ; Формат - 1-й аргумент
    mov     rdx, [.truck]       ; &a int s.displacement
    mov     rcx, [.truck]
    add     rcx, 4              ; &b = &a + 4 int type
    mov     r8, [.truck]
    add     r8, 8               ; &c = &x + 4+4 int s.speed
    mov     r9, [.truck]
    add     r9, 12               ; &d = &x + 4+4+4 double s.distance
    mov     rax, 1              ; нет чисел с плавающей точкой
    call    fscanf
    ;mov rdi,.outf
;    call printf

leave
ret
; // Ввод параметров обобщенной фигуры из файла
; int InTransport(void *s, FILE *ifst) {
;     int k;
;     fscanf(ifst, "%d", &k);
;     switch(k) {
;         case 1:
;             *((int*)s) = RECTANGLE;
;             InRectangle(s+intSize, ifst);
;             return 1;
;         case 2:
;             *((int*)s) = TRIANGLE;
;             InShip(s+intSize, ifst);
;             return 1;
;         default:
;             return 0;
;     }
; }
global InCar
InCar:
section .data
    .tagFormat   db      "%d",0
    .tagOutFmt   db     "Tag is: %d",10,0
section .bss
    .FILE       resq    1   ; временное хранение указателя на файл
    .car    resq    1   ; адрес фигуры
    .carTag   resd    1   ; признак фигуры
section .text
push rbp
mov rbp, rsp

    ; Сохранение принятых аргументов
    mov     [.car], rdi          ; сохраняется адрес фигуры
    mov     [.FILE], rsi            ; сохраняется указатель на файл

    ; чтение признака фигуры и его обработка
    mov     rdi, [.FILE]
    mov     rsi, .tagFormat
    mov     rdx, [.car]      ; адрес начала фигуры (ее признак)
    xor     rax, rax            ; нет чисел с плавающей точкой
    call    fscanf

    ;; Тестовый вывод признака фигуры
;     mov     rdi, .tagOutFmt
;     mov     rax, [.ptransport]
;     mov     esi, [rax]
;     call    printf

    mov rcx, [.car]          ; загрузка адреса начала фигуры
    mov eax, [rcx]              ; и получение прочитанного признака
    cmp eax, [AUTOMOBILE]
    je .automobileIn
    cmp eax, [BUS]  ;
    je .busIn
    cmp eax, [TRUCK] ;
    je .truckIn
    xor eax, eax    ; Некорректный признак - обнуление кода возврата
    jmp     .return
.automobileIn:
    ; Ввод прямоугольника
    mov     rdi, [.car]
    add     rdi, 4
    mov     rsi, [.FILE]
    call    InAutomobile
    mov     rax, 1  ; Код возврата - true
    jmp     .return
.busIn:
    ; Ввод треугольника
    mov     rdi, [.car]
    add     rdi, 4
    mov     rsi, [.FILE]
    call    InBus
    mov     rax, 1  ; Код возврата - true
    jmp     .return
.truckIn:
    mov     rdi, [.car]
    add     rdi, 4
    mov     rsi, [.FILE]
    call    InTruck
    mov     rax, 1  ; Код возврата - true
    jmp     .return
.return:

leave
ret

; // Ввод содержимого контейнера из указанного файла
global InContainer
InContainer:
section .bss
    .pcont  resq    1   ; адрес контейнера
    .plen   resq    1   ; адрес для сохранения числа введенных элементов
    .FILE   resq    1   ; указатель на файл
section .text
push rbp
mov rbp, rsp

    mov [.pcont], rdi   ; сохраняется указатель на контейнер
    mov [.plen], rsi    ; сохраняется указатель на длину
    mov [.FILE], rdx    ; сохраняется указатель на файл
    ; В rdi адрес начала контейнера
    xor rbx, rbx        ; число фигур = 0
    mov rsi, rdx        ; перенос указателя на файл
.loop:
    ; сохранение рабочих регистров
    push rdi
    push rbx

    mov     rsi, [.FILE]
    mov     rax, 0      ; нет чисел с плавающей точкой
    call    InCar     ; ввод фигуры
    cmp rax, 0          ; проверка успешности ввода
    jle  .return        ; выход, если признак меньше или равен 0

    pop rbx
    inc rbx

    pop rdi
    add rdi, 24             ; адрес следующей фигуры

    jmp .loop
.return:
    mov rax, [.plen]    ; перенос указателя на длину
    mov [rax], ebx      ; занесение длины
leave
ret

