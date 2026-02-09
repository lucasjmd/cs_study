#lang racket

(define (double i)
	(+ i i)
	)

(define (halve i)
		(/ i 2)
		)

(define (* a b state)
	(cond ((= b 0) state)

		((= (remainder b 2) 0)
			(* (double a) (halve b) state))

	(else
		(* a (- b 1) (+ a state)))
		)
	)

(* 2 6 0)