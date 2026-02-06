#lang racket

(define (expt base exponent state)
	(cond
		((= exponent 0) state)
		((= (even exponent) 1) (expt (* base base) (/ exponent 2) state))
		((= (even exponent) 0) (expt base (- exponent 1) (* state base)))
		)
	)

(define (even i)
	(if (= (remainder i 2) 0)
		1
		0)
	)

(expt 16 59 1)