(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 '(1 2 3))
(fold-left / 1 '(1 2 3))
(fold-right list '() '(1 2 3))
(fold-left list '() '(1 2 3))

;; 如果(op x y)的值与x和y的顺序无关，那么fold-right和fold-left结果相同。
(= (fold-right + 0 '(1 2 3)) (fold-left + 0 '(1 2 3)))
(= (fold-right * 1 '(1 2 3)) (fold-left * 1 '(1 2 3)))
