.section .data
string: .asciz "name: %d\n"
string1: .asciz "Devansh"
.global main
.balign 4
main:
	push {lr}
	mov r0,#10
	mov r1,#5
	bl __aeabi_idiv
	mov r1,r0
	ldr r0, =string	
	bl printf
	pop {pc}
