;*Exercise 1.10:* The following procedure computes a mathematical
;function called Ackermann's function.
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
(A 1 10)
; 1024

(A 2 4)
; 65536

(A 3 3)
; 65536

; http://community.schemewiki.org/?sicp-ex-1.10
; Nice visualization for steps 

(define (f n) (A 0 n))
; 2n

(define (g n) (A 1 n))
; Recursive Definition
; g(n) = g(n-1) * 2 
; g(0) = 0


; A(1,n) = A((0), A(1, (n-1))
; A(1,n) = 2 . A(1, (n - 1))
; A(1,n) = 2 . A((0), A(1, (n - 1)))
; A(1,n) = 2 . 2 . A(1, (n - 1)))
; We can see that it's 2^n . k
n = 1 (A 1 1) -> 2
n = 2 (A 1 2) -> 4
n = 3 (A 1 3) -> 8
; And inital value is 2 so 
; It's 2^n except 0



; TODO Can this solve  with linear recurrence relation?
; m^n = m^(n-1) * 2
; a = m^n  
; a^2 -2a = 0
; a(a -2 ) = 0
; a = {0, 2}
; 0^n and 2^n
; g(n) = c1 . 0^n + c2. 2^n

(define (h n) (A 2 n))
; A(2,n) = A(1, A(2, (n-1)))
; A(2,n) = A(1, A(2, (n-1)))
; A(2,n) = A(0 , A(1, (A(2, (n-1)) - 1)))
n = 1 (A 2 1) -> 2      2^1
n = 2 (A 2 2) -> 4      2^2
n = 3 (A 2 3) -> 16     2^4
n = 4 (A 2 4) -> 65536  2^16
n = 5 (A 2 5) -> Aborting!: maximum recursion depth exceeded
; (A 2 2)
; (A 1 (A 2 1))
; (A 1 (2))
; (A 1 (2))
; (A 0 2))
; Now we know it's (f n) so it's 2^n after here we only need to find value 
; That passed to (f n)

; (A 2 3)
; (A 1 (A 2 2))
; (A 1 (A 1 (A 2 1)))
; (A 1 (A 1 (2)))
; (A 1 (A 0 (A 1 1)))
; (A 1 (A 0 2))
; (A 1 (4))
; It's (g n)
; We will find n^2

; Inputs of (g n) are like this
; (h 2) = (g 2)  = (h 1)
; (h 3) = (g 4)  = (h 2)
; (h 4) = (g 16) = (h 3)
; We can sees that these are previous fucntions output
; So f(n) = 2^f(n-1)
; (h 0) is exception and it's 1
; Base case is (h 1) which is 2
; TODO Find symbol for this

; Ackermann's functions are not primitive recursive.Funcitons
; Today there is lots of variants o Ackermmann's function
; Probably this is a variant too.
; The most popular one (Ackermann-Peter fuction)
; Ackernnamn function can be used as benchmark for compiler ability

(define (foo m n)
  (display m)
  (cond
   ((= m 0 ) (+ n 1))
   ((and (> m 0) (= n 0)) (foo (- m 1) 1))
   (else
    (foo (- m 1) (foo m (- n 1))))))
