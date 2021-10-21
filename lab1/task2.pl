% var3:

% 1. Для каждого студента, найти средний балл, и сдал ли он экзамены или нет

% (фамилия студента, средняя оценка)
sredn(Stud,Mark):-
	student(_,Stud,Q),
	sum(Q, Sum),
	length(Q,Len),
	Mark is Sum / Len.
		
% сумма всех элементов в списке
% (список, сумма)
sum([grade(_, H)|T],N):-
	sum(T,K),
	N is K+H.
sum([],0).

% сдал ли студент экзамены
% при наличии двойки-false
% (фамилия студента)
exms(Stud):-
	student(_,Stud,Marks),
	not(member(grade(_,2),Marks)).


% 2. Для каждого предмета, найти количество не сдавших студентов

% (название предмета, количество)
sfailed(Subj,N):-
	subject(Ss,Subj),
	findall(A,(student(_,_,A),gradeInList(A,Ss)),AllMarks),
	length(AllMarks,N).

gradeInList([grade(Subj,2)|_],Subj).
gradeInList([_|Tail],Subj):-
	gradeInList(Tail,Subj).
	
  
% 3. Для каждой группы, найти студента (студентов) с максимальным средним баллом

% (группа, список учеников)
thebest(Group,N):-
  % список со всеми средними оценками
  findall(Mark, (student(Group,Stud,_), sredn(Stud,Mark)),Marks),
  % максимальная оценка
  max(Marks,Max),
  % список студентов с максимальной оценкой
  findall(A,(student(Group,A,_), sredn(A,M), M==Max), N),!.

% нахождение максимального из положительного числового списка
% (список, максимум)
max([],0).
max([H|T],N):-
  max(T,R),
  H =< R,
  N is R.
max([H|T],N):-
  max(T,R),
  H >= R,
  N is H.


