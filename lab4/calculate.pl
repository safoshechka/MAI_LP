calculate(List, Result):-
    sum_differ(List, Result),!.

sum_differ(E, Result):-
    append(T, ['+'| E1], E),
    sum_differ(T, Result1),
    division(E1, Result2),
    Result is Result1 + Result2.

sum_differ(E, Result):-
    append(T, ['-'| E1], E),
    sum_differ(T, Result1),
    division(E1, Result2),
    Result is Result1 - Result2.

sum_differ(E, Result):-
    division(E, Result).

division(T, Result):-
    append(N, ['*' | T1], T),
    division(N, Result1),
    new_power(T1, Result2),
    Result is Result1 * Result2.

division(T, Result):-
    append(N, ['/' | T1], T),
    division(N, Result1),
    new_power(T1, Result2),
    Result is Result1 / Result2.

division(T, Result):-
    new_power(T, Result).

new_power(T, Result):-
    append(N, ['^', T2], T),
    new_power(N, T1),
    Result is T1 ** T2.

new_power([Result], Result):-
    number(Result).