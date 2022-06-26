#lang sicp

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

;; 为了检查正确性，定义如下的f，检查时调用
;; ((two f) x) 看输出了几个"applied f"即可
;; 其中的x可以是任意数
(define (f x)
  (display "applied f "))
