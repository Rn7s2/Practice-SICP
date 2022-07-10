#lang sicp

(define (accumulate op initial sequence)
  (cond ((null? sequence) initial)
        (else (op (car sequence)
                  (accumulate op initial (cdr sequence))))))

(define (map p sequence)
  (accumulate (lambda (x acc) (cons (p x) acc)) nil sequence))

(define (count-leaves t)
  (if (not (pair? t))
      1
      (accumulate (lambda (x acc) (+ x acc)) 0 (map (lambda (x) (count-leaves x)) t))))

(count-leaves '(1 (2 3) (4 (5 6))))
