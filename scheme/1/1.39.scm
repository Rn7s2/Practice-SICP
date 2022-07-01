#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-helper i res)
    (cond ((= i 0) res)
          (else (cont-frac-helper (- i 1) (/ (n i) (+ (d i) res))))))
  (cont-frac-helper k 0))

(define (square x)
  (* x x))

(define (tan-cf x k)
  (cont-frac (lambda (i) (cond ((= i 1) x)
                               (else (- (square x)))))
             (lambda (i) (- (* 2 i) 1))
             k))
