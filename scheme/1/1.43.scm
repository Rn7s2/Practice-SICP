#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter n)
    (cond ((= n 0) (lambda (x) x))
          (else (compose f (iter (- n 1))))))
  (iter n))

(define (square x)
  (* x x))

((repeated square 2) 5)
