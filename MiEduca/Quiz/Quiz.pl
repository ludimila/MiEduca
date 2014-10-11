:- dynamic content/11.

content(1,'Prolog',14,5,1,'Quais dois elementos disjuntos que constituem um algoritmo de programacao logica?','Logica e Controle','Controle e Condicao','Logica e Condicao','Condicao e Recursividade',1).
content(2,'Prolog',14,5,4,'Qual o paradigma fundamental da programacao logica ?','Programacao Procedimental','Programacao Declarativa','Programacao Recursiva', 'Programacao Implicita', 2).

numberOfQuestions(2).

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

contentRecomendation(Id) :- 
	write('Conteudo da disciplina '),discipline(Id,Discipline),write(Discipline),nl,
	write('Que esta na Aula '),lesson(Id,Lesson),write(Lesson),nl,
	write('Pagina '),page(Id,Page),write(Page),nl,
	write('Paragrafo '),paragraph(Id,Paragraph),write(Paragraph),nl.

incrementPoint(Point,PointMoreOne) :- PointMoreOne is Point+1.

randomizeId(RandomId) :-
		numberOfQuestions(Range),
		RandomId is int(rand(Range) + 1),		
		findall(Id,content(Id,_,_,_,_,_,_,_,_,_,_),Lista), 
		member(RandomId,Lista),!.
randomizeId(RandomId) :- 
		bagof(Id,content(Id,_,_,_,_,_,_,_,_,_,_),Lista),			
		numberOfQuestions(Range),
		randomizeId(Range,RandomId).
randomizeId(RandomId) :-
		write("O jogo acabou").
		

quizItem(Id) :-
	question(Id,Question),write(Question),nl,
	alternative(Id,1,FirstAlternative),write('1)'),write(FirstAlternative),nl,
	alternative(Id,2,SecondAlternative),write('2)'),write(SecondAlternative),nl,
	alternative(Id,3,ThirdAlternative),write('3)'),write(ThirdAlternative),nl,
	alternative(Id,4,FourthAlternative),write('4)'),write(FourthAlternative),nl,
	read(Choice),
	answer(Id,Choice).

quizEngine(Id,Point) :- 
	quizItem(Id), 
	incrementPoint(Point,PointMoreOne),
	randomizeId(RandomId),
	retract(content(Id,_,_,_,_,_,_,_,_,_,_)),
	write('Voce Acertou'),
 	quizEngine(randomizeId, PointMoreOne).
quizEngine(Id,Point) :-
	asserta(recomendations(Id)),
	assertz(recomendations(0)),
	write('Voce Errou'),
	randomizeId(RandomId),
	quizEngine(RandomId,Point).
	

teste1 :- 
	pergunta1(1,Param1),nl,
	write(Param1).

pergunta1(0,Param1) :- !.
pergunta1(1,Param2) :- Param2='Qual a pergunta?',nl,!.

