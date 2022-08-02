/** Modulo que define los hechos de las relaciones entre familiares
 * 
 *  Este modulo define los hechos principales entre los familiares
 *  indicados por las reaciones persona, padre, madre y esposo. 
 *  De estos hechos se derivan relaciones importantes, las cuales
 *  no estan definidas en este modulo.
 *
 *  @author Christopher Gomez, Nestor Gonzalez (Prolog code)
 *  @version ch2.8
 *  @see https://tataranietos.com/2018/01/02/arbol-genealogico-dark/
 *  @copyright (c)2022 Christofer Gomez, Nestor Gonzalez.
*/

:- module(hechos, [persona/2, padre/2, madre/2, esposo/2]).

/**
 * persona(+personaje:name, +genero:name) is det
 * 
 * Este el hecho persona/2 define las personas pertenecientes
 * al arbol genealógico. Ademas, define el genero de la misma.
 * 
 * @param personaje es el atomo que representa el nombre del
 * personaje.
 * @param genero representa el genero de del personaje
 * masc si este es masculino y fem si es femenino. */
persona(noah, masc).
persona(agnes, fem).
persona(jana, fem).
persona(tronte, masc).
persona(ulrich, masc).
persona(mads, masc).
persona(katharina, fem).
persona(mikkel, masc).
persona(michael, masc).
persona(martha, fem).
persona(magnus, masc).
persona(jonas, masc).
persona(hannah, fem).
persona(cain, masc).
persona(ines, fem).
persona(daniel, masc).

/**
 * mismaPersona(+persona1:name, +persona2:name) is det
 * 
 * Este el hecho mismaPersona/2 representado por un functor
 * de aridad 2 establece que la persona1 es la mimsa persona2.
 * 
 * @param persona1 es el atomo que representa a una persona.
 * @param persona2 persona a la cual es igual la persona1 */
mismaPersona(mikkel, michael).
mismaPersona(michael, mikkel).

/**
 * padre(+p:name, +h:name) is det
 * 
 * EL hecho padre/2 es un functor de aridad 2 que establece 
 * que el primer argumento es padre del segundo argumento. 
 * 
 * @param p es el padre de la relacion. 
 * @param h es la persona de la cual es padre p. */
padre(noah, tronte).  
padre(tronte, ulrich).
padre(tronte, mads).  
padre(ulrich, mikkel).
padre(ulrich, martha).
padre(ulrich, magnus).
padre(michael, jonas). 
padre(jonas, cain).
padre(daniel, ines).

/** 
 * Del hecho de que mikkel y michael son la misma persona,
 * se definen inductivamente los siguientes hechos de padres.
*/
padre(ulrich, Y) :- mismaPersona(mikkel, Y).
padre(X, jonas) :- mismaPersona(X, michael).

/**
 * madre(+m:name, +h:name) is det
 * 
 * EL hecho madre/2 es un functor de aridad 2 que establece 
 * que el primer argumento es madre del segundo argumento. 
 * 
 * @param m es la madre de la relacion. 
 * @param h es la persona de la cual es madre m. */
madre(agnes, tronte).
madre(jana, ulrich).
madre(jana, mads).
madre(katharina, mikkel).
madre(katharina, martha).
madre(katharina, magnus).
madre(hannah, jonas).
madre(martha, cain).
madre(ines, michael).

/** 
 * Del hecho de que mikkel y michael son la misma persona,
 * se definen inductivamente los siguientes hechos de madre/2.
*/
madre(katharina, Y) :- mismaPersona(mikkel, Y).
madre(ines, Y) :- mismaPersona(michael, Y).

/**
 * esposo(+h:name, +m:name) is det
 *  
 * EL hecho esposo/2 es un functor de aridad 2 que establece 
 * que el primer argumento es esposo del segundo argumento. 
 * 
 * @param h es el esposo de la relacion.
 * @param m es la persona de la cual h es esposo. */
esposo(noah, agnes).
esposo(tronte, jana).
esposo(ulrich, katharina).
esposo(michael, hannah).

/** 
 * Del hecho de que mikkel y michael son la misma persona,
 * se define inductivamente el siguiente hecho de esposos.
*/
esposo(X, hannah) :- mismaPersona(X, michael).




