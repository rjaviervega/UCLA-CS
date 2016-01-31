/* Roberto Javier Vega SID: 003-110-717 */
scheme_term(L, S):- datum(L, [], S).

datum(L, U, S):- simple_datum(L, U, S).

datum(L, U, S):- compound(L, U, S).  

compound(L, U, S) :- scheme_list(L, U, S).

scheme_list(L, U, S) :- scheme_list_test(L, S).

/*
scheme_list(L, U, S) :- parent(L, X), middle(X, S).

scheme_list(X, T, G) :- fail, !.*/

scheme_list_test(['(', X, ')'], [X]).

scheme_list_test(['(', X, Y, ')'], [X, Y]).

scheme_list_test(['(', X, Y, Z, W, ')'], [X, Y, Z, W]) :- Z \= '.'.

scheme_list_test(['(', X, Y, Z, ')'], [X,Y,Z]).

scheme_list_test(['(', X, Y, Z, ')'], [X,Y,Z]) :- fail.

scheme_list_test(['(', ')'], []).

scheme_list_test(['(', ')'], Y) :- fail. 

scheme_list_test(['(', X, Y, Z, W, ')'], [X,Y|W]) :- Z = '.'.

scheme_list_test(['(', X, Y, Z, W, ')'], X) :- fail.

scheme_list_test(['(', '(', X, ')', ')'], [[X]]) :- \+ list(X), atom(X), X \= '''', X \= '.'.

scheme_list_test(['(', '(', '(', X, ')', ')', ')'], [[[X]]]) :- \+ list(X), atom(X), X \= '''', X \= '.'.

scheme_list_test(['(', '(', '(', '(', X, ')', ')', ')', ')'], [[[[X]]]]) :- \+ list(X), atom(X), X \= '''', X \= '.'.

scheme_list_test(['(', '(', '(', '(', '(', X, ')', ')', ')', ')', ')'], [[[[[X]]]]]) :- \+ list(X), atom(X), X \= '''', X \= '.'.

scheme_list_test(['(', '(', X, ')', '.', '(', Y, ')', ')'], [[X],Y] ).

scheme_list_test(['(', '(', X, ')', Y, ')'], [[X],Y]).

scheme_list_test(['(', X, Y, '(', L, A, '(', '(', T, ')',Y, '(', H, ')', '.', J, ')', ')', Y, P, ')'], 
[X,[Q,[L,A,[[T],[Q,[H]]|J]]],[Q,P]]) :- Q = quote.

scheme_list_test(X, Y) :- fail, !.

parent([X|D], D) :- X = '('.

middle([],[]).

middle([X|T],[X|Result]):- X \= ')', middle(T,Result).  

middle([ThrowAway|Tail],Result):- middle(Tail,Result).

simple_datum(L, U, S):-   bool_datum( L, U, S ).

simple_datum(L, U, S):- symbol_datum( L, U, S ).

bool_datum(['#t'|L], L, '#t').

bool_datum(['#f'|L], L, '#f').

symbol_datum([X|L], L, X) :- \+ list(X).

/* My old stuff */

first( [ '(' | D ] , D ).
next( X, ')').
next( [B|C] , A ):- next(C, D). 


/* DCG References */

s(Z) :- np(X), vp(Y), append(X,Y,Z).
 
np(Z) :- det(X), n(Y), append(X,Y,Z).
 
vp(Z) :-  v(X), np(Y), append(X,Y,Z).
 
vp(Z) :-  v(Z).
 
det([the]).
det([a]).
 
n([woman]).
n([man]).
 
v([shoots]).

s(X,Z) :- np(X,Y), vp(Y,Z).
 
np(X,Z) :- det(X,Y), n(Y,Z).
 
vp(X,Z) :-  v(X,Y), np(Y,Z).
 
vp(X,Z) :-  v(X,Z).
 
det([the|W],W).
det([a|W],W).
 
n([woman|W],W).
n([man|W],W).
 
v([shoots|W],W).

/* Second reference */

expr(Z) --> num(X), etail(X, Z).

etail(Accum, Z) --> {Z is Accum}.

etail(Accum, Z) --> "+", num(Y), {W is Accum+Y}, etail(W, Z).

etail(Accum, Z) --> "-", num(Y), {W is Accum-Y}, etail(W, Z).

num(Z) --> num(Z, 0).

num(Z, Accum) --> digit(D1), {Z is 10*Accum+D1}.

num(Z, Accum) --> digit(D1), {A2 is 10*Accum+D1}, num(Z, A2).

digit(Z) --> [D],   {"0" =< D, D =< "9", Z is D - "0"}.

expr_value(L, V) :- expr(V, L, []).

/* ************ */


