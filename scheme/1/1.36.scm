#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (square x)
  (* x x))

; 不采用"平均阻尼", 33次逼近
(fixed-point (lambda (x) (/ (log 1000) (log x))) 10)
; 采用"平均阻尼", 9次逼近
(fixed-point (lambda (x) (+ (/ x 2) (/ (log 1000) (log (square x))))) 10)
