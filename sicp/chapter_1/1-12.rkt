#lang racket

(define (pascal-index row column)
	(cond ((= row 0) 1)
		((= row column) 1)
		((= column 0) 1)
		(else (+ (pascal-index (- row 1) column) (pascal-index (- row 1) (- column 1)))
			)
		)
	)

(pascal-index 15 8)
