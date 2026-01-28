#lang racket

(define (cbrt x)
	(cbrt-iter 1.0 x))

(define (cbrt-iter old_guess x)
	(define new_guess (improve_guess old_guess x))
	(if (good-enough? old_guess new_guess x)
		old_guess
		(cbrt-iter new_guess x)))

(define (improve_guess guess x)
	(/ (+ (* 2 guess) (/ x (* guess guess))) 3)
	)

(define (good-enough? old_guess new_guess x)								
	(< (/ (abs (- new_guess old_guess)) (abs old_guess)) 0.0001)	
	)

(cbrt 27)
