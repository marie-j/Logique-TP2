% Mercier Tony
% Jones Marie

% TP2 : Les listes en Prolog

% Q1 :

longueur([],0).
longueur([_ |L],X) :- longueur(L,Y), X is (Y+1).

% Q2 :

somme([],0).
somme([N | L],X) :- somme(L,Y), X is (Y+N).

% Q3 :

membre(X,[Y | _]) :- X == Y , !.
membre(X,[_ | L]) :- membre(X,L).
not(membre(_,[])).

% Q4 :

ajoute_en_tete(X,L,R) :- R = [X | L].

% Q5 :

ajoute_en_queue(X,[],[X]) :- !.
ajoute_en_queue(X,[Y | L],[Y | R]) :- ajoute_en_queue(X,L,R).

% Q6 :

extraire_tete(L,T,Q) :- ajoute_en_tete(T,Q,L).

% Q7 :

concatene([],[],[]).
concatene([],[Y | S],[Y | L]) :- concatene([],S,L).
concatene([X | F],S,[X | L]) :- concatene(F,S,L).

% Q8 :

retourne([],A,R) :- R = A.
retourne([X | L],A,R) :- retourne(L,[X |A],R).

% Q9 :

insert_trie(X,[],[X]).
insert_trie(X,[Y | L],[X | [Y | L]]) :- X < Y , !.
insert_trie(X,[Y |L],[Y |R]) :- insert_trie(X,L,R).

% Q10 :

tri_insert([],_).
tri_insert([X | L],R) :- tri_insert(L,T),insert_trie(X,T,R).

% Q11 :

divise([],[],[]).
divise([X | L],[X | L1],L2) :- divise(L,L2,L1).

% Q12 :

fusion([],[],[]).
fusion([X],[],[X]).
fusion([X | L1],[Y | L2],[X | L]) :- X <Y ,fusion(L1,[Y | L2],L), !.
fusion(L1,[Y | L2],[Y | L]) :- fusion(L1,L2,L).

% Q13 :

tri_fusion([X],[X]).
tri_fusion(L,R) :- divise(L,L1,L2),tri_fusion(L1,R1),fusion(R1,L2,R).

% Q14 :

balance(_,[],[],[]).
balance(N,[X | L],[X | L1],L2) :- X < N , balance(N,L,L1,L2) , !.
balance(N,[X | L],L1,[X | L2]) :- balance(N,L,L1,L2).

% Q15 :

tri_rapide([],_).
tri_rapide([X],[X]).
tri_rapide([X | L],R) :- balance(X,L,L1,L2),tri_rapide(L1,R1),tri_rapide(L2,R2),concatene(R1,[X | []],T),concatene(T,R2,R).

% Q16 :

est_vide([]).

% Q17 :

ajoute_ensemble(N,[],[N]).
ajoute_ensemble(N,[X | L],[X | R]) :- N \=X , ajoute_ensemble(N,L,R).
ajoute_ensemble(_,L,R) :- R = L.



% fonction qui détermine si un élément N appartient à la liste L

appartient(N,[N]).
appartient(N,[X | _]) :- N = X, !.
appartient(N,[_ | L]) :- appartient(N,L).

% Q18 :

sous_ensemble([],_).
sous_ensemble([X | S],E) :- appartient(X,E),sous_ensemble(S,E).

% Q19 :

union(L,[],L).
union(L1,[X | L2],R) :- ajoute_ensemble(X,L1,T),union(T,L2,R).

% Q20 :

intersect(_,[],[]).
intersect(L1,[X | L2],[ X | R]) :- appartient(X,L1),intersect(L1,L2,R).
intersect(L1,[_ | L2],R) :- intersect(L1,L2,R).

% Q21 :

diff([],_,[]).
diff([X | L1],L2,L) :- appartient(X,L2),diff(L1,L2,L).
diff([X | L1],L2,[X |L]) :- diff(L1,L2,L).
