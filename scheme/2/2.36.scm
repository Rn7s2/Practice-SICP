#lang sicp

(define (accumulate op initial sequence)
  (cond ((null? sequence) initial)
        (else (op (car sequence)
                  (accumulate op initial (cdr sequence))))))

(define (map p sequence)
  (accumulate (lambda (x acc) (cons (p x) acc)) nil sequence))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

(accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
