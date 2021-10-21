% Реализация стандартных предикатов обработки списков

% Длина списка
% (список, длина)
my_length([], 0).
my_length([_|L], N):-my_length(L, M), N is M + 1.

% Принадлежность элемента списку
% (элемент, список)
my_member(X, [X|_]).
my_member(X, [_|T]):-my_member(X, T).

% Конкатeнация списков
% (список1, список2, список1+2)
my_append([], L, L).
my_append([X|L1], L2, [X|L3]):-my_append(L1, L2, L3).

% Удаление элемента из списка
% (элемент, список, список без элемента)
my_remove(X, [X|T], T).
my_remove(X, [Y|T], [Y|Z]):-my_remove(X, T, Z).

% Перестановки элементов в списке
% (список, перестановка)
my_permute([], []).
my_permute(L, [X|T]):-my_remove(X, L, Y), my_permute(Y, T).

% Подсписки списка
% (подсписок, список)
my_sublist(S, L):-my_append(_, L1, L), my_append(S, _, L1).


% var4 - удаление первых 3х элементов списка
% с использованием стандартных предикатов 
delete_(X, X_3):- length(X, R), R > 3, append([_], X_1, X), append([_], X_2, X_1), append([_], X_3, X_2),!.
delete_(X, []):- length(X, R), R =< 3. 

% без использования стандартных предикатов
remove_first([_|X], X).
delete_(X, X_3):- length(X, R), R > 3, remove_first(X, X_1),remove_first(X_1, X_2), remove_first(X_2, X_3).
delete_(X, []):- length(X, R), R =< 3.


% var8 - вычичсление среденего арифметического элементов списка
% с использованием стандартных предикатов 
sum([],0).
sum([X|T],S) :- sum(T,S1), S is S1+X.
arithmetic_mean(T,X) :- length(T,L), arithmetic_mean(T,X,L).
arithmetic_mean(T,X,L) :- sum(T,S), X is S/L. 

% без использования стандартных предикатов
arithmetic_mean_([],0,0).
arithmetic_mean_(T,X) :- arithmetic_mean_(T,S,C), X is S/C,!.
arithmetic_mean_([X|T],S,C) :- arithmetic_mean_(T,S1,C1), S is S1+X, C is C1+1.
