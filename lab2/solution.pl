/*проверка на единственность факта*/
unique([]):-!.
unique([H|T]):-
member(H,T),!,fail;
unique(T).

/*перечислим учителей: Морозова, Васильева и Токарева*/
man(morozov).
man(vasiliev).
man(tokarev).
 
/*перечислим предметы, которые они преподают: история, французкий, биология, английский, математика и география*/
subject(history).
subject(french).
subject(biology).
subject(english).
subject(maths).
subject(geography).
 
/*теперь создадим предикат 'учитель' и проверим все известные факты из условия, выведем ответ*/
teacher(S,L1,L2).
solve(Solve):-
Solve = [teacher(X,XL1,XL2),teacher(Y,YL1,YL2),teacher(Z,ZL1,ZL2)],
man(X), man(Y), man(Z), not(X=Y),not(Y=Z),not(X=Z),
subject(XL1),subject(XL2),
subject(YL1),subject(YL2), 
subject(ZL1),subject(ZL2), 
unique([XL1,XL2,YL1,YL2,ZL1,ZL2]),
not(member(teacher(_,geography,french),Solve)),
not(member(teacher(_,french,geography),Solve)),
not(member(teacher(tokarev,biology,_),Solve)),
not(member(teacher(tokarev,_,biology),Solve)),
not(member(teacher(tokarev,french,_),Solve)),
not(member(teacher(tokarev,_,french),Solve)),
not(member(teacher(_,biology,french),Solve)),
not(member(teacher(_,french,biology),Solve)),
not(member(teacher(morozov,biology,_),Solve)),
not(member(teacher(morozov,_,biology),Solve)),
not(member(teacher(_,biology,maths),Solve)),
not(member(teacher(_,maths,biology),Solve)),
not(member(teacher(_,english,maths),Solve)),
not(member(teacher(_,maths,english),Solve)),
not(member(teacher(morozov,_,english),Solve)),
not(member(teacher(morozov,english,_),Solve)),
not(member(teacher(morozov,_,maths),Solve)),
not(member(teacher(morozov,maths,_),Solve)),
!.
