#lang sicp

(define entry car)
(define left-branch cadr)
(define right-branch caddr)

(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (append (copy-to-list (right-branch tree)
                                                  result-list))))))
  (copy-to-list tree '()))

(define t1 (make-tree 7
                      (make-tree 3
                                 (make-tree 1 nil nil)
                                 (make-tree 5 nil nil))
                      (make-tree 9
                                 nil
                                 (make-tree 11 nil nil))))
(define t2 (make-tree 3
                      (make-tree 1 nil nil)
                      (make-tree 7
                                 (make-tree 5 nil nil)
                                 (make-tree 9
                                            nil
                                            (make-tree 11 nil nil)))))
(define t3 (make-tree 5
                      (make-tree 3
                                 (make-tree 1 nil nil)
                                 nil)
                      (make-tree 9
                                 (make-tree 7 nil nil)
                                 (make-tree 11 nil nil))))

;; a)
;; 它们都一样, 因为构建树的时候，本身就保证了良好的顺序
(tree->list-1 t1)
(tree->list-2 t1)
(tree->list-1 t2)
(tree->list-2 t2)
(tree->list-1 t3)
(tree->list-2 t3)

;; b) 假设处理的树都是平衡的
;; 第一种方法
;  T(n)=2*T(n/2)+O(n/2) append为线性时间复杂度
;  T(n)=O(n*log n)
;; 第二种方法
;  T(n)=2*T(n/2)+O(1)
;  T(n)=O(n)
