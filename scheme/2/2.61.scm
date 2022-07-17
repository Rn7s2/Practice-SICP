#lang racket

(define (adjoint-set x set)
  (define (iter set res)
    (cond ((null? set) (append res (list x)))
          ((<= x (car set)) (append res (list x) set))
          (else (iter (cdr set) (append res (list (car set)))))))
  (iter set '()))
