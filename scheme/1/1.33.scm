#lang sicp

(define (square x)
  (* x x))

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (if (filter (term a))
            (iter (next a) (combiner (term a) result))
            (iter (next a) result))))
  (iter a null-value))

(define (filtered-product filter term a next b)
  (filtered-accumulate filter * 1 term a next b))

(define (filtered-sum filter term a next b)
  (filtered-accumulate filter + 0 term a next b))

(define (prime? n)
  (define (find-divisor n test-divisor)
    (define (divides? d n)
      (= (remainder n d) 0))
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (smallest-divisor n)
    (find-divisor n 2))
  (= (smallest-divisor n) n))

(define (f a b)
  (filtered-sum prime? (lambda (x) x) a (lambda (x) (+ x 1)) b))

(define (g n)
  (define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
  (filtered-product (lambda (x) (= (gcd x n) 1)) (lambda (x) x) 1 (lambda (x) (+ x 1)) (- n 1)))
