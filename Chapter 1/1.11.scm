#lang sicp

(define (recursion-f n)
  (cond ((< n 3) n)
        (else (+ (recursion-f (- n 1))
                 (* 2 (recursion-f (- n 2)))
                 (* 3 (recursion-f (- n 3)))))))

(define (iteration-f n)
  (define (helper-f n
                    cur
                    pre-val
                    pre-pre-val
                    pre-pre-pre-val)
    (if (>= cur n)
        (+ pre-val
           (* 2 pre-pre-val)
           (* 3 pre-pre-pre-val))
        (helper-f n
                  (+ 1 cur)
                  (+ pre-val
                     (* 2 pre-pre-val)
                     (* 3 pre-pre-pre-val))
                  pre-val
                  pre-pre-val)))
  (if (< n 3)
      n
      (helper-f n 3 2 1 0)))

(define x 10)
(iteration-f x)
(recursion-f x)
