.section .data
string: .asciz "name: %s\n"
string1: .asciz "Devansh"
.global main
.balign 4
main:
	push {lr}
	ldr r0, =string
	ldr r1, =string1
	bl printf
	pop {pc}
