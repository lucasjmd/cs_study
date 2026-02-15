#lang racket


(define (runtime) (current-milliseconds))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond (( > (square test-divisor) n) n)
		  ((divides? test-divisor n) test-divisor)
		  (else (find-divisor n (next test-divisor)))))

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
	(if (prime? n)
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
	((prime? n)
		(timed-prime-test n)
		(search-for-primes (+ n 2) (- count 1)))
		(else 
			(search-for-primes (+ n 2) count))))

(define (start-search n count)
	(if (even? n)
		(search-for-primes (+ n 1) count)
		(search-for-primes n count)))

(start-search 100000000000000 3)