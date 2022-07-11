(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions) (safe? k positions))
                (flatmap (lambda (new-row)
                           (map (lambda (rest-of-queens) (adjoin-position new-row k rest-of-queens))
                                (queen-cols (- k 1))))
                         (enumerate-int 1 (+ 1 board-size))))))
  (queen-cols board-size))

(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))

(define (enumerate-int l r)
  (define (iter i result)
    (if (< i l)
        result
        (iter (- i 1) (cons i result))))
  (iter (- r 1) '()))

(define empty-board '())

(define (conflict? q1 q2)
  (or (= (cdr q1) (cdr q2))
      (= (- (cdr q1) (car q1))
         (- (cdr q2) (car q2)))
      (= (+ (cdr q1) (car q1))
         (+ (cdr q2) (car q2)))))

(define (safe? k positions)
  (define new-queen (list-ref positions (- k 1)))
  (define (iter positions)
    (cond ((null? (cdr positions)) #t)
          ((conflict? (car positions) new-queen) #f)
          (else (iter (cdr positions)))))
  (iter positions))

(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list (cons k new-row))))

; 交换顺序使得本来只要调用1遍的子问题需要调用board-size遍
; 原来每次需要调用1次最小子问题
; 现在每次需要调用(pow board-size (- board-size 1))遍最小子问题
; 然而计算出精确的T的倍数并不简单
; https://wernerdegroot.wordpress.com/2015/08/01/sicp-exercise-2-43/
