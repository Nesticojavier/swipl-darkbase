% Archivo que contiene las relaciones

% relacion: esposa
% esposa(X,Y) donde X es
% esposa de Y solo si Y
% es esposo de X.
esposa(X, Y) :- esposo(Y, X).

% Relacion: hermano
% hermano(X,Y) donde X es hermano de
% Y y X es una persona de genero masculino.
% Estado: funcina pero hay que quitarle el Redo
hermano(X, Y) :- 
    persona(X, masc),
    (
        (   
            padre(Z, X),
            padre(Z, Y)
        );
        (   
            madre(Z, X),
            madre(Z,Y)
        )
    ),
    X \= Y.

% Relacion: hermana
% hermana(X,Y) donde X es hermana de
% Y y X es una persona de genero femenino.
hermana(X, Y) :- 
    persona(X, fem),
    (
        (   
            padre(Z, X),
            padre(Z, Y)
        );
        (   
            madre(Z, X),
            madre(Z,Y)
        )
    ),
    X \= Y.

% Relacion : Abuelo
% abuelo(X,Y) donde X es abuelo de Y
% solo si existe algun Z tal que
% X es padre o madre de Z y Z es padre o madre
% de Y.
abuelo(X, Y) :-
    persona(X, masc),
    padre(X, Z),
    (
        padre(Z, Y);
        madre(Z, Y)
    ).

% Relacion : Abuela
% abuela(X,Y) donde X es abuela de Y
% solo si existe algun Z tal que
% X es padre de Z y Z es padre o madre
% de Y.
abuela(X, Y) :-
    persona(X, fem),
    padre(X, Z),
    (
        padre(Z, Y);
        madre(Z, Y)
    ).

% Relacion: Hijo
% hijo(X,Y) donde X es hijo de Y
hijo(X, Y) :-
    persona(X, masc),
    (
        padre(Y,X);
        madre(Y,X)
    ).

% Realcion: Hija
% hija(X,Y) donde X es hija de Y 
hija(X, Y) :-
    persona(X, fem),
    (
        padre(Y,X);
        madre(Y,X)
    ).

% Relacion: nieto
% nieto(X,Y) donde X es nieto de Y
nieto(X, Y) :- 
    persona(X, masc),
    (
        padre(Y, Z);
        madre(Y, Z)
    ),
    (
        padre(Z, X);
        madre(Z, X)    
    ).

% Relacion: nieta
% nieta(X,Y) donde X es nieta de Y
nieta(X, Y) :- 
    persona(X, fem),
    (
        padre(Y, Z);
        madre(Y, Z)
    ),
    (
        padre(Z, X);
        madre(Z, X)    
    ).

% Relacion: tio
% tio(X,Y) donde X es tio de Y
tio(X, Y) :-
    hermano(X, Z),
    (
        padre(Z, Y);
        madre(Z, Y)
    ).

% Relacion: tia
% tia(X,Y) donde X es tia de Y
tia(X, Y) :-
    hermana(X, Z),
    (
        padre(Z, Y);
        madre(Z, Y)
    ).

% Relacion: sobrino
% sobrino(X,Y) donde X es sobrino de Y
sobrino(X, Y) :-
    hijo(X,Z),
    (
        hermano(Z, Y);
        hermana(Z, Y)
    ).

% Relacion: sobrina
% sobrina(X,Y) donde X es sobrina de Y
sobrina(X, Y) :-
    hija(X,Z),
    (
        hermano(Z, Y);
        hermana(Z, Y)
    ).


% Relacion: cuñado
% cuñado(X,Y) donde X es cuñado de Y
cuñado(X, Y) :-
    (        
        esposo(X, Z),
        (
            hermano(Z, Y);
            hermana(Z, Y)
        )
    );
    (
        hermano(X, Z),
        (
            esposo(Z, Y);
            esposa(Z, Y)
        )
    ).


% Relacion: cuñada
% cuñada(X,Y) donde X es cuñada de Y
cuñada(X, Y) :-
    (        
        esposa(X, Z),
        (
            hermano(Z, Y);
            hermana(Z, Y)
        )
    );
    (
        hermana(X, Z),
        (
            esposo(Z, Y);
            esposa(Z, Y)
        )
    ).


% Relacion: suegro
% suegro(X,Y) donde X es suegro de Y
suegro(X, Y) :-
    padre(X, Z),
    (
        esposo(Z, Y);
        esposa(Z, Y)
    ).

% Relacion: suegra
% suegra(X,Y) donde X es suegra de Y
suegra(X, Y) :-
    madre(X, Z),
    (
        esposo(Z, Y);
        esposa(Z, Y)
    ).