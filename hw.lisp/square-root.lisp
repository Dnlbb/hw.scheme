(define (discr a b c) (- (* b b) (* 4 a c)))
(define (square-equation a b c)
  (cond ((< (discr a b c) 0) '())
        ((= (discr a b c) 0) (list (/ (+ (- b) (sqrt (discr a b c))) (* 2 a))))
        ((> (discr a b c) 0)
         (let ((x2 (/ (+ (- b) (sqrt (discr a b c))) (* 2 a)))
               (x1 (/ (- (- b) (sqrt (discr a b c))) (* 2 a))))
           (list x1 x2)))))
