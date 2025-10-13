% Create a solution for Exercise 5.5, page 88
p(L) :- q(10,L), write(L).

q(0,[1]).
q(N,L) :-
    N>0,
    N1 is N-1,
    q(N1,X),
    append(X,X,L).
