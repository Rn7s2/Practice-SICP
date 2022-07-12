(define (below painter1 painter2)
  (let ((split-point (make-vect 0 0.5)))
    (let ((paint-above
           (transform-painter painter2
                              split-point
                              (make-vect 0.0 0.5)
                              (make-vect 1.0 0.0)))
          (paint-below
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 1.0 0.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

(define (below painter1 painter2)
  (rotate270 (beside (rotate90 painter2) (rotate90 painter1))))
