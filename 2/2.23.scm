(define (for-each procedure list)
  (cond ((null? list) #t)
        (else
         (procedure (car list))
         (for-each procedure (cdr list)))))
