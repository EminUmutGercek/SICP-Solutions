;Exercise 1.5:* Ben Bitdiddle has invented a test to determine
;whether the interpreter he is faced with is using
;applicative-order evaluation or normal-order evaluation.  He
;defines the following two procedures:

;Then he evaluates the expression
;
;(test 0 (p))
;
;What behavior will Ben observe with an interpreter that uses
;applicative-order evaluation?  What behavior will he observe with
;an interpreter that uses normal-order evaluation?  Explain your
;answer.  (Assume that the evaluation rule for the special form
;' is the same whether the interpreter is using normal or
;applicative order: The predicate expression is evaluated first,
;and the result determines whether to evaluate the consequent or
;the alternative expression.)

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;In applicative(Lisp)
;Defintion of p is infinetly recursive
;If a process encounters p it will stuck on infinite recursive call

;In normal order
;It will be
;(if (= 0 0)
;    0
;    (p))
;(p) is not important because it's not called yet
;So it's 0
