(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson-integral f a b n)
  (* (/ (- b a) (* 3 n))
     (sum (lambda (k)
            (cond ((= k 0) (f a))
                  ((= k n) (f b))
                  ((odd? k) (* 4 (f (+ a (* k (/ (- b a) n))))))
                  (else (* 2 (f (+ a (* k (/ (- b a) n))))))))
          0
          (lambda (k) (+ k 1))
          n)))
