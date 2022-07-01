#lang sicp

(define (double f)
  (lambda (x) (f (f x))))

; 等同于应用了16次inc
(((double (double double)) inc) 5)
