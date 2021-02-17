;*Exercise 1.8:* Newton's method for cube roots is based on the
;fact that if y is an approximation to the cube root of x, then a
;better approximation is given by the value
;x/y^2 + 2y
;----------
;   3
;Use this formula to implement a cube-root procedure analogous to
;the square-root procedure.

(define (improve guess x)
  (display guess)
  (newline)
  (/ (+(/ x (power guess 2)) (* 2 guess)) 3)) 


(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (qube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (qube-root-iter (improve guess x)
                 x)))

(define (qube-root x)
  (qube-root-iter 1.0 x))


(define (power x y)
  (if (< y 0)
      (neg-power x y)
      (pos-power x y)))

(define (pos-power x y)
  (if (= y 0)
      1
      (* x (pos-power x (- (abs y) 1)))))

(define (neg-power x y)
  (if (= y 0)
      1
      (* (/ 1 x) (neg-power x (- (abs y) 1)))))
