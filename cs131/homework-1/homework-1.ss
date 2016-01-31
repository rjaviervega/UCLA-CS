;Name: Roberto Javier Vega SID: 003-110-717
;
(define ( compare-code code1 code2 )
	( if ( null? code1 )
	  ( if ( null? code2 )
	    '()	     
	    ( list (list '<> '() code2 ) ) 
	  )
	  ( if ( null? code2 )
	    ( list (list '<> code1 '() ) ) 
            ( if ( equal? (car code1) (car code2) )
               ( cons 
		 (car code1) 
		 (compare-code (cdr code1) (cdr code2)) )
               ( cons 
		 (cons '<> (list (car code1) (car code2)) )
	         (compare-code   (cdr code1) (cdr code2)) ) )
	    )	
	)
)
