#lang racket 

(define (sqrt x)		
	(sqrt-iter 1.0 x))	; 1.0 16

(define (sqrt-iter old_guess x)					; 1.0 16					| 8.5 16
	(define new_guess (improve old_guess x))	; (improve 1.0 16)	| 8.5	| 5.191
	(if (good-enough? old_guess new_guess x)	; 1.0 8.5 16		| FALSE	| 8.5 5.191 16
		old_guess
		(sqrt-iter new_guess x)))

(define (improve guess x)			; 1.0 16			| 
	(average guess (/ x guess)))	; average 1.0 16 	| 8.5	| 5.191

(define (average x y)	; 1.0 16
	(/ (+ x y) 2))		; 17/2 = 8.5

;(define (good-enough? guess x)
;	(< (abs (- (square guess) x)) 0.001))

#|
An alternaive strategy for implementing good-enough? is to watch
how guess changes from one iteration to the next and to
stop when the change is a very small fraction of the guess.
|#

(define (good-enough? old_guess new_guess x)							; 1.0 8.5 16	
	(< (/ (abs (- new_guess old_guess)) (abs old_guess)) 0.0001)	; 7.5 / 8.5 = 0.882 < 0.0001 FALSE | 
	)



(define (square x)
	(* x x))

(sqrt 123456789123456789123456789123456789)

