#lang sicp

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (f n)
  (* 2 n))

(define (g n)
  (expt 2 n))

(define (h n)
  (expt (expt 2 n)))
