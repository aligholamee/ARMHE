				PRESERVE8
                THUMB

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
__Vectors
				DCD  0x20001000     ; stack pointer value when stack is empty
				DCD  Reset_Handler  ; reset vector

				AREA	myCode, CODE, READONLY

GPIOC_CRL   	EQU     0x40011000
GPIOC_CRH   	EQU     0x40011004
GPIOC_IDR   	EQU     0x40011008
GPIOC_ODR   	EQU     0x4001100C
GPIOC_BSRR  	EQU     0x40011010
GPIOC_BRR   	EQU     0x40011014
GPIOC_LCKR  	EQU     0x40011018

				ENTRY
Reset_Handler

; You'd want code here to enable GPIOC clock in AHB

            MOV32   r1, #GPIOC_CRH      ; Address for port c control register
            MOV32   r0, #0x00033330     ; Value for control register
            STR     r0, [r1]            ; Write to contorl register

            MOV32   r1, #GPIOC_ODR      ; Address for port c output data register
            MOV     r0, #0x0A00         ; Value for port c
            STR     r0, [r1]            ; Write value
loop
            B       loop

			END
