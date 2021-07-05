#lang sicp

(define (double x)
  (+ x x))

(define (halve x)
  ;; 这个定义有点搞笑
  (/ x 2))

(define (mul a b)
  ;; 当a < b时我们本应交换a和b, 这里略
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((odd? b) (+ a (mul a (- b 1))))
        (else (mul (double a) (halve b)))))

(mul 4294967296 2147483648)
