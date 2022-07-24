#lang sicp

(define entry car)
(define left-branch cadr)
(define right-branch caddr)

(define (lookup key set)
  (cond ((null? set) false)
        ((= key (car (entry set))) (entry set))
        ((< key (car (entry set))) (lookup key (left-branch set)))
        ((> key (car (entry set))) (lookup key (right-branch set)))))
