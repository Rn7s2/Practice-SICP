#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (first lst)
  (car lst))

(define (second lst)
  (car (cdr lst)))

(define (left-branch mobile)
  (first mobile))

(define (right-branch mobile)
  (second mobile))

(define (branch-length branch)
  (first branch))

(define (branch-structure branch)  
  (second branch))

(define (not-mobile? mobile)
  (not (and (list? mobile)
            (= (length mobile) 2))))

(define (total-weight mobile)
  (define lb (left-branch mobile))
  (define rb (right-branch mobile))
  (define wl (cond ((not-mobile? (branch-structure lb)) (branch-structure lb))
                   (else (total-weight (branch-structure lb)))))
  (define wr (cond ((not-mobile? (branch-structure rb)) (branch-structure rb))
                   (else (total-weight (branch-structure rb)))))
  (+ wl wr))

(define (balanced? mobile)
  (define lb (left-branch mobile))
  (define rb (right-branch mobile))
  (= (* (branch-length lb) (total-weight (branch-structure lb)))
     (* (branch-length rb) (total-weight (branch-structure rb)))))

;; After changing representation:
(define (make-mobile-1 left right)
  (cons left right))

(define (make-branch-1 length structure)
  (cons length structure))

(define (left-branch-1 mobile)
  (car mobile))

(define (right-branch-1 mobile)
  (cdr mobile))

(define (branch-length-1 branch)
  (car branch))

(define (branch-structure-1 branch)  
  (cdr branch))

(define (not-mobile-1? mobile)
  (not (and (pair? mobile)
            (not (null? (car mobile)))
            (not (null? (cdr mobile))))))

(define (total-weight-1 mobile)
  (define lb (left-branch-1 mobile))
  (define rb (right-branch-1 mobile))
  (define wl (cond ((not-mobile-1? (branch-structure-1 lb)) (branch-structure-1 lb))
                   (else (total-weight-1 (branch-structure-1 lb)))))
  (define wr (cond ((not-mobile-1? (branch-structure-1 rb)) (branch-structure-1 rb))
                   (else (total-weight-1 (branch-structure-1 rb)))))
  (+ wl wr))

(define (balanced-1? mobile)
  (define lb (left-branch-1 mobile))
  (define rb (right-branch-1 mobile))
  (= (* (branch-length-1 lb) (total-weight-1 (branch-structure-1 lb)))
     (* (branch-length-1 rb) (total-weight-1 (branch-structure-1 rb)))))
