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

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3.0)))

(define (n-smooth f n)
  ((repeated smooth n) f))
