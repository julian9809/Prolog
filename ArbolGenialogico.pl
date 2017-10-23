esMujer('Maria').
esMujer('Paula').
esMujer('Lucia').
esMujer('Rosa').
esMujer('Rocio').
esMujer('Sara').
esMujer('Camila').
esMujer('Nicol').
esMujer('Sofia').

esHombre('Eduardo').
esHombre('Nicolas').
esHombre('Julian').
esHombre('Arturo').
esHombre('Pablo').
esHombre('Rogelio').
esHombre('Fernando').
esHombre('Luis').
esHombre('Camilo').
esHombre('Juan').

padrede('Eduardo','Nicolas').
padrede('Maria','Nicolas').
padrede('Eduardo','Julian').
padrede('Maria','Julian').
padrede('Nicolas', 'Pablo').
padrede('Lucia','Pablo').
padrede('Nicolas', 'Rosa').
padrede('Lucia','Rosa').
padrede('Julian','Rocio').
padrede('Paula','Rocio').
padrede('Julian','Sara').
padrede('Paula','Sara').
padrede('Pablo','Nicol').
padrede('Arturo','Nicol').
padrede('Rosa','Sofia').
padrede('Rogelio','Sofia').
padrede('Fernando','Luis').
padrede('Rocio','Luis').
padrede('Fernando','Camilo').
padrede('Rocio','Camilo').
padrede('Sara','Juan').
padrede('Camila','Juan').

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

primo(A,B) :- padrede(C,A), padrede(D,B),hermano(C,D).








