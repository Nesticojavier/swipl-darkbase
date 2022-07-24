% personas

persona(egon, masc).
persona(doris, fem).
persona(claudia, fem).
persona(regina, fem).
persona(aleksander, masc).
persona(bartosz, masc).

persona(bernd, masc).
persona(greta, fem).
persona(helge, masc).
persona(peter, masc).
persona(charlotte, fem).
persona(elisabeth, fem).
persona(franziska, fem).

persona(noah, masc).
persona(agnes, fem).
persona(jana, fem).
persona(tronte, masc).
persona(ulrich, masc).
persona(mads, masc).
persona(katharina, fem).
persona(mikkel, masc).
persona(martha, fem).
persona(magnus, masc).
persona(jonas, masc).
persona(hannah, fem).
persona(cain, masc).

% hecho: padre
padre(noah, tronte).
padre(tronte, ulrich).
padre(tronte, mads).
padre(ulrich, mikkel).
padre(ulrich, martha).
padre(ulrich, magnus).
padre(mikkel, jonas).
padre(jonas, cain).

% hecho: madre
madre(agnes, tronte).
madre(jana, ulrich).
madre(jana, mads).
madre(katharina, mikkel).
madre(katharina, martha).
madre(katharina, magnus).
madre(hannah, jonas).
madre(martha, cain).

% hecho: esposo
esposo(noah, agnes).
esposo(tronte, jana).
esposo(ulrich, katharina).
esposo(mikkel, hannah).

% relacion esposa
esposa(X, Y) :- esposo(Y, X).

% relacion hermanos
% funciona pero hay que quitarle el Redo
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
hermana(X, Y) :- 
    persona(X, fem),
    hermano(Y, X).

%relacion abuelos
abuelo(X, Y) :-
    persona(X, masc),
    (
        (
            padre(X, Z),
            padre(Z, Y)
        );
        (
            padre(X, Z),
            madre(Z, Y)
        )
    ).

abuela(X, Y) :-
    persona(X, fem),
    (
        (
            madre(X, Z),
            padre(Z, Y)
        );
        (
            madre(X, Z),
            madre(Z, Y)
        )
    ).

%relacion hijo / hija

hijo(X, Y) :-
    persona(X, masc),
    (
        padre(Y,X);
        madre(Y,X)
    ).

hija(X, Y) :-
    persona(X, fem),
    (
        padre(Y,X);
        madre(Y,X)
    ).

%relacion nieto
nieto(X, Y) :- 
    persona(X, masc),
    (
        abuelo(Y, X);
        abuela(Y, X)
    ).

nieta(X, Y) :- 
    persona(X, fem),
    (
        abuelo(Y, X);
        abuela(Y, X)
    ).

% relacion tio/tia
tio(X, Y) :-
    hermano(X, Z),
    (
        padre(Z, Y);
        madre(Z, Y)
    ).

tia(X, Y) :-
    hermana(X, Z),
    (
        padre(Z, Y);
        madre(Z, Y)
    ).

% relacion sobrino
sobrino(X, Y) :-
    hijo(X,Z),
    (
        hermano(Z, Y);
        hermana(Z, Y)
    ).

sobrina(X, Y) :-
    hija(X,Z),
    (
        hermano(Z, Y);
        hermana(Z, Y)
    ).

% relacion cuñado
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

% relacion  suegro

suegro(X, Y) :-
    padre(X, Z),
    (
        esposo(Z, Y);
        esposa(Z, Y)
    ).

suegra(X, Y) :-
    madre(X, Z),
    (
        esposo(Z, Y);
        esposa(Z, Y)
    ).
