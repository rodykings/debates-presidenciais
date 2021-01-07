:-use_module(library(clpfd)).

debatesDistintosDia([]).
debatesDistintosDia([Dia|Dias]):-
    append(Dia, DebatesDia),
    all_distinct(DebatesDia),
    debatesDistintosDia(Dias).


todosDebatesDistintos([[_,_]]).
todosDebatesDistintos([[P1, P2]|RestoDebates]):-
    length(RestoDebates, TamanhoRD),
    TamanhoRD1 is TamanhoRD+1,
    garantirDiferente(P1, P2, RestoDebates, TamanhoRD1, 1),
    todosDebatesDistintos(RestoDebates).


garantirDiferente(_, _, _, TamanhoRD, TamanhoRD).
garantirDiferente(P1, P2, RestoDebates, TamanhoRD, Counter) :-
    nth1(Counter, RestoDebates, [P3,P4]),
    (P1 #= P3) #=> (P2 #\= P4),
    (P2 #= P3) #=> (P1 #\= P3),
    Counter1 is Counter + 1,
    garantirDiferente(P1, P2, RestoDebates, TamanhoRD, Counter1).

