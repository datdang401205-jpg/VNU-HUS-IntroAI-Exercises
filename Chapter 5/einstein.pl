% Create a solution for Exercise 5.9, page 89
% einstein.pl  –  Constraint Logic Programming version
:- use_module(library(clpfd)).

solve(Houses) :-
    % 5 houses, each a tuple: house(Color, Nation, Drink, Smoke, Pet)
    length(Houses, 5),
    Houses = [
        house(C1,N1,D1,S1,P1),
        house(C2,N2,D2,S2,P2),
        house(C3,N3,D3,S3,P3),
        house(C4,N4,D4,S4,P4),
        house(C5,N5,D5,S5,P5)
    ],

    % Distinct attributes
    all_different([C1,C2,C3,C4,C5]),
    all_different([N1,N2,N3,N4,N5]),
    all_different([D1,D2,D3,D4,D5]),
    all_different([S1,S2,S3,S4,S5]),
    all_different([P1,P2,P3,P4,P5]),

    % Hints as constraints
    member(house(red, brit, _, _, _), Houses),
    member(house(_, swede, _, _, dog), Houses),
    member(house(_, dane, tea, _, _), Houses),
    nextto(house(green, _, _, _, _), house(white, _, _, _, _), Houses),
    member(house(green, _, coffee, _, _), Houses),
    member(house(_, _, _, 'Pall Mall', bird), Houses),
    Houses = [_,_,house(_,_,milk,_,_),_,_],
    Houses = [house(_, norwegian, _, _, _)|_],
    Houses = [H1,H2,H3,H4,H5],
    nextto(H1,H2,Houses), nextto(H2,H3,Houses),
    nextto(H3,H4,Houses), nextto(H4,H5,Houses),  % ensure adjacency semantics

    nextto(house(_,_,_,marlboro,_), house(_,_,_,_,cat), Houses),
    nextto(house(_,_,_,dunhill,_), house(_,_,_,_,horse), Houses),
    member(house(_,_,beer,winfield,_), Houses),
    nextto(house(_,norwegian,_,_,_), house(blue,_,_,_,_), Houses),
    member(house(_, german, _, rothmanns, _), Houses),
    nextto(house(_,_,_,marlboro,_), house(_,_,water,_,_), Houses),

    label([]).

% Query:
% ?- solve(Houses), member(house(_, german, _, _, Pet), Houses).
% Pet = fish.
