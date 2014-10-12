:- dynamic(recomendations/5).
:- dynamic(gamePoint/1).
:- dynamic(content/11).

/*Content(Id,Discipline,Lesson,Page,Paragraph,Question,Aternative1,Alternative2,Alternative3,Alternative4,CorrectAlternative) */

content(1,'Haskell',9,18,1,	'Haskell é uma linguagem de programação puramente?','orientada a objetos','funcional','imperativa','lógica',2).
content(2,'Haskell',9,22,1,'Como são representadas funções para entrada e saída de dados em haskell?','putStrLn, getLine','scanf, fscanf','read, readln','ghci, ghcin',1).
content(3,'Haskell',9,33,1,'O resultado da operacao succ 9*10 é :','91','90','100','0',3).
content(4,'Haskell',9,45,1,'O paradigma funcional prioriza:','passagem por referencia','passagem por parametro','uso de parenteses','recursão',4).
content(5,'Haskell',10,	8,2,'Para obter o elemento de uma lista em haskell pelo seu índice é utilizado o operador:','!!','>/','<>',':-',1).
content(6, 'Haskell', 10,22,1,'O que essa função, definida por um gerador  [x*2 | x <- [1..10]], retorna?','os números pares 2, 4, 6, 8,10,12,14, 16, 18, 20','os números  de 1 a 10','Os números primos contidos entre 1 e 10','o tamanho da lista',1).
content(7,'Haskell',10,	38,1,'A travessia em ordem faz o seguinte percurso na ávore:','raiz -> subarvore direita -> subarvore esquerda','subarvore esquerda -> raiz -> subarvore direita','subarvore esquerda -> subarvore direita -> raiz','apenas as subarvores', 2).
content(8,'Haskell',12,	4,1,'O que define um módulo em haskell?','uma coleção de listas','uma coleção de números','uma coleção de funções e tipos relacionados','não existe módulo em haskell',3).
content(9, 'Haskell',12,47,1,'Qual a função da main em Haskell?','chamar outros modulos a partir desse modulo main','inicializar as variaves','diminuir a complexidade do codigo','realizar a função de um metodo construtor',1).
content(10, 'Haskell',12,7,3,'Qual a palavra reservada utlizada para importar modulos em haskell?','include','import','inclusion','use',2).
content(11,'Haskell',12,14,1,'O que a função fromList faz?','verifica se o elemento está contido na lista','lista todos os elementos da lista','deleta um elemento da lista','lista e mapeia associações',4).
content(12, 'Haskell',11,33,2,'Qual o interpretador da linguagem haskell?','MinGw','Dev','Sublime','GHCI',4).
content(13,'Haskell',10,7,1,'Qual o resultado da operação  [1,2,3] ++ [4] ?','[1,2,3,4]','[1,2,3]','[1,2,3]','[1,2,3]','[1,2,3]','[1,2,3]','[4]','[10]',1).
content(14, 'Haskell',10,8,1,'[1,2,3] é equivalente à ?','1,2,3','[1], [2], [3]','1:2:3:[]','1:2:3:',3).


gamePoint(0).
/*Total of questions stored on database*/
numberOfQuestions(14).

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
	ifThenElse(Choice=:=5,gameOver,answer(id,Choice)).
	
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
	
	
