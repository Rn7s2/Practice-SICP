#lang racket

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (count x set)
  (foldr (lambda (y acc) (if (= x y) (+ 1 acc) acc)) 0 set))

(define adjoin-set cons)

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (append (make-list (count (car set1) set2) (car set1))
                 (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define union-set append)

; 用于计算存在几个元素的时候，这种实现有一定应用。
