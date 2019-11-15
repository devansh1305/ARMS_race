.data					//data field
arr: .skip 100				//declare 100 bytes of memory for the sub-string


.text					//text field

.global sub_string			//make the sub_string function global so that it may be called first
sub_string:
	push {ip,lr}			//initialize registers
	mov r4,r0			//load the string from the argument block into r4 for computational purposes
	mov r5,r1			//load the start_index from r1 to r5
	mov r6,r2			//load the end_index from r2 to r6
	sub r6,#1			//substract 1 for iteration purposes
	b mech				//jump into mech function

mech:
	ldr r7, =arr			//load the string into r7 for traverse purpose
	mov r9,#0			//initialize r9 for iteration purposes
	b loop				//jump into loop function

loop:
	ldrb r8,[r4,r5]			//load character from r4 at r5 index to r8 for analysis
	str r8,[r7,r9]			//store r8 into r7(sub-string) at index r9
	add r9,#1			//increment the counter
	cmp r5,r6			//compare r5 and r6 to track the loop iterations
	add r5,#1			//increment r5 for traversing the original string
	ble loop			//if r5 < r6 keep looping

end:					//jump into end function
	mov r5,#0			//load null terminator character to r5
	str r5,[r7,r9]			//store the null terminator at the end of sub-string 
	ldr r0, =arr			//load the sub-string into r0 for return purpose
	pop {ip,pc}			//free the registers
