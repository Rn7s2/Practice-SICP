#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-helper k i)
    (cond ((= i k) (/ (n i) (d i)))
          (else (/ (n i) (+ (d i) (cont-frac-helper k (+ i 1)))))))
  (cont-frac-helper k 1))

(define (cont-frac-iter n d k)
  (define (cont-frac-iter-helper i res)
    (cond ((= i 0) res)
          (else (cont-frac-iter-helper (- i 1) (/ (n i) (+ (d i) res))))))
  (cont-frac-iter-helper k 0))

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)
(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 11)
