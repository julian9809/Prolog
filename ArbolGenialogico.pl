esMujer('Luz').
esMujer('Esperanza').
esMujer('Diana').
esMujer('Mery').
esMujer('Sofia').

esHombre('Julian').
esHombre('Nelson').
esHombre('Carlos').
esHombre('Ferney').
esHombre('Yesid').

padrede('Julian','Luz').
padrede('Nelson','juan').
padrede('Nelson','Mery').
padrede('Carlos','Diana').
padrede('Esperanza', 'Luz').
padrede('Luz','Sofia').
padrede('Diana', 'Sofia').

hijode(A,B) :- padrede(B,A).

abuelode(A,B) :- padrede(A,C), padrede(C,B).

hermanode(A,B) :- padrede(C,A), padrede(C,B), A \== B.


familiarde(A,B) :- padrede(A,B).
familiarde(A,B) :- abuelode(A,B).
familiarde(A,B) :- hermanode(A,B).

tiode(A,B) :- hermanode(A,C), padrede(C,B).

casadocon(A,B) :- padrede(A,C), padrede(B,C), A \==B.

feliz(A) :- casadocon(A, _).

bisabuelode(A,B) :- padrede(C,B), abuelode(A,C).

bisnieto(A,B) :- padrede(B,C), abuelode(C,A).

cuñadode(A,B) :- casadocon(A,C), hermanode(B,C).
cuñadode(A,B) :- casadocon(B,C), hermanode(C,A).

esAdoptado(A) :- esMujer(B), esMujer(C) , hijode(A,B), hijode(A,C), casadocon(C,B).
esAdoptado(A) :-  esHombre(B), esHombre(C), hijode(A,B), hijode(A,C), casadocon(B,C).
