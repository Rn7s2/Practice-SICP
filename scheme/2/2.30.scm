#lang sicp

(define (square-tree tree)
  (map (lambda (sub-tree)
         (cond ((null? sub-tree) sub-tree)
               ((not (pair? sub-tree)) (square sub-tree))
               (else (square-tree sub-tree))))
       tree))

(define (square x)
  (* x x))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
; (1 (4 (9 16) 25) (36 49))
