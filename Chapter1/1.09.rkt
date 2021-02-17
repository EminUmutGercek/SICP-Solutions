;*Exercise 1.9:* Each of the following two procedures defines a
;method for adding two positive integers in terms of the procedures
;`inc', which increments its argument by 1, and `dec', which
;decrements its argument by 1.

(define (inc a)
  (+ 1 a))

(define (dec a)
  (- a 1))


(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))
;(+ 3 4)
;(inc (+ (2) 4))
;(inc (inc (+ (1) 4)))
;(inc (inc (inc (+ (0) 4))))
;(inc (inc (inc 4)))
;(inc (inc (5)))
;(inc (6))
;(7)
; It grows and shirnks
; It has waiting operations -> recursive.



;(define (+ a b)
;  (if (= a 0)
;      b
;      (+ (dec a) (inc b))))

;(+ 3 4)
;(+ (2) (5))
;(+ (1) (6))
;(+ (0) (7))
;(7)
; Result is 7

;Iterative: If interpreter holds state variables it can resuem after stop.
