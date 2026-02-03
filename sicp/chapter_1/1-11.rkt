#lang racket

; recursive function

(define (rf n)
	(if (< n 3)
		n
		(+ 
			(rf (- n 1)) 
			(* 2 (rf (- n 2))) 
			(* 3 (rf (- n 3)))
		)
	)
)

; iterative function


(define (iter-f a b c n counter)
	(if (< (+ counter 2) n)
		(iter-f (+ a (* 2 b) (* 3 c)) a b n (+ counter 1))
		a
	)

)

