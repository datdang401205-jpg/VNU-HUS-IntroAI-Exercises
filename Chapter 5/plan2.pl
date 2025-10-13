% Create a solution for Exercises 5.2 and 5.3, page 88 using plan.pl
% --- plan.pl from Example 5.1 ---
start :- action(state(left,left,left,left),
                state(right,right,right,right)).

action(Start,Goal) :-
    plan(Start,Goal,[Start],Path),
    nl,write('Solution:'),nl,
    write_path(Path).

plan(Start,Goal,Visited,Path) :-
    go(Start,Next),
    safe(Next),
    \+ member(Next,Visited),
    plan(Next,Goal,[Next|Visited],Path).
plan(Goal,Goal,Path,Path).

go(state(X,X,Z,K),state(Y,Y,Z,K)) :- across(X,Y). % farmer, wolf
go(state(X,W,X,K),state(Y,W,Y,K)) :- across(X,Y). % farmer, goat
go(state(X,W,Z,X),state(Y,W,Z,Y)) :- across(X,Y). % farmer, cabbage
go(state(X,W,Z,K),state(Y,W,Z,K)) :- across(X,Y). % farmer alone

across(left,right).
across(right,left).

safe(state(B,W,Z,K)) :- across(W,Z), across(Z,K).
safe(state(B,B,B,K)).
safe(state(B,W,B,B)).

% --- Exercise 5.2: write_move and write_path ---
direction(left,right,'left to right').
direction(right,left,'right to left').

write_move(state(F1,W1,G1,C1),state(F2,W2,G2,C2)) :-
    direction(F1,F2,Dir),
    findall(X, moved(F1,W1,G1,C1,F2,W2,G2,C2,X), L),
    write('Farmer'),
    (L=[] -> true ; write(' and '), write_list(L)),
    write(' cross '), write(Dir), write('.'), nl.

moved(F1,W1,G1,C1,F2,W2,G2,C2,Obj) :-
   (W1\=W2 -> Obj=wolf ;
    G1\=G2 -> Obj=goat ;
    C1\=C2 -> Obj=cabbage ;
    fail).

write_list([X]) :- write(X).
write_list([X|T]) :- write(X), write(' and '), write_list(T).

write_path([_]).
write_path([S1,S2|Rest]) :- write_move(S1,S2), write_path([S2|Rest]).
