#lang racket

(require rackunit)
(require math/base)


(define (runtime) (current-milliseconds))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond (( > (square test-divisor) n) n)
		  ((divides? test-divisor n) test-divisor)
		  (else (find-divisor n (next test-divisor)))))

(define (expmod base exp m)
	(cond ((= exp 0) 1)
		((even? exp)
			(remainder
				(square (expmod base (/ exp 2) m))
				m))
		(else 
			(remainder
				(* base (expmod base (- exp 1) m))
				m))))

(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (+ 1 (random-integer 1 (- n 1)))))

(define (fast-prime? n times)
	(cond ((= times 0) true)
		((fermat-test n) (fast-prime? n (- times 1)))
		(else false)))

(define (next i)
	(if (= i 2)
		3
		(+ i 2)))

(define (divides? a b) (= (remainder b a) 0))

(define (square n)
	(* n n))

(define (prime? n)
	(= n (smallest-divisor n)))

(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (runtime)))

(define (start-prime-test n start-time)
	(if (fast-prime? n 1000)
	(report-prime (- (runtime) start-time))
	(void)))

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))

(define (even? n)
	(if (= (remainder n 2) 0)
		#t
		#f)
	)

(define (search-for-primes n count)
	(cond ((= count 0) (newline) (display "Search complete."))
	((fast-prime? n 1000)
		(timed-prime-test n)
		(search-for-primes (+ n 2) (- count 1)))
		(else 
			(search-for-primes (+ n 2) count))))

(define (start-search n count)
	(if (even? n)
		(search-for-primes (+ n 1) count)
		(search-for-primes n count)))

(start-search 10000000000000000000000000000000000 3)

;10^12 = 10 ms - 10ms
;10^13 = 31 ms - 31 ms
;10^14 = 96 ms - 95ms

;10^12
	;1000000000039
	;1000000000061
	;1000000000063
;10^13
	;10000000000037
	;10000000000051
	;10000000000099
;10^14
	;100000000000031
	;100000000000067
	;100000000000097


