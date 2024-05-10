(define (list->set xs)
  (define (helper xs lst)
    (cond ((null? xs) lst)
          ((not(member (car xs) lst))
           (helper (cdr xs) (cons (car xs) lst)))
          (else (helper (cdr xs) lst))))
  (helper xs '()))
;;O(n^2)
(define (set? xs)
  (define (helper xs lst)
    (cond ((null? xs) #t)
          ((not (member (car xs) lst))
           (helper (cdr xs) (cons (car xs) lst )))
          (else #f)))
  (helper xs '()))
;;O(n^2)
(define (union xs ys)
  (define (un-helper mults lst)
    (cond ((null? mults) lst)
          ((not(member (car mults) lst))
           (un-helper (cdr mults) (cons (car mults) lst)))
          (else (un-helper (cdr mults) lst))))
  (un-helper (append xs ys) '()))
;;O((n+m)^2)

(define (intersection xs ys)
  (define (intersection-helper xs ys lst)
    (cond ((null? xs) (reverse lst))
      ((member (car xs) ys) (intersection-helper (cdr xs) ys (cons  (car xs) lst)))
      (else (intersection-helper (cdr xs) ys lst))))
  (intersection-helper xs ys '()))
;;O(n * m)

(define (difference xs ys)
  (define (difference-helper xs ys lst)
    (cond ((null? xs) (reverse lst))
      ((member (car xs) ys) (difference-helper (cdr xs) ys lst))
      (else (difference-helper (cdr xs) ys (cons  (car xs) lst)))))
  (difference-helper xs ys '()))
;;O(n * m)
(define (symmetric-difference xs ys)
  (union (difference (difference xs ys) (intersection xs ys))
         (difference  (difference ys xs) (intersection ys xs))))
;;O((n + m)^2)

(define (set-eq? xs ys)
  (if (null? (symmetric-difference xs ys)) #t
      #f))
;;O((n + m)^2)