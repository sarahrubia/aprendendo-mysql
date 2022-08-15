CREATE DATABASE hashtagfinder;

CREATE TABLE equipe (
	Id INT AUTO_INCREMENT NOT NULL,
	Squad VARCHAR(10) NOT NULL,
    Nome VARCHAR(150) NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    Github VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Linkedin VARCHAR(255) NOT NULL,
    Imagem VARCHAR(255) NOT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE sobre (
	Id INT AUTO_INCREMENT NOT NULL,
    Squad VARCHAR(10) NOT NULL,
    Sobre TEXT(20000) NOT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE buscas (
	Id INT AUTO_INCREMENT NOT NULL,
	Squad VARCHAR(10) NOT NULL,
    Hashtag VARCHAR(100) NOT NULL,
    DataBusca DATE NOT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE login (
	Id INT AUTO_INCREMENT NOT NULL,
	Squad VARCHAR(10) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Senha VARCHAR(20) NOT NULL,
    PRIMARY KEY(Id)
);

INSERT INTO equipe (Squad, Nome, Descricao, Github, Email, Linkedin, Imagem)
VALUES ("04-22", "Sarah Santos", "Desenvolvedora Front-End", "sarahrubia", "sarahrubia22@gmail.com", "sarahrubia", "avatar.jpg"),
("04-22", "Joane Alves", "Desenvolvedora Full Stack", "joanealves", "joane@gmail.com", "joanealves", "joaneavatar.jpg");

SELECT * FROM equipe;

UPDATE equipe 
SET Nome = "Sarah Rúbia"
WHERE Id = 1;

DELETE FROM equipe WHERE Id = 2;

CREATE TABLE busca_resultados (
	Id INT AUTO_INCREMENT NOT NULL,
    TweetId VARCHAR(25),
    UserId VARCHAR(50),
	TweetSource VARCHAR(50),
    TweetText VARCHAR(280),
    PRIMARY KEY(Id)
);

CREATE TABLE busca_medias (
	Id INT AUTO_INCREMENT NOT NULL,
	TweetId VARCHAR(25),
	Media VARCHAR(25),
    FOREIGN KEY (Id) REFERENCES busca_resultados(Id)
);

INSERT INTO busca_resultados (TweetId, UserId, TweetSource, TweetText)
VALUES ("1538713850383503362", "1559234700870406146", "Twitter Web App", "Follow for new amazing #photographs\n\nVisit My Phot…otographyislife #instapic https://t.co/xWzNUhfj58"),
("1391602786886955009", "1559234961684717568", "Twitter Web App", "Relendo “Na natureza selvagem” e morrendo de amores da amizade do Chris com o Ronald. Uma amizade improvável demais.");

SELECT * FROM busca_resultados;

ALTER TABLE busca_resultados ADD FULLTEXT(TweetText);

SELECT * 
FROM busca_resultados 
WHERE MATCH TweetText
AGAINST ("Relendo" IN NATURAL LANGUAGE MODE);
