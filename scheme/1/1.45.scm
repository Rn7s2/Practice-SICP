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

(define (average a b)
  (/ (+ a b) 2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter n)
    (cond ((= n 1) f)
          (else (compose f (iter (- n 1))))))
  (iter n))

(define (pow a b)
  ((repeated (lambda (x) (* x a)) b) 1.0))

; 以下为n=2到n=21之间的结果
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 1)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 2)))) 2.0)
(fixed-point ((repeated average-damp 2) (lambda (x) (/ 5 (pow x 3)))) 2.0)
(fixed-point ((repeated average-damp 2) (lambda (x) (/ 5 (pow x 4)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 5)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 6)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 7)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 8)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 9)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 10)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 11)))) 2.0)
(fixed-point ((repeated average-damp 3) (lambda (x) (/ 5 (pow x 12)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 13)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 14)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 15)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 16)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 17)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 18)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 19)))) 2.0)
(fixed-point ((repeated average-damp 1) (lambda (x) (/ 5 (pow x 20)))) 2.0)

; 目前我没能从数学上推出一个边界找到规律，还请见者指教