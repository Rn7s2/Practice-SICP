(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (/ (log (eliminate x 3)) (log 2)))

(define (cdr x)
  (/ (log (eliminate x 2)) (log 3)))

(define (eliminate x n)
  (define (divides? d n)
    (= (remainder n d) 0))
  (if (divides? n x)
      (eliminate (/ x n) n)
      x))

(define t (cons 3 6))
(display (car t))
(display (cdr t))
