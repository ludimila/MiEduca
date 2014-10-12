
:- dynamic recomendations/5.
:- dynamic gamePoint/1.
:- dynamic content/11.

/*Content(Id,Discipline,Lesson,Page,Paragraph,Question,Aternative1,Alternative2,Alternative3,Alternative4,CorrectAlternative) */
content(1,'Prolog',14,5,1,'Quais dois elementos disjuntos que constituem um algoritmo de programacao logica?','Logica e Controle','Controle e Condicao','Logica e Condicao','Condicao e Recursividade',1).
content(2,'Prolog',14,5,4,'Qual o paradigma fundamental da programacao logica ?','Programacao Procedimental','Programacao Declarativa','Programacao Recursiva','Programacao Implicita',2).
gamePoint(0).
/*Total of questions stored on database*/
numberOfQuestions(3).

/*Binary relationships of the content*/
discipline(Id,Discipline) :- content(Id,Discipline,_,_,_,_,_,_,_,_,_) ; recomendations(Id,Discipline,_,_,_).
lesson(Id,Lesson) :- content(Id,_,Lesson,_,_,_,_,_,_,_,_) ; recomendations(Id,_,Lesson,_,_).
page(Id,Page) :- content(Id,_,_,Page,_,_,_,_,_,_,_) ; recomendations(Id,_,_,Page,_).
paragraph(Id,Paragraph) :- content(Id,_,_,_,Paragraph,_,_,_,_,_,_) ; recomendations(Id,_,_,_,Paragraph).
question(Id,Question) :- content(Id,_,_,_,_,Question,_,_,_,_,_).
alternative(Id,1,FirstAlternative) :- content(Id,_,_,_,_,_,FirstAlternative,_,_,_,_).
alternative(Id,2,SecondAlternative) :- content(Id,_,_,_,_,_,_,SecondAlternative,_,_,_).
alternative(Id,3,ThirdAlternative) :- content(Id,_,_,_,_,_,_,_,ThirdAlternative,_,_).
alternative(Id,4,FourthAlternative) :- content(Id,_,_,_,_,_,_,_,_,FourthAlternative,_).
alternative(Id,5,QuitGame) :- abort.
answer(Id,Answer) :- content(Id,_,_,_,_,_,_,_,_,_,Answer).

/*Increment the point of quiz game*/
incrementPoint(Point,PointMoreOne) :- PointMoreOne is Point+1.

/*Return a random Id that is contained in the list of contents*/
randomizeId(RandomId) :-
		numberOfQuestions(Range),
		RandomId is int(rand(Range) + 1),		
		findall(Id,content(Id,_,_,_,_,_,_,_,_,_,_),Lista), 
		member(RandomId,Lista). /*Verify if random id is on the list of contents*/ 
randomizeId(RandomId) :-  /*If the random item does not on the list of contents, randomize a new number*/
		findall(Id,content(Id,_,_,_,_,_,_,_,_,_,_),Lista),
		solution(member(X,Lista),S), /*Verify if the list is not Null*/
		randomizeId(RandomId).
randomizeId(RandomId) :- /* if the list is null, the game over*/
		gameOver.			
		
/*Represent a scene with a question and return if the answer is correct or no*/
quizItem(Id) :-
	question(Id,Question),write(Question),nl,
	alternative(Id,1,FirstAlternative),write('  1)'),write(FirstAlternative),nl,
	alternative(Id,2,SecondAlternative),write('  2)'),write(SecondAlternative),nl,
	alternative(Id,3,ThirdAlternative),write('  3)'),write(ThirdAlternative),nl,
	alternative(Id,4,FourthAlternative),write('  4)'),write(FourthAlternative),nl,
	write('  5)Terminar Jogo'),nl,
	read(Choice),
	ifThenElse(Choice=:=5,gameOver,answer(Id,Choice)).
	
ifThenElse(X, Y, _) :- X, !, Y. 
ifThenElse(_, _, Z) :- Z.

quizEngine(Id) :- 
	quizItem(Id),
	gamePoint(Point), 
	incrementPoint(Point,PointMoreOne),
	retract(gamePoint(Point)),
	assertz(gamePoint(PointMoreOne)),
	retract(content(Id,_,_,_,_,_,_,_,_,_,_)), /* If the user hit the answer, remove this from database to this dont repeat*/
	write('Voce Acertou'),nl,nl,	
	randomizeId(RandomId),
 	quizEngine(RandomId).
quizEngine(Id) :-
	discipline(Id,Discipline),
	lesson(Id,Lesson),
	page(Id,Page),
	paragraph(Id,Paragraph),
	retract(content(Id,_,_,_,_,_,_,_,_,_,_)),
	assert(recomendations(Id,Discipline,Lesson,Page,Paragraph)), /*If the user dont hit the answer, insert this question Id to the list of recomendations to study*/
	write('Voce Errou'),nl,nl,
	randomizeId(RandomId),		
	quizEngine(RandomId).
	

gameOver :- write('Fim de jogo'),nl,nl,
		write('Sua pontuacao final foi: '),gamePoint(Point),write(Point),nl,nl,
		showRecomendations.

showRecomendations :- findall(NewId,recomendations(NewId,_,_,_,_),Lista),
		solution(member(CurrentId,Lista),SelectedMember),
		 write('Voce precisa estudar os seguintes itens:'),nl, nl,
		contentRecomendation(CurrentId).
showRecomendations :- write('Parabens, voce acertou tudo e aparentemente nao precisa estudar nada por enquanto'),nl,abort.

/*Recommends one content of accord by of  the Id*/
contentRecomendation(Id) :-
	write('Conteudo da disciplina----'),discipline(Id,Discipline),write(Discipline),nl,
	write('Que esta na Aula----------'),lesson(Id,Lesson),write(Lesson),nl,
	write('Pagina--------------------'),page(Id,Page),write(Page),nl,
	write('Paragrafo-----------------'),paragraph(Id,Paragraph),write(Paragraph),nl,nl,nl,
	retract(recomendations(Id,_,_,_,_)),
	findall(NewId,recomendations(NewId,_,_,_,_),Lista),
	solution(member(CurrentId,Lista),SelectedMember),
	contentRecomendation(CurrentId).
contentRecomendation(Id) :- 
	abort.

main :- nl,nl,nl,
	write('=================================================='),nl,
	write('============Bem vindo ao QuizComenda=============='),nl,
	write('=================================================='),nl,
	write('Responda as perguntas e iremos te recomendar somente o que voce realmente precisa estudar'),nl,
	write('Economize o seu tempo e esfoco'),nl,nl,
	randomizeId(RandomId),		
	quizEngine(RandomId).
	
	
