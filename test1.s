.section .text
message: .asciz "Hello,ARM\n"
.global _start
.balign 4
_start:
	push {lr}
	mov r3,#3
	mov r0,#3
	bl printf
	bl exit


