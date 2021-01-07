numeroDeCandidatos(NCandidatos):-
    findall(ID,candidato(ID, _), List),
    length(List, NCandidatos).

numeroDeCanais(NCanais):-
    findall(ID,televisao(ID, _), List),
    length(List, NCanais).


printResults([], _).
printResults([Dia|RestoDias], Indice):-
    format('DIA ~w~n-----~n', Indice),
    %percorrer canais
    printCanais(Dia, 1),
    nl,
    Indice1 is Indice+1,
    printResults(RestoDias, Indice1).

printCanais([], _).
printCanais([[P1, P2]|DebateCanais], Index) :-
    candidato(P1, Candidato1),
    candidato(P2, Candidato2),
    televisao(Index, Canal),
    format('~w   ~w - ~w~n', [Canal, Candidato1, Candidato2]),
    Index1 is Index + 1,
    printCanais(DebateCanais, Index1).