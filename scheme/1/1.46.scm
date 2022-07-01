#lang sicp

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (let ((next (improve guess)))
      (cond ((good-enough? guess next) next)
            (else (iter next)))))
  iter)

(define (average a b)
  (/ (+ a b) 2.0))

(define tolerance 0.00001)

(define (sqrt x guess)
  ((iterative-improve (lambda (v1 v2) (< (abs (- v1 v2)) tolerance))
                      (lambda (y) (average y (/ x y))))
   guess))

(define (fixed-point f guess)
  ((iterative-improve (lambda (v1 v2) (< (abs (- v1 v2)) tolerance))
                      (lambda (y) (f y)))
   guess))

(sqrt 5 1)
(fixed-point cos 1)
