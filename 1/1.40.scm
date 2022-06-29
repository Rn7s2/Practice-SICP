#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (cond ((close-enough? guess next) next)
            (else (try next)))))
  (try first-guess))

(define dx 0.00001)

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newtown-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtown-method g guess)
  (fixed-point (newtown-transform g) guess))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(newtown-method (cubic 0 0 0) 1)
