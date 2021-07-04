(define (cube-root x)
  (define (square x)
    (* x x))
  (define (good-enough? old new)
    (< (abs (- old new)) 0.000000000000001))
  (define (guess-and-improve guess)
    (define new-guess (/ (+ (/ x (square guess)) (* 2 guess)) 3))
    (if (good-enough? guess new-guess)
        new-guess
        (guess-and-improve new-guess)))
  (guess-and-improve 3.0))

(cube-root -125)
