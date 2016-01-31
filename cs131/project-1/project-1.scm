;Roberto Javier Vega - SID: 003-110-717
;CS131: Project #1 Pattern Matcher

(define match-null
  (lambda (frag)
    (if (eq? '() frag)
        #t
        #f)))

(define match-*
  (lambda (matcher frag)
    (or (match-null frag)
        (matcher frag)
        (if (and (pair? frag) (not (null? (cdr frag))) (not (null? (cadr frag))))
            (match-* matcher (cdr frag))
            #f))))

(define make-pmatcher
  (lambda (pat)
    (if (null? pat)
        #t
        (cond
          
          ;boolean
          ((eq? 'boolean pat)
           (lambda (frag)
             (if (boolean? frag)
                 #t
                 #f)))
          
          ;symbol
          ((eq? 'symbol pat)
           (lambda (frag)
             (if (symbol? frag)
                 #t
                 #f)))
          
          ;pair
          ((eq? 'pair pat)
           (lambda (frag)
             (if (pair? frag)
                 #t
                 #f)))              
          
          ;list
          ((eq? 'list pat)
           (lambda (frag)
             (if (list? frag)
                 #t
                 #f)))          
          
          ;char
          ((eq? 'char pat)
           (lambda (frag)
             (if (char? frag)
                 #t
                 #f)))              
          
          ;vector
          ((eq? 'vector pat)
           (lambda (frag)
             (if (vector? frag)
                 #t
                 #f)))
          
          ;number
          ((eq? 'number pat)
           (lambda (frag)
             (if (number? frag)
                 #t
                 #f)))
          
          ;string
          ((eq? 'string pat)
           (lambda (frag)
             (if (string? frag)
                 #t
                 #f)))
          
          ;obj
          ((eq? 'obj pat)
           (lambda (frag)
             (if (not (null? frag))
                 #t
                 #f)))
          
          ;quote
          ((eq? 'quote (car pat))
           (lambda (frag)
             (if (null? frag)
                 #f
                 (if (equal? pat (list 'quote frag))
                     #t
                     #f))))
          
          ;(is procedure)
          ((eq? 'is (car pat))
           (lambda (frag)
             (if (pair? frag)
                 (if (eq? #f (`,(cadr pat) `,(car frag)))
                     #f
                     #t)
                 (if (eq? #f (`,(cadr pat) frag))
                     #f
                     #t))))
          
          ;or
          ((eq? 'or (car pat))
           (let make-or-matcher ((pats (cdr pat)))
             (if (null? pats)
                 (lambda (frag) #f)
                 (let ((head-matcher (make-pmatcher (car pats)))
                       (tail-matcher (make-or-matcher (cdr pats))))
                   (lambda (frag)
                     (or (head-matcher frag)
                         (tail-matcher frag)))))))
          
          ;cons
          ((eq? 'cons (car pat))
           (let make-cons-matcher ((pats (cdr pat)))
             (if (null? pats)
                 (lambda (frag) #f)
                 (let ((head-matcher (make-pmatcher (car pats)))
                       (tail-matcher (make-pmatcher (cadr pats))))
                   (lambda (frag)
                     (and (if (pair? frag) (head-matcher (car frag)) #f)
                          ( if (pair? (car frag))
                               (tail-matcher (cadr frag))
                               #f )))))))
          
          ;list
          ((eq? 'list (car pat))
           (if (null? (cdr pat))
               (lambda (frag)
                 (if (list? frag)
                     (null? frag)
                     #f))
               (let make-list-matcher ((pats (cdr pat)))
                 (if (null? pats)
                     (lambda (frag)
                       (if (null? frag)
                           #t
                           #f))
                     (let ((head-matcher (make-pmatcher (car pats)))
                           (tail-matcher (make-list-matcher (cdr pats))))
                       (lambda (frag)
                         (if (or (null? frag) (not (pair? frag)))
                             #f
                             (and (head-matcher (car frag))
                                  (tail-matcher (cdr frag))
                                  ))))))))


          ;append
          ((eq? 'append (car pat))
           (let make-append-matcher ((pats (cdr pat)))
             (if (or (null? pats) (not (pair? (car pats))))
                 (lambda (frag) #f)
                 (let ((head-matcher (make-pmatcher (car pats)))
                       (tail-matcher (make-append-matcher (cdr pats))))
                   (lambda (frag)
                     (or (head-matcher frag)
                         (tail-matcher frag)))))))

          ;*-matcher
          ((eq? '* (car pat))
           (let ((matcher (make-pmatcher (cadr pat))))
             (lambda (frag)
               (match-* matcher frag))))
          
          (else (lambda (frag) #f))
          ))))
