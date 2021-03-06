; file.asm - использование файлов в NASM
extern printf
extern rand


extern AUTOMOBILE
extern BUS
extern TRUCK


;----------------------------------------------
; // rnd.c - содержит генератор случайных чисел в диапазоне от 1 до 20
; int Random() {
;     return rand() % 20 + 1;
; }
global Random
Random:
section .data
    .i20     dq      20
    .rndNumFmt       db "Random number = %d",10,0
section .text
push rbp
mov rbp, rsp

    xor     rax, rax    ;
    call    rand        ; запуск генератора случайных чисел
    xor     rdx, rdx    ; обнуление перед делением
    idiv    qword[.i20]       ; (/%) -> остаток в rdx
    mov     rax, rdx
    inc     rax         ; должно сформироваться случайное число

    ;mov     rdi, .rndNumFmt
    ;mov     esi, eax
    ;xor     rax, rax
    ;call    printf


leave
ret

;inline auto RandomDistance() {
;    return rand() % 10000 + 1 + (double) rand() / RAND_MAX;
;}
global RandomFuelConsumption
RandomFuelConsumption:
section .data
    .i20     dq      5000
    .rndNumFmt       db "Random number = %d",10,0
section .text
push rbp
mov rbp, rsp

    xor     rax, rax    ;
    call    rand        ; запуск генератора случайных чисел
    xor     rdx, rdx    ; обнуление перед делением
    idiv    qword[.i20]       ; (/%) -> остаток в rdx
    mov     rax, rdx
    add     rax,10         ; должно сформироваться случайное число

    ;mov     rdi, .rndNumFmt
    ;mov     esi, eax
    ;xor     rax, rax
    ;call    printf
;section .data
;    .i20     dq      10000
;    .rndNumFmt       db "Random number = %lg",10,0
;section .bss
;    .prect  resq 1   ;случайно числа
;section .text
;push rbp
;mov rbp, rsp
;
;    xor     rax, rax    
;    call    rand
;    xor     rdx, rdx    ; обнуление перед делением
;    idiv    qword[.i20]   
;    mov     rax, rdx
;    cvtsi2sd    xmm0 , rax
;    mov rax, [.i20]
;    cvtsi2sd    xmm1 , rax
;    divsd    xmm0 , xmm1 ; дробная часть в xmm0
;    movsd xmm2 , xmm0
;     ;Вывод дробной части
;     ;mov     rdi, .rndNumFmt
;;     movsd  xmm0 , xmm2
;;    mov     rax, 1
;;    call    printf
;
;    xor     rax, rax    ;
;    call    rand        ; запуск генератора случайных чисел
;    xor     rdx, rdx    ; обнуление перед делением
;    idiv    qword[.i20]       ; (/%) -> остаток в rdx
;    mov     rax, rdx
;    inc     rax         ; должно сформироваться случайное число
;    cvtsi2sd    xmm1, rax
;    addsd   xmm2 , xmm1
;    movsd xmm0 , xmm2
;    
;
;    ;mov     rdi, .rndNumFmt
;;    mov     [rsi], xmm0
;;    mov     rax, 1
;;    call    printf
;

leave
ret

;inline auto RandomShipType() {
;    return rand() % 3 + 1;
;}
global RandomCarType
RandomCarType:
section .data
    .i20     dq      3
    .rndNumFmt       db "Random number = %d",10,0
section .text
push rbp
mov rbp, rsp

    xor     rax, rax    ;
    call    rand        ; запуск генератора случайных чисел
    xor     rdx, rdx    ; обнуление перед делением
    idiv    qword[.i20]       ; (/%) -> остаток в rdx
    mov     rax, rdx
    inc     rax         ; должно сформироваться случайное число

    ;mov     rdi, .rndNumFmt
    ;mov     esi, eax
    ;xor     rax, rax
    ;call    printf


leave
ret

;inline auto RandomSpeed() {
;    return rand() % 500 + 1;
;}
global RandomMaxSpeed
RandomMaxSpeed:
section .data
    .i20     dq      500
    .rndNumFmt       db "Random number = %d",10,0
section .text
push rbp
mov rbp, rsp

    xor     rax, rax    ;
    call    rand        ; запуск генератора случайных чисел
    xor     rdx, rdx    ; обнуление перед делением
    idiv    qword[.i20]       ; (/%) -> остаток в rdx
    mov     rax, rdx
    inc     rax         ; должно сформироваться случайное число

    ;mov     rdi, .rndNumFmt
    ;mov     esi, eax
    ;xor     rax, rax
    ;call    printf


leave
ret

;inline auto RandomDisplacement() {
;    return rand() % 50000 + 10;
;}

global RandomFuelCapacity
RandomFuelCapacity:
section .data
    .i20     dq      1000
    .rndNumFmt       db "Random number = %d",10,0
section .text
push rbp
mov rbp, rsp

    xor     rax, rax    ;
    call    rand        ; запуск генератора случайных чисел
    xor     rdx, rdx    ; обнуление перед делением
    idiv    qword[.i20]       ; (/%) -> остаток в rdx
    mov     rax, rdx
    inc     rax         ; должно сформироваться случайное число

    ;mov     rdi, .rndNumFmt
    ;mov     esi, eax
    ;xor     rax, rax
    ;call    printf
;section .data
;    .i20     dq      1000
;    .rndNumFmt       db "Random number = %lg",10,0
;section .bss
;    .prect  resq 1   ;случайно числа
;section .text
;push rbp
;mov rbp, rsp
;
;    xor     rax, rax    
;    call    rand
;    xor     rdx, rdx    ; обнуление перед делением
;    idiv    qword[.i20]   
;    mov     rax, rdx
;    cvtsi2sd    xmm0 , rax
;    mov rax, [.i20]
;    cvtsi2sd    xmm1 , rax
;    divsd    xmm0 , xmm1 ; дробная часть в xmm0
;    movsd xmm2 , xmm0
;     ;Вывод дробной части
;     ;mov     rdi, .rndNumFmt
;;     movsd  xmm0 , xmm2
;;    mov     rax, 1
;;    call    printf
;
;    xor     rax, rax    ;
;    call    rand        ; запуск генератора случайных чисел
;    xor     rdx, rdx    ; обнуление перед делением
;    idiv    qword[.i20]       ; (/%) -> остаток в rdx
;    mov     rax, rdx
;    inc     rax         ; должно сформироваться случайное число
;    cvtsi2sd    xmm1, rax
;    addsd   xmm2 , xmm1
;    movsd xmm0 , xmm2
;    

    ;mov     rdi, .rndNumFmt
;    mov     [rsi], xmm0
;    mov     rax, 1
;    call    printf

;section .data
;    .i20     dq      50000
;    .rndNumFmt       db "Random number = %d",10,0
;section .text
;push rbp
;mov rbp, rsp
;
;    xor     rax, rax    ;
;    call    rand        ; запуск генератора случайных чисел
;    xor     rdx, rdx    ; обнуление перед делением
;    idiv    qword[.i20]       ; (/%) -> остаток в rdx
;    mov     rax, rdx
;    add     rax,10         ; должно сформироваться случайное число
;
;    ;mov     rdi, .rndNumFmt
;    ;mov     esi, eax
;    ;xor     rax, rax
;    ;call    printf
leave
ret

;----------------------------------------------
;// Случайный ввод параметров поезда
;void InRnd(train &t) {
;    t.numberOfRailwayCarriage = Random();
;    t.speed = RandomSpeed();
;    t.distance = RandomDistance();
;}
global InRndAutomobile
InRndAutomobile:
section .data
    .outf  db "InRNDAUTOMOBILE, %d",10,0
section .bss
    .prect  resq 1   ; адрес поезда
section .text
push rbp
mov rbp, rsp

    ; В rdi адрес поезда
    mov     [.prect], rdi
    ; Генерация параметров поезда
    call    RandomMaxSpeed
    mov     rbx, [.prect]
    mov     [rbx], eax
    call    RandomFuelConsumption
    mov     rbx, [.prect]
    mov     [rbx+4], eax
    call    RandomFuelCapacity

    mov     rbx, [.prect]
    mov  [rbx+8], eax
    
;    mov rdi, .outf
;    movsd xmm0 ,[rbx+8]
;    mov rax,1
;    call printf
    
leave
ret

;----------------------------------------------
;// Ввод параметров грузовика из потока
global InRndTruck
InRndTruck:
section .bss
    .prect  resq 1   ; адрес ship
section .text
push rbp
mov rbp, rsp

 ; В rdi адрес поезда
    mov     [.prect], rdi
    ; Генерация параметров поезда
    call    RandomMaxSpeed
    mov     rbx, [.prect]
    mov     [rbx], eax
    call    RandomFuelConsumption
    mov     rbx, [.prect]
    mov     [rbx+4], eax
    call    RandomFuelCapacity

    mov     rbx, [.prect]
    mov  [rbx+8], eax


leave
ret

;// Ввод параметров автобуса из потока
global InRndBus
InRndBus:
section .bss
    .prect  resq 1   ; адрес ship
section .text
push rbp
mov rbp, rsp
    ; В rdi адрес поезда
    mov     [.prect], rdi
    ; Генерация параметров корабля
    call    RandomMaxSpeed
    mov     rbx, [.prect]
    mov     [rbx], eax
    call    RandomFuelConsumption
    mov     rbx, [.prect]
    mov     [rbx+4], eax
    call    RandomFuelCapacity

    mov     rbx, [.prect]
    mov  [rbx+8], eax
    
;    mov rdi, .outf
;    movsd xmm0 ,[rbx+8]
;    mov rax,1
;    call printf
leave
ret

;----------------------------------------------
;// Случайный ввод обобщенной фигуры
;int InRndTransport(void *s) {
    ;int k = rand() % 2 + 1;
    ;switch(k) {
        ;case 1:
            ;*((int*)s) = RECTANGLE;
            ;InRndTrain(s+intSize);
            ;return 1;
        ;case 2:
            ;*((int*)s) = TRIANGLE;
            ;InRndShip(s+intSize);
            ;return 1;
        ;default:
            ;return 0;
    ;}
;}
global InRndCar
InRndCar:
section .data
    .rndNumFmt       db "Random number = %d",10,0
section .bss
    .pshape     resq    1   ; адрес фигуры
    .key        resd    1   ; ключ
section .text
push rbp
mov rbp, rsp

    ; В rdi адрес фигуры
    mov [.pshape], rdi

    ; Формирование признака фигуры
    xor     rax, rax    ;
    call     RandomCarType       ; запуск генератора случайных чисел

    mov     rdi, [.pshape]
    mov     [rdi], eax      ; запись ключа в фигуру
    cmp eax, [TRUCK]
    je .truckInrnd
    cmp eax, [BUS] ; 
    je .busInRnd
    cmp eax, [AUTOMOBILE] ; 
    je .automobileInRnd
    xor eax, eax        ; код возврата = 0
    jmp     .return
.truckInrnd:
    ; Генерация поезда
    add     rdi, 4
    call    InRndTruck
    mov     eax, 1      ;код возврата = 1
    jmp     .return
.busInRnd:
    ; Генерация ship
    add     rdi, 4
    call    InRndBus
    mov     eax, 1      ;код возврата = 1
    jmp     .return
.automobileInRnd:
    ; Генерация ship
    add     rdi, 4
    call    InRndAutomobile
    mov     eax, 1      ;код возврата = 1
    jmp     .return
.return:
leave
ret

;----------------------------------------------
;// Случайный ввод содержимого контейнера
global InRndContainer
InRndContainer:
section .bss
    .pcont  resq    1   ; адрес контейнера
    .plen   resq    1   ; адрес для сохранения числа введенных элементов
    .psize  resd    1   ; число порождаемых элементов
section .text
push rbp
mov rbp, rsp

    mov [.pcont], rdi   ; сохраняется указатель на контейнер
    mov [.plen], rsi    ; сохраняется указатель на длину
    mov [.psize], edx    ; сохраняется число порождаемых элементов
    ; В rdi адрес начала контейнера
    xor ebx, ebx        ; число фигур = 0
.loop:
    cmp ebx, edx
    jge     .return
    ; сохранение рабочих регистров
    push rdi
    push rbx
    push rdx

    call    InRndCar     ; ввод фигуры
    cmp rax, 0          ; проверка успешности ввода
    jle  .return        ; выход, если признак меньше или равен 0

    pop rdx
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
