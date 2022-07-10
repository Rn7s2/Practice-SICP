#lang sicp

(define (fringe x)
  (cond ((null? x) x)
        ((not (list? (car x))) (cons (car x) (fringe (cdr x))))
        (else (append (fringe (car x)) (fringe (cdr x))))))

(define x (list 2 (list 1 2 (list 5)) (list 3 4)))

(fringe x)
