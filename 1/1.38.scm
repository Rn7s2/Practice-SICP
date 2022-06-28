#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-helper i res)
    (cond ((= i 0) res)
          (else (cont-frac-helper (- i 1) (/ (n i) (+ (d i) res))))))
  (cont-frac-helper k 0))

(define (e)
  (+ 2 (cont-frac (lambda (i) 1.0)
                  (lambda (i)
                    (if (= 0 (remainder (+ i 1) 3))
                        (* 2.0 (/ (+ i 1) 3))
                        1.0))
                  100)))

(e)
