#lang racket

;This is an example implementation of ins_beg,
;It obviously doesn't do what it should, so you
;can edit this function to get started.
;
;Please note the provide function is necessary
;for the unit tests to work. Please include a
;(provide) for each function you write in your
;submitted assignment.
;
;You may delete these comments!

(provide insert_b)
(provide insert_finish)
(provide top_point)
(provide instances_point)
(provide instances_point_r)
(provide count_instances_deep)

;list for testing
(define list1(list 2 4 6 8))
(define list2(list 4 5 8 7))


;A
(define (insert_b el lst)
  (append (list el) lst))

;B
(define (insert_finish el lst)
  (append lst (list el)))
;c
(define (top_point lst)
  (if (null? lst)
      0
      
      (+ 1 (top_point (cdr lst)))))

;d
(define (instances_point item lst)
  (cond [(null? lst) 0]
        [(equal? item (car lst)) (+ 1 (instances_point item (cdr lst)))]
        [else (instances_point item (cdr lst))]))
;e
(define (instances_point_r item lst)
  (instances_help_r item lst 0))
 

(define (instances_help_r item lst count)
  (cond [(empty? lst) count]
        [(equal? item (car lst)) (instances_help_r item (cdr lst) (+ 1 count))]
        [else (instances_help_r item (cdr lst) count)]))
;f
(define (count_instances_deep el lst)
  (cond ((null? lst) 0)
        ((equal? el (car lst))
         (+ 1 (count_instances_deep el (cdr lst))))
        ((list? (car lst))
         (+ 0 (count_instances_deep el (cdr lst))
             (count_instances_deep el (car lst))))
        (else (count_instances_deep el (cdr lst)))
 ))