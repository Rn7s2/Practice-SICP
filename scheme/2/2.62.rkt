#lang racket

(define (union-set set1 set2)
  (cond ((and (null? set1) (null? set2)) null)
        ((null? set1) set2)
        ((null? set2) set1)
        ((= (car set1) (car set2)) (cons (car set1) (union-set (cdr set1) (cdr set2))))
        ((< (car set1) (car set2)) (cons (car set1) (union-set (cdr set1) set2)))
        ((> (car set1) (car set2)) (cons (car set2) (union-set set1 (cdr set2))))))

(union-set '(1 2 3 5 6) '(1 3 5 7 9))
