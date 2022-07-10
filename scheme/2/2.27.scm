#lang sicp

(define x (list 1 (list 1 (list 4 6)) (list 3 4) 6))

(define (deep-reverse x)
  (cond ((null? x) x)
        ((not (list? (car x))) (append (deep-reverse (cdr x)) (list (car x))))
        (else (append (deep-reverse (cdr x)) (list (deep-reverse (car x)))))))

(deep-reverse x)
