; *Exercise 1.12:*
; Question wants pascal[a][b]
; Or can say that combinartion(a,b)

(define (pascal row col)
  (cond
   ((= col 1) 1)   ; First 1 in every row
   ((= col row) 1) ; Last 1 in every row
   (else
    (+
     (pascal (- row 1) (- col 1))  ; Upper left
     (pascal (- row 1)  col)       ; Upper right
     ))))

; Printing ugly pascal triangle

(define (pascal-print depth)
  (pascal-iter-row depth 1))

(define (pascal-iter-row depth count)
  (cond
   ((= (+ depth 1) count) ) ; Finish
   (else
    (align depth count)
    (print-columns count 1)
    (newline)
    (pascal-iter-row depth (+ count 1))
    )))

(define (print-columns row count)
  (cond
   ((= (+ row 1 ) count) ) ; Finish
   (else
    (display (pascal row count))
    (display " ")
    (print-columns  row (+ count 1))
    )))


; Trying to beautify
(define (align max cur)
  (align-iter max cur 0)
  )

(define (align-iter max cur count)
  (cond
   ((= (- max cur) count)) ; Finish
   (else
    (display " ")
    (align-iter max cur (+ count 1))
    )))
