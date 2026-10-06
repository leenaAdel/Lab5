% Male
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% Female
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent relations:
% Abraham & Mona
parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).

% Clancy & Jackie
parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

% Homer & Marge
parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

% Selma
parent(selma, ling).

% Rules:
father(X, Y) :-
    parent(X, Y),
    male(X).

mother(X, Y) :-
    parent(X, Y),
    female(X).

son(X, Y) :-
    parent(Y, X),
    male(X).

daughter(X, Y) :-
    parent(Y, X),
    female(X).

brother(X, Y) :-
    parent(P, X),
    parent(P, Y),
    male(X),
    X \= Y.

sister(X, Y) :-
    parent(P, X),
    parent(P, Y),
    female(X),
    X \= Y.

grandfather(X, Z) :-
    father(X, Y),
    parent(Y, Z).

aunt(X, Y) :-
    sister(X, P),
    parent(P, Y).

uncle(X, Y) :-
    brother(X, P),
    parent(P, Y).

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    parent(GP, P1),
    parent(GP, P2),
    P1 \= P2,
    X \= Y.

% Recursive:
ancestor(X, Z) :-
    parent(X, Z).

ancestor(X, Z) :-
    parent(X, Y),
    ancestor(Y, Z).
