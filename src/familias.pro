/** Base de conocimientos de prolog
 * 
 *  Este archivo hace uso del modulo <hechos> donde está definido
 *  el arbol genealógico mediante los hechos padre, madre y esposo. 
 *  De estos hechos derivan varias relaciones familiares que son
 *  definidos inductivamente a continuacion.
 *
 *  @author Christopher Gomez, Nestor Gonzalez (Prolog code)
 *  @version ch2.8
 *  @see https://tataranietos.com/2018/01/02/arbol-genealogico-dark/
 *  @copyright (c)2022 Christofer Gomez, Nestor Gonzalez.
 */
:- use_module(hechos).


/**
 * esposa(?X:name, ?Y:name) is nondet
 * 
 * El predicado esposa/2 indica que X es esposa de Y
 * si Y es esposo de X.
 * 
 * @param X representa a la esposa en la relacion.
 * @param Y representa al esposo en la relacion. */
esposa(X, Y) :- esposo(Y, X).

/**
 * hermano(?X:name, ?Y:name) is nondet
 * 
 * El predicado hermano/2 triunfa si X es una persona
 * de genero masc y existe un Z tal que Z es padre o madre
 * de X y de Y, tal que X y Y son personas distintas.
 * 
 * @param X representa al hermano masc en la relacion.
 * @param Y representa al hermano(a) de X. */
hermano(X, Y) :- 
    persona(X, masc),
    (
        (   
            padre(Z, X),
            padre(Z, Y)
        );
        (   
            madre(Z, X),
            madre(Z, Y)
        )
    ),
    X \= Y.

/**
 * hermana(?X:name, ?Y:name) is nondet
 * 
 * El predicado hermana/2 triunfa si X es una persona
 * de genero fem y existe un Z tal que Z es padre o madre
 * de X y de Y, tal que X y Y son personas distintas.
 * 
 * @param X representa a la hermana fem en la relacion 
 * @param Y representa al hermana(a) de X */
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

/**
 * abuelo(?X:name, ?Y:name) is nondet
 * 
 * El predicado abuelo/2 triunfa si X es una persona
 * masc y X es el padre de algun Z tal que ese Z es 
 * padre o madre de Y.
 * 
 * @param X es el abuelo de genero masc en la relacion.
 * @param Y la persona de la cual X es abuelo. */
abuelo(X, Y) :-
    persona(X, masc),
    padre(X, Z),
    (
        padre(Z, Y);
        madre(Z, Y)
    ).

/**
 * abuela(?X:name, ?Y:name) is nondet
 * 
 * El predicado abuela/2 triunfa si X es una persona
 * fem y X es el padre de algun Z tal que ese Z es 
 * padre o madre de Y.
 * 
 * @param X es la abuela de genero fem en la relacion.
 * @param Y la persona de la cual X es abuela. */
abuela(X, Y) :-
    persona(X, fem),
    madre(X, Z),
    (
        padre(Z, Y);
        madre(Z, Y)
    ).

/**
 * hijo(X:name, Y:name) is nondet
 * 
 * El predicado hijo/2 triunfa si X es una persona de 
 * genero masc y Y es padre o madre de X. 
 * 
 * @param X hijo de genero masc en la relacion. 
 * @param Y persona de la cual es X es hijo. */
hijo(X, Y) :-
    persona(X, masc),
    (
        padre(Y,X);
        madre(Y,X)
    ).

/**
 * hija(X:name, Y:name) is nondet
 * 
 * El predicado hija/2 triunfa si X es una persona de 
 * genero masc y Y es padre o madre de X. 
 * 
 * @param X hija de genero fem en la relacion. 
 * @param Y persona de la cual es X es hija. */
hija(X, Y) :-
    persona(X, fem),
    (
        padre(Y,X);
        madre(Y,X)
    ).

/** 
 * nieto(X:name, Y:name) is nondet
 * 
 * El predicado nieto/2 triunfa si X es una persona de
 * genero masc y para algun Z, se cumple que Y es padre
 * o madre de Z tal que Z es padre o madre de X. 
 * 
 * @param X es el nieto de genero masc en la relacion. 
 * @param Y persona de la cual X es nieto. */
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

/** 
 * nieta(X:name, Y:name) is nondet
 * 
 * El predicado nieta/2 triunfa si X es una persona de
 * genero fem y para algun Z, se cumple que Y es padre
 * o madre de Z tal que Z es padre o madre de X. 
 * 
 * @param X es el nieta de genero fem en la relacion. 
 * @param Y persona de la cual X es nieta. */
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

/**
 * tio(X:name, Y:name) is nondet 
 * 
 * El predicado tio/2 triunfa si X es hermano de algun
 * Z tal que Z es padre o madre de de Y. 
 * 
 * @param X tio en la relacion tal que X es una persona masc. 
 * @param Y persona de la cual X es tio. */
tio(X, Y) :-
    hermano(X, Z),
    (
        padre(Z, Y);
        madre(Z, Y)
    ).

/**
 * tia(X:name, Y:name) is nondet 
 * 
 * El predicado tia/2 triunfa si X es hermana de algun
 * Z tal que Z es padre o madre de de Y. 
 * 
 * @param X tia en la relacion tal que X es una persona fem. 
 * @param Y persona de la cual X es tia. */
tia(X, Y) :-
    hermana(X, Z),
    (
        padre(Z, Y);
        madre(Z, Y)
    ).

/**
 * sobrino(X:name, Y:name) is nondet
 * 
 * El predicado sobrino/2 triunfa si X es hijo de algun Z
 * tal que Z es hermano o hermana de Y. 
 * 
 * @param X es el sobrino de genero masc en la relacion. 
 * @param Y es la persona de la cual X es sobrino. */
sobrino(X, Y) :-
    hijo(X,Z),
    (
        hermano(Z, Y);
        hermana(Z, Y)
    ).

/**
 * sobrina(X:name, Y:name) is nondet
 * 
 * El predicado sobrina/2 triunfa si X es hija de algun Z
 * tal que Z es hermano o hermana de Y. 
 * 
 * @param X es el sobrina de genero fem en la relacion. 
 * @param Y es la persona de la cual X es sobrina. */
sobrina(X, Y) :-
    hija(X,Z),
    (
        hermano(Z, Y);
        hermana(Z, Y)
    ).

/**
 * cuñado(X: name, Y:name) is nondet 
 * 
 * El predicado cuñado/2 triunfa si se cumple una de las
 * siguientes condiciones:
 * 1) X es esposo de algun Z tal que Z es hermano(a) de Y
 * 2) X es heramno de algun Z tal que Z es esposo(a) de Y. 
 * 
 * @param X es el cuñado de genero masc en la relacion. 
 * @param Y es la persona de la cual X es cuñado. */
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

/**
 * cuñada(X: name, Y:name) is nondet 
 * 
 * El predicado cuñada/2 triunfa si se cumple una de las
 * siguientes condiciones:
 *      X es esposa de algun Z tal que Z es hermano(a) de Y.
 *      X es hermana de algun Z tal que Z es esposo(a) de Y. 
 * 
 * @param X es el cuñada de genero fem en la relacion. 
 * @param Y es la persona de la cual X es cuñada. */
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

/**
 * suegro(X:name, Y:name) is nondet
 * 
 * El predicado suegro/2 triunfa si X es padre de algun Z
 * tal que Z es esposo o esposa de Y. 
 * 
 * @param X es el suegro de genero masc de la relacion
 * @param Y es la persona de la cual X es suegro. */
suegro(X, Y) :-
    padre(X, Z),
    (
        esposo(Z, Y);
        esposa(Z, Y)
    ).

/**
 * suegra(X:name, Y:name) is nondet
 * 
 * El predicado suegra/2 triunfa si X es madre de algun Z
 * tal que Z es esposo o esposa de Y. 
 * 
 * @param X es el suegra de genero fem de la relacion
 * @param Y es la persona de la cual X es suegra. */
suegra(X, Y) :-
    madre(X, Z),
    (
        esposo(Z, Y);
        esposa(Z, Y)
    ).