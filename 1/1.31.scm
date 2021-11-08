(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(define (approach-pi n)
  (* 4
     (/ (product (lambda (x) (square (/ (+ x 1) x))) 3 (lambda (x) (+ x 2)) (+ 3 (* 2 n))) (+ n 2))))
