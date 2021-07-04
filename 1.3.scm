(define (sum-max a b c)
  (cond ((and (> a c) (> b c)) (+ a b))
        ((and (> a b) (> c b)) (+ a c))
        (else (+ b c))))

(sum-max 3 5 7)
