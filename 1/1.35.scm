#lang sicp

; x=1+1/x
; x^2-x-1=0
; 黄金分割率是其负根的相反数

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(- (fixed-point (lambda (x) (/ (+ x (/ 1 x) 1) 2)) -1.0))
