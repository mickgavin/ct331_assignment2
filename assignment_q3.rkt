#lang racket






;a
;Define tree
(define tree'(((() 2 ()) 3 (() 4 ())) 8 ((() 10 ()) 12 (() 15 ()))))
(define list2(list 4 5 8 7))


;Displaye sorted tree
(define (sort_tree tree)
  (begin (cond [(not (null? (car tree))) (sort_tree (car tree))])
         (printf "~a~n" (cadr tree))
         (cond [(not (empty? (caddr tree))) (sort_tree (caddr tree))])))
;b

(define (element_found item tree)
  (cond [(empty? tree) #f]
        [(equal? item (cadr tree)) #t]
        [(< item (cadr tree)) (element_found item (car tree))]
        [else (element_found item (caddr tree))]))
;c
(define (insert_helper item tree)
  (insert item tree <))
(define (insert item tree left_of)
  (cond [(empty? tree) (list '() item '())]
        [(equal? item (cadr tree)) tree]
      
        [(left_of item (cadr tree))
         (list (insert item (car tree) left_of) (cadr tree) (caddr tree))]
        [else
         (list (car tree) (cadr tree) (insert item (caddr tree) left_of))]))

;d
(define (insert_list list tree)
  (if (empty? list) tree
      (insert_list (cdr list) (insert (car list) tree <)))
  )
;e
(define (t_sort list)
    (sort_tree (insert_list list '()))
  )
