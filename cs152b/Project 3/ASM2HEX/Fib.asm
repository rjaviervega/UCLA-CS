		addi	r6, r0, 1	;r6 = 1    
		addi	r4, r0, 13	;r4 = n
		addi	r1, r0, 1	;int a=1
		addi	r2, r0, 1	;int b=1
		addi 	r3, r0, 3	;int i=3
	for:	slt 	r5, r4, r3	;if n<i, r5=1
		beq	r5, r6, endFor	;if r5=1, goto endFor
		add	r5, r1, r2	;int c = a + b
		add	r1, r2,	r0	;a = b + 0
		add	r2, r5, r0	;b = c + 0
		inc	r3, r3		;i++
		sw 	r2, 40(r0)
		j	for
    
endFor:	sw	r2, 40 (r0)
		hlt

;;;;;;;  THE ANSWER IS CONTAINED IN r2 ;;;;;;;;;;;;;;
    
    
;    int fib(int n)
;    {
;   	int a = 1, b = 1;
;    	
;	for (int i = 3; i <= n; i++) {
;       	int c = a + b;
;        	a = b;
;        	b = c;
;    	}
;    	
;	return b;
;    }

;r1	a
;r2	b
;r3	i
;r4	n
;r5	temp1
;r6	temp2