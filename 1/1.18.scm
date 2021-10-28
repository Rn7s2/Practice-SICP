(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (mul a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((odd? b) (+ a (mul a (- b 1))))
        (else (mul (double a) (halve b)))))

(mul 4294967296 2147483648)
