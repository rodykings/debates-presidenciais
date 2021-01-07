:-use_module(library(clpfd)).
:-use_module(library(lists)).
:-consult('knowledge.pl').
:-consult('utils.pl').
:-consult('constraints.pl').




build_canais([],_).
build_canais([HD|HT], NCandidatos):-
    length(HD, 3),
    build_debates(HD, NCandidatos),
    build_canais(HT, NCandidatos).

build_debates([],_).
build_debates([Debate|TD], NCandidatos):-
    length(Debate, 2),
    domain(Debate,1,NCandidatos),
    element(1, Debate, P1),
    element(2, Debate, P2),
    P1 #< P2,
    all_distinct(Debate),
    build_debates(TD, NCandidatos).

gerar_debates(Final):-
    numeroDeCandidatos(NCandidatos),
    length(Debates, NCandidatos),
    build_canais(Debates, NCandidatos),
    append(Debates, TodosDebates),
    debatesDistintosDia(Debates),
    todosDebatesDistintos(TodosDebates),
    append(TodosDebates, Final),
    labeling([], Final),nl,printResults(Debates, 1).

