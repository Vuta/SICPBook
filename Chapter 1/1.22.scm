#lang planet neil/sicp

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      (#f)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? x y)
  (= (remainder y x) 0))

(define (square n) (* n n))

(define (prime? n) (= (smallest-divisor n) n))

(define (search-for-primes startNum primesCount)
  (cond ((= primesCount 0))
        ((even? startNum) (search-for-primes (+ startNum 1) primesCount))
        (if (timed-prime-test startNum) 
            (search-for-primes (+ startNum 2) (- primesCount 1))
            (search-for-primes (+ startNum 2) primesCount))))

(search-for-primes 1000 3)