#lang racket

(define (f g) (g 2))

(define (square n) (* n n))

(f f)