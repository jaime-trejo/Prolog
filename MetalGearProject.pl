%Logical Programming with Prolog
%This project will be using the Metal Gear series (video game) as the theme.

%Rules for some family relationships
brother(X,Y) :- sibling(X,Y), male(X), not(X=Y).
brothers(X,A,B) :-sibling(X,A),sibling(X,B),not(X=A),not(X=B),not(A=B).
sister(Y,X) :- sibling(X,Y), female(Y), not(X=Y).
mother(X,Y) :- parent(X,Y),female(X).
mother(X,Y,Z) :- parent(X,Y),parent(X,Z),female(X),not(Y = Z).
father(X,Y) :- parent(X,Y),male(X),not(X=Y).
father(X,A,B) :- parent(X,A),parent(X,B),male(X),not(A = B),not(B = A).
father(X,A,B,C) :- parent(X,A),parent(X,B),parent(X,C),male(X),not(A = B),not(A = C),not(B = C),not(C = A),not(C = B).

%Rules to see how old the game is
gameAge(X,Y) :- game(X),datePublished(X,Date), Y is (2014-Date).

%Rules to see if the game is able to played on that console
playableOn(X,Y) :- game(X),console(Y),runOn(X,Y).

%Rules to see if the metal gear belongs in that given game
gearBelongsIn(X,Y) :-metalGear(X),game(Y),partOf(X,Y).

%Checks if person is a member of FoxHound unit.
foxhound_mem([], [], []).
foxhound_mem([H|T], [H|FoxMem1], NotFox) :-
        member(H,[solidSnake, liquidSnake, bigBoss, grayFox, ocelot, campbell, sniperWolf]),
	foxhound_mem(T, FoxMem1, NotFox).
foxhound_mem([H|T], FoxMem, [H|NotFox1]) :-
        member(H,[solidSnake, liquidSnake, bigBoss, grayFox, ocelot, campbell, sniperWolf]),!, fail
	;
	true,
	foxhound_mem(T, FoxMem, NotFox1).

%Check if person is a member of the Patriots
pat_mem([], [], []).
pat_mem([H|T], [H|PatMem1], NotPat) :-
        member(H,[bigBoss, eva, ocelot, zero, sigint, paramedic]),
	pat_mem(T, PatMem1, NotPat).
pat_mem([H|T], PatMem, [H|NotPat1]) :-
        member(H,[bigBoss, eva, ocelot, zero, sigint, paramedic]),!, fail
	;
	true,
	pat_mem(T, PatMem, NotPat1).

%Check if person is a Patriot, checks if male and patriots
%or female and patriots condition
isAPatriot(X) :- (male(X),patriots(X));(female(X), patriots(X)).

%Check if person is a Foxhound, checks if male or female, and foxhound
%condition
isAFoxhound(X) :- (male(X);female(X)),foxhound(X).

%Rules to see what the setting is for the game
whatIsTheSetting(X,Y) :- game(X),setting(X,Y).

%Rules for what game can I play if I want a specific setting
whatCanIPlayInThisSetting(Y,X) :- setting(X,Y).

%Facts
%The name of games
game(metalGearSolidPeacewalker).
game(metalGearSolid2SonsOfLiberty).
game(metalGearSolid).
game(metalGearSolid3SnakeEater).
game(metalGearSolid4GunsOfThePatriots).
game(metalGear).
game(metalGear2).

%The date the game was published
datePublished(metalGearSolid,1998).
datePublished(metalGear2,1990).
datePublished(metalGear,1987).
datePublished(metalGearSolid2SonsOfLiberty,2001).
datePublished(metalGearSolidPeacewalker,2010).
datePublished(metalGearSolid3SnakeEater,2004).
datePublished(metalGearSolid4GunsOfThePatriots,2008).

%The name of the metal gears in the games
metalGear(zeke).
metalGear(ray).
metalGear(rex).
metalGear(tx-55).
metalGear(metalGearD).

%The male characters in the games
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

%The female characters in the games
female(eva).
female(meryl).
female(sniperWolf).
female(rose).
female(naomi).
female(paramedic).

%sibling history in the games
sibling(solidSnake,liquidSnake).
sibling(liquidSnake,solidSnake).
sibling(solidSnake,solidusSnake).
sibling(solidusSnake,solidSnake).
sibling(solidusSnake,liquidSnake).
sibling(liquidSnake,solidusSnake).
sibling(grayFox,naomi).

%Members of FoxHound.
foxhound(bigBoss).
foxhound(grayFox).
foxhound(solidSnake).
foxhound(liquidSnake).
foxhound(campbell).
foxhound(ocelot).
foxhound(sniperWolf).

%Members of the patriots
patriots(bigBoss).
patriots(sigint).
patriots(zero).
patriots(paramedic).
patriots(eva).
patriots(ocelot).

%parent history in the games
parent(bigBoss,solidSnake).
parent(bigBoss,liquidSnake).
parent(bigBoss,solidusSnake).
parent(eva,solidSnake).
parent(eva,liquidSnake).
parent(campbell,meryl).

%metal gears take part in which game
partOf(zeke,metalGearSolidPeacewalker).
partOf(ray,metalGearSolid2SonsOfLiberty).
partOf(ray,metalGearSolid4GunsOfThePatiots).
partOf(rex,metalGearSolid).
partOf(rex,metalGearSolid4GunsOfThePatiots).
partOf(tx-55,metalGear).
partOf(metalGearD,metalGear2).

%name of consoles
console(playstation1).
console(vita).
console(playstation2).
console(playstation3).

%games playable on the system
runOn(metalGearSolid,playstation1).
runOn(metalGearSolid,psp).
runOn(metalGearSolid,vita).
runOn(metalGear,playstation3).
runOn(metalGear,vita).
runOn(metalGear2,playstation3).
runOn(metalGear2,vita).
runOn(metalGearSolidPeaceWalker,vita).
runOn(metalGearSolidPeaceWalker,psp).
runOn(metalGearSolidPeaceWalker,playstation3).
runOn(metalGearSolid2SonsOfLiberty,playstation2).
runOn(metalGearSolid2SonsOfLiberty,playstation3).
runOn(metalGearSolid2SonsOfLiberty,vita).
runOn(metalGearSolid3SnakeEater,playstation2).
runOn(metalGearSolid3SnakeEater,playstation3).
runOn(metalGearSolid3SnakeEater,vita).
runOn(metalGearSolid4GunsOfThePatriots,playstation3).

%the setting(time period, in game) for each game
setting(metalGearSolid,shadowMosesIncident).
setting(metalGearSolid2SonsOfLiberty,bigShellIncident).
setting(metalGearSolid3SnakeEater,coldWar).
setting(metalGearSolidPeaceWalker,cubanMissleCrisis).
setting(metalGear2,zanzibarIsland).
setting(metalGear,outerHeaven).
setting(metalGearSolid4GunsOfThePatriots,nanoMachines).
