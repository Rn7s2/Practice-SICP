#lang sicp

(define (square x)
  (* x x))

(define (fast-pow x n)
  (define (helper x n result)
    (cond ((= n 0) result)
          ((odd? n) (helper x (- n 1) (* x result)))
          (else (helper (square x) (/ n 2) result))))
  (helper x n 1))

(fast-pow 10 1)
