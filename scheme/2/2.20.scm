#lang sicp

(define (same-parity . lst)
  (define (filter is-odd lst)
    (if (null? lst)
        '()
        (if ((if is-odd odd? even?) (car lst))
            (cons (car lst) (filter is-odd (cdr lst)))
            (filter is-odd (cdr lst)))))
  (if (odd? (car lst))
      (filter #t lst)
      (filter #f lst)))

(same-parity 1 2 3 4 5 6 7)
