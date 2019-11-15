.section .text
.global _start
_start:
	push {lr}
	mov r2,#2
	mov r3,#3
	add r0,r2,r3
	bl exit


