(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))

(define (enumerate-int l r)
  (define (iter i result)
    (if (< i l)
        result
        (iter (- i 1) (cons i result))))
  (iter (- r 1) '()))

(define (unique-tri-pairs n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list k j i))
                             (enumerate-int 1 j)))
                      (enumerate-int 1 i)))
           (enumerate-int 1 (+ n 1))))

(define (tri-pair-sum pair)
  (+ (car pair) (cadr pair) (caddr pair)))

(define (tri-pair-sum-eql n s)
  (filter (lambda (p) (= (tri-pair-sum p) s)) (unique-tri-pairs n)))
