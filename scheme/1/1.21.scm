#lang sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? d n)
  (= (remainder n d) 0))

(display (smallest-divisor 199))
(display (smallest-divisor 1999))
(display (smallest-divisor 19999))
