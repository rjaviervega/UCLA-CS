Define arraySize 7
Define arrayAddr 50

		
		addi 	r7, r0, arraySize 	; r7 = arraySize	:0
		sw 	r7, 44(r0)
		addi	r6, r0, arrayAddr	; r6 = arrayAddr		:2
		sw	r6, 46(r0)
		addi 	r1, r0, 1		; r1 = 1			:4
		sw	r1, 48(r0)
		
for:		slt 	r5, r1, r7		; if r1 >= r7, goto end	:6
		beq	r5, r0, end		;				:8
						
		lw	r4, arrayAddr (r1)	; r4 = array[arrayAddr + r1] :10
		addi 	r3, r4, 0		; r3 = r4	:12

while:		slt	r5, r0, r3	; :14
		beq	r5, r0, endWhile	; 16
		dec	r2, r3			; r2 = r3 - 1 :18
		lw	r2, arrayAddr (r2)	; r2 = array[ j -1 ] :20
		slt	r5, r4, r2			; :22
		beq	r5, r0, endWhile		; :24
		
		sw	r2, 0 (r3)			; :26
		dec	r3, r3			; :28

		j	while				; :30

endWhile:	sw	r4, 0 (r3)			; :32
		
		j	for				; :34

end:		hlt					; :36
		

;r7 	array_size
;r6	numbers[]
;r5 	temp
;r4	index
;r3	j
;r2 	temp
;r1	i