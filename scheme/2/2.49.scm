(define (make-segment v1 v2)
  (cons v1 v2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each (lambda (segment)
                (draw-line ((frame-coord-map frame) (start-segment segment))
                           ((frame-coord-map frame) (end-segment segment))))
              segment-list)))

(segments->painter (list (make-segment (make-vect 0 0) (make-vect 0 1))
                         (make-segment (make-vect 0 1) (make-vect 1 1))
                         (make-segment (make-vect 1 1) (make-vect 1 0))
                         (make-segment (make-vect 1 0) (make-vect 0 0))))
(segments->painter (list (make-segment (make-vect 0 0) (make-vect 1 1))
                         (make-segment (make-vect 0 1) (make-vect 1 0))))
(segments->painter (list (make-segment (make-vect 0 0.5) (make-vect 0.5 1))
                         (make-segment (make-vect 0.5 1) (make-vect 1 0.5))
                         (make-segment (make-vect 1 0.5) (make-vect 0.5 0))
                         (make-segment (make-vect 0.5 0) (make-vect 0 0.5))))
;; 为什么要去模仿这个wave呢？我不想这么做。
