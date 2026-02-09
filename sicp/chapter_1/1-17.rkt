#lang racket

(define (double i)
	(+ i i)
	)

(define (halve i)
		(/ i 2)
		)

(define (* a b)
	(cond ((= b 0) 0)

		((= (remainder b 2) 0)
			(* (double a) (halve b)))
		(else
		(+ a (* a (- b 1))))
		)
	)

(* 2 3)
