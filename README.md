# Metal Gear Solid: Logical Programming (Prolog)

This assignment was worked on by Jaime Trejo and Sokunthea Rin to try to undersand/learn Prolog.

### What is Metal Gear
Metal Gear is an action-adventure video game series created by Hideo Kojima and published by Konami.

### Rules and Facts

The facts that we included are to find out who is a male, female, sibling, parent, foxhound member, patriot members and much more.

The rules we have is to check if X is a parent of Y, X is a sibling of Y, who is a member of the patriots and foxhound from a given list and more. 

##### Males

<p align="center">
  <img  src="https://github.com/jaime-trejo/Prolog/blob/master/males.png"/>
</p>

```
male(bigBoss).
male(solidSnake).
male(liquidSnake).
male(solidusSnake).
male(campbell).
male(sigint).
male(ocelot).
male(raiden).
male(zero).
male(grayFox).

Output

male(x).
X = bigBoss;
X = solidSnake;
X = liquidSnake;
X = solidusSnake;
X = campbell;
X = sigint;
X = ocelot;
X = raiden;
X = zero;
X = grayFox;
```

##### Females

<p align="center">
  <img  src="https://github.com/jaime-trejo/Prolog/blob/master/females.png"/>
</p>

```
female(eva).
female(meryl).
female(sniperWolf).
female(rose).
female(naomi).
female(paramedic).

Output

female(x).
X = eva;
X = meryl;
X = sniperwolf;
X = rose;
X = naomi;
X = paramedic;
```

##### Siblings

<p align="center">
  <img  src="https://github.com/jaime-trejo/Prolog/blob/master/siblings.png"/>
</p>

```
%Rules for some family relationships
brother(X,Y) :- sibling(X,Y), male(X), not(X=Y).
brothers(X,A,B) :-sibling(X,A),sibling(X,B),not(X=A),not(X=B),not(A=B).
sister(Y,X) :- sibling(X,Y), female(Y), not(X=Y).
mother(X,Y) :- parent(X,Y),female(X).
mother(X,Y,Z) :- parent(X,Y),parent(X,Z),female(X),not(Y = Z).
father(X,Y) :- parent(X,Y),male(X),not(X=Y).
father(X,A,B) :- parent(X,A),parent(X,B),male(X),not(A = B),not(B = A).
father(X,A,B,C) :- parent(X,A),parent(X,B),parent(X,C),male(X),not(A = B),not(A = C),not(B = C),not(C = A),not(C = B).

%sibling history in the game
sibling(solidSnake,liquidSnake).
sibling(liquidSnake,solidSnake).
sibling(solidSnake,solidusSnake).
sibling(solidusSnake,solidSnake).
sibling(solidusSnake,liquidSnake).
sibling(liquidSnake,solidusSnake).
sibling(grayFox,naomi).

brother(soldidSnake,liquidSnake). 
true .
sister(naomi,grayFox).
true .
```



