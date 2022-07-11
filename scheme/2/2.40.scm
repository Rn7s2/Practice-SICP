(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list j i))
                  (enumerate-int 1 i)))
           (enumerate-int 1 (+ n 1))))

(define (enumerate-int l r)
  (define (iter i result)
    (if (< i l)
        result
        (iter (- i 1) (cons i result))))
  (iter (- r 1) '()))

(define (min-divisor n)
  (define (iter i)
    (if (= (remainder n i) 0)
        i
        (iter (+ i 1))))
  (iter 2))

(define (prime? n)
  (= (min-divisor n) n))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair)
        (cadr pair)
        (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (fold-right cons '() (map make-pair-sum (filter prime-sum? (unique-pairs n)))))
