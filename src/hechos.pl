% Archivo que contiene los hechos

% Hecho: personas
% persona(X, Y) donde X es 
% una persona de tipo Y.
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

% Hecho: padre
% padre(X,Y) donde X es
% padre de Y.
padre(noah, tronte).
padre(tronte, ulrich).
padre(tronte, mads).
padre(ulrich, mikkel).
padre(ulrich, martha).
padre(ulrich, magnus).
padre(mikkel, jonas).
padre(jonas, cain).

% Hecho: madre
% madre(X,Y) donde X es
% padre de Y.
madre(agnes, tronte).
madre(jana, ulrich).
madre(jana, mads).
madre(katharina, mikkel).
madre(katharina, martha).
madre(katharina, magnus).
madre(hannah, jonas).
madre(martha, cain).

% Hecho: esposo
% esposo(X,Y) donde X es
% esposo de Y.
esposo(noah, agnes).
esposo(tronte, jana).
esposo(ulrich, katharina).
esposo(mikkel, hannah).