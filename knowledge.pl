:- use_module(library(random)).
:- dynamic candidato/2.

candidatos(['Marcelo Sousa','Ana Gomes','Marisa Matias','Tiago Mayan','Andre Ventura','Joao Ferreira', 'Vitorino Silva']).

televisao(1,'RTP').
televisao(2,'SIC').
televisao(3,'TVI').


generateCandidatos:-
    candidatos(Candidatos),
    random_permutation(Candidatos, Perm),
    assignCandidatos(Perm, 1).

assignCandidatos([], _).
assignCandidatos([Candidato|T], I) :-
    assert(candidato(I, Candidato)),
    I1 is I + 1,
    assignCandidatos(T, I1).


:-generateCandidatos.
