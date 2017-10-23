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
padrede('Nelson','Julian').
padrede('Nelson','Mery').
padrede('Carlos','Diana').
padrede('Esperanza', 'Luz').
padrede('Luz','Sofia').
padrede('Diana', 'Sofia').

hijo(A,B) :- padrede(B,A).

abuelo(A,B) :- padrede(A,C), padrede(C,B).

hermano(A,B) :- padrede(C,A), padrede(C,B), A \== B.


familiar(A,B) :- padrede(A,B).
familiar(A,B) :- abuelo(A,B).
familiar(A,B) :- hermano(A,B).

tio(A,B) :- hermano(A,C), padrede(C,B).

casado(A,B) :- padrede(A,C), padrede(B,C), A \==B.

feliz(A) :- casado(A, _).

bisabuelo(A,B) :- padrede(C,B), abuelo(A,C).

bisnieto(A,B) :- padrede(B,C), abuelo(C,A).

cuñado(A,B) :- casado(A,C), hermano(B,C).
cuñado(A,B) :- casado(B,C), hermano(C,A).

esAdoptado(A) :- esMujer(B), esMujer(C) , hijo(A,B), hijo(A,C), casado(C,B).
esAdoptado(A) :-  esHombre(B), esHombre(C), hijo(A,B), hijo(A,C), casado(B,C).
