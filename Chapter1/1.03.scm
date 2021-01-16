;Exercise 1.3:* Define a procedure that takes three numbers as
;arguments and returns the sum of the squares of the two larger numbers.


;TODO Don't be no brainer
(define (sum-square-two-larger x y z)
  (cond
   ((and (>= x y) (>= y z)) (+ (* x x) (* y y)))
   ((and (>= x z) (>= z y)) (+ (* x x) (* z z)))
   
   ((and (>= y x) (>= x z)) (+ (* y y) (* x x)))
   ((and (>= y z) (>= z x)) (+ (* y y) (* z z)))

   ((and (>= z x) (>= x y)) (+ (* z z) (* x x)))
   ((and (>= z y) (>= y x)) (+ (* z z) (* y y)))
   ))
