(define (cons x y)
  (lambda (m) (m x y)))

(define (car t)
  (t (lambda (x y) x)))

(define (cdr t)
  (t (lambda (x y) y)))

(define z (cons 3 5))
(display (car z))
(display (cdr z))
