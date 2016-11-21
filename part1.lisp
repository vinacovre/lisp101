; (load "/Users/vinacovre/Google Drive/Graduação/Unesp/LPNC/Lisp/part1.lisp")
;;; Recursion Exercises from Haskell to Lisp
; PART 1

; MEMBER
; member([X|_], X) :- !.
; member([_|T], X) :- member(T, X).

; (member 7 '(6 8 3 7)) >>> #t
(define (member? x l)
  (if (null? l)
    #f
    (if (equal? x (car l))
      #t
    (member? x (cdr l)))))

;;;;;

; LENGTH
; length1(L,N) :- length2(L,0,N).
; length2([], Acc, Acc).
; length2([_|T], Acc, N) :-
;   Acc1 is Acc+1, % Acc++
;   length2(T, Acc1, N).

; (length1 '(5 7 2 3)) >>> 4
(define (length1 l)
  (length2 l 0))

(define (length2 l acc)
  (if (empty? l)
    acc
  (length2 (cdr l) (add1 acc))))

;;;;;

; TWICE
; twice([],[]).
; twice([H|T], [TimesTwo|R]) :-
;   TimesTwo is (H*2),
;   twice(T,R).

; (twice '(2 4 6)) >>> '(4 8 12)
(define (twice l)
  (if (empty? l)
    '()
  (cons (* 2 (car l)) (twice (cdr l)))))

; % removeFirst(3,[4,2,8,3,5,2,3],N). %>>> N = [4,2,8,5,2,3]
; removeFirst(_,[],[]).
; removeFirst(X,[X|T],T).
; removeFirst(X,[H|T],[H|R]) :- removeFirst(X,T,R).
;
; % allOdd([3,5,7,1]). %>>> true
; odd(N) :- 1 is N mod 2.
; allOdd([]).
; allOdd([H|T]) :- odd(H), allOdd(T).
;
; % andMap(odd,[1,7,5,9]). %>>> true
; andMap(_,[]).
; andMap(X,[H|T]) :- call(X,H), andMap(X,T).
;
; % some(odd,[2,4,6,8,9]). %>>> true
; some(X,[H|T]) :- call(X,H); some(X,T).
;
; % sum([6,5,4],N). %>>> N = 15
; sum([],0).
; sum([H|T],R) :- sum(T,SumOfTail), R is H + SumOfTail.
;
; % count(9,[1,9,2,9,9,3],N). %>>> N = 3
; count(_,[],0).
; count(X,[X|T],R) :- count(X,T,SumOfTail), R is 1 + SumOfTail.
; count(X,[_|T],R) :- count(X,T,SumOfTail), R is 0 + SumOfTail.
;
; % TO DO: MAP IN PROLOG
; succ(X,R) :- R is X + 1.
; % map(succ,[1,2,3],N). %>>> N = [2,3,4]
;
; % filter(odd,[1,2,3,4],N). %>>> N = [1,3]
; filter(_,[],[]).
; filter(X,[H|T],[H|R]) :- call(X,H), filter(X,T,R).
; filter(X,[_|T],R) :- filter(X,T,R).
