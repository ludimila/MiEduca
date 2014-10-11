content(1,'Prolog',14,5,1,'Quais dois elementos disjuntos que constituem um algoritmo de programacao logica?','Logica e Controle','Controle e Condicao','Logica e Condicao','Condicao e Recursividade',1).
content(2,'Prolog',14,5,4,'Qual o paradigma fundamental da programacao logica ?','Programacao Procedimental','Programacao Declarativa','Programacao Recursiva', 'Programacao Implicita', 2).

discipline(Id,Discipline) :- content(Id,Discipline,_,_,_,_,_,_,_,_,_).
lesson(Id,Lesson) :- content(Id,_,Lesson,_,_,_,_,_,_,_,_).
page(Id,Page) :- content(Id,_,_,Page,_,_,_,_,_,_,_).
paragraph(Id,Paragraph) :- content(Id,_,_,_,Paragraph,_,_,_,_,_,_).
question(Id,Question) :- content(Id,_,_,_,_,Question,_,_,_,_,_).
alternative(Id,1,FirstAlternative) :- content(Id,_,_,_,_,_,FirstAlternative,_,_,_,_).
alternative(Id,2,SecondAlternative) :- content(Id,_,_,_,_,_,_,SecondAlternative,_,_,_).
alternative(Id,3,ThirdAlternative) :- content(Id,_,_,_,_,_,_,_,ThirdAlternative,_,_).
alternative(Id,4,FourthAlternative) :- content(Id,_,_,_,_,_,_,_,_,FourthAlternative,_).
answer(Id,Answer) :- content(Id,_,_,_,_,_,_,_,_,_,Answer).

teste1 :- 
	pergunta1(1,Param1),nl,
	write(Param1).

pergunta1(0,Param1) :- !.
pergunta1(1,Param2) :- Param2='Qual a pergunta?',nl,!.

