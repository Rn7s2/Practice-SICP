#lang sicp

(define (reverse list)
  (if (null? (cdr list))
      list
      (append (reverse (cdr list)) `(,(car list)))))

(reverse '(1 4 9 16 25))
