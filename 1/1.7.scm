#lang sicp

;; 假如x是0.0000000001，正确的平方根是0.000001，但是由于
;; 选定的猜测值比较小，第一次good-enough?就判断为真了。

;; 假如x是很大的数，而计算机的精度有限，很可能平方的精度低于
;; good-enough?选定的0.001，就永远得不出结果。

;; 新定义的求平方根过程
(define (sqrt x)
  (define (sqrt-iter guess old-guess x)
    (define (good-enough? guess old-guess x)
      (< (/ (abs (- guess old-guess)) guess) 0.001))
    (define (improve guess x)
      (define (average x y)
        (/ (+ x y) 2.0))
      (average guess (/ x guess)))
    (if (good-enough? guess old-guess x)
        guess
        (sqrt-iter (improve guess x) guess x)))
  (sqrt-iter 1.0 0 x))
