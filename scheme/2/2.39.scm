(define (reverse sequence)
  (fold-right (lambda (x acc) (append acc (list x))) '() sequence))

(define (reverse sequence)
  (fold-left (lambda (acc x) (cons x acc)) '() sequence))

(reverse '(1 3 5 7 9))
