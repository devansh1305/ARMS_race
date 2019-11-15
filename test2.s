.data
out0: .asciz "Enter a string: "			//format for printing of string input
out1: .asciz "Enter the start index: "		//format for printing of input of start index
out2: .asciz "Enter the end index: "		//format for printing of input of end index
out3: .asciz "The substring of the given string is '"		//format for printing of the substring
out4: .asciz "'\n"
input1: .asciz "%d"				//format for input of start index
input2: .asciz "%d"				//format for input of end index
in1: .word 4					//to store the start index
in2: .word 4					//to store the end index

MyStringInput: .asciz "%s"			//for the user to input string
string: .skip 100				//declare 100 bytes of memory for the string


.text

.global main					//to make the main a global field to be executed
main:						//go into main method
	push {ip,lr}				//initialize registers 
	
	ldr r0,=out0				//load the "out0" into r0 
	bl printf				//print the content of r0

	ldr r0,=MyStringInput			/* Load r0 with the address symbolized by "MyStringInput", the first byte */
	ldr r1,=string				//to load the string from r1 to the string variable
	bl scanf				//to accept the string input from user
	ldr r6,=string				//load the string input into general purpose register for computational use
	
	ldr r0,=out1				//load the "out1" into r0 
	bl printf				//print the content of r0
	
	ldr r0,=input1				//to take in the integers and store it in in1
	ldr r1,=in1				//register r1 saves the integer and loads it to in1
	bl scanf				//to scan the integer from the user

	ldr r0,=out2				//load the "out2" into r0
	bl printf				//print the content of r0
	
	ldr r0,=input2				//to take in the integers and store it in in2
	ldr r1,=in2				//register r1 saves the integer and loads it to in2
	bl scanf				//to scan the integer from the user
	
	ldr r4,=in1				//to load the address of in1 in register r4
	ldr r4,[r4]				//to derefrence the value in r4 to save in r4
	ldr r5,=in2				//to load the address of in2 in register r5
	ldr r5,[r5]				//to derefrence the value in r5 to save in r5
	
sub:						//jump to sub
	mov r0,r6				//to load the value of r6(string) into r0
	mov r1,r4				//to load the value of r4(start_index) into r1
	mov r2,r5				//to load the value of r5(end_index) into r2
	bl sub_string				//jump to the sub_string.c function and pass the control
	

end:						//jump to the end part
	mov r6,r0				//to load the substring returned from sub_string.c 
	ldr r0,=out3				//load the "out3" into r0
	bl printf				//print
	mov r0,r6				//to load the sub-string for printing
	bl printf				//print
	ldr r0,=out4				//load the "out3" into r0
	bl printf				//print
	pop {ip,pc}				//free the registers

