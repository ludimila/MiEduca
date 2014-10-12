/*Questões de Grails para a aplicação*/
/*Content(Id,Discipline,Lesson,Page,Paragraph,Question,Aternative1,Alternative2,Alternative3,Alternative4,CorrectAlternative) */
content(,,,,,,,,,,).
content(50,'Grails', 4,9,2,'Quais sao alguns dos facilitadores do Grails?', 'Suporte nativo a listas, mapas e closure', 'Possui listas, grafos e hashes', 'Aceita linguagens como Python, Rails e C', 'Suporte nativo a internacionalizacao', 1).
content(51,'Grails', 4,29,1,'Qual o comando para criar uma aplicaÃ§Ã£o em Grails?', 'sudo apt-get install grails-app', 'grails create-domain-class Nome', 'grails create-app Nome', 'package Nome', 3).
content(52,'Grails', 4,44,1,'Qual o comando para criar as telas, controladoras e testes da classe dominio?','grails run-app','grails generate-all Classe','grails create-app Nome','static belongsTo = [classe: Classe]',2).
content(53,'Grails',5a,6,3,'Comando para criar uma classe de dominio e:','grails create-domain-class Classe',':-op(precedencia,xf,[operadores]).','cout >> "Create domain class Classe";','SELECT * FROM Classe',1).
content(54,'Grails',5a,35,2,'Comando utilizado para atualizar as dependencias do Grails e:','grails rake schema.db','sudo apt-get update','grails update-dependencies','grails refresh-dependencies',4).
content(55,'Grails',5a,34,2,'O conceito de scaffold esta relacionado a:','Possibilitar que a aplicacao contenha metodos do CRUD','Seja possível utilizar o bootstrap','Criptografe as senhas dos usuarios','Que a aplicaÃ§Ã£o se torne web',1).
content(56,'Grails',5b,18,1,'Qual o codigo para gerar uma associacao 1:1?','set.Association  = [1:1->Classe]','this.HasOne.Classe','static hasOne = [classe:Classe]','classe unique: true',3).
content(57,'Grails',5b,18,1,'Codigo para que uma das dependencias nao sejam obrigatorias na criacao.','classe unique: true','classe nullable: true','bool is_nullable = 1;','n.d.a.',2).
content(58,'Grails',5b,37,1,'O que em um codigo referencia para uma dependencia de outra classe?','set.BelongTo = Classe','static hasOneFather = Classe','static belongsTo = Classe','Todas as anteriores',3).
content(59,'Grails',5b,18,2,'Unique, nullable, blank entre outras, são:','Variaveis estaticas','Atributos da Classe','Classes','Constraints',4).
