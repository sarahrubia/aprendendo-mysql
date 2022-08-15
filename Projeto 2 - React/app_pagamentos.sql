CREATE DATABASE app_pagamentos;
CREATE TABLE usuario (
	Id INT AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Imagem VARCHAR(255) NOT NULL,
    NomeUsuario VARCHAR(50) NOT NULL,
    DataCadastro DATE,
    PRIMARY KEY(Id)
);

CREATE TABLE cartao (
	Id INT AUTO_INCREMENT NOT NULL,
    Numero BIGINT NOT NULL,
    CVV INT NOT NULL,
    Expiracao VARCHAR(5) NOT NULL,
    Valido VARCHAR(8) NOT NULL,
    DataCadastro DATE,
    PRIMARY KEY(Id)
);

CREATE TABLE transacao (
	Id INT AUTO_INCREMENT NOT NULL,
    Id_Usuario INT,
    Id_Cartao INT,
    Valor decimal(10,2) NOT NULL,
    DataCadastro DATE,
    PRIMARY KEY(Id),
    CONSTRAINT IdUser FOREIGN KEY(Id_Usuario) REFERENCES usuario(Id),
    CONSTRAINT IdCard FOREIGN KEY(Id_Cartao) REFERENCES cartao(Id)
);

INSERT INTO usuario (Nome, Imagem, NomeUsuario, DataCadastro)
VALUES ("Eduardo Santos", "https://randomuser.me/api/portraits/men/9.jpg", "@eduardo.santos", 20220726),
("Felipe Andrade", "https://randomuser.me/api/portraits/men/67.jpg", "@felipe.andrade", 20220520),
("Mariana Torres", "https://randomuser.me/api/portraits/women/34.jpg", "@mariana.torres", 20220222);

SELECT * FROM usuario ORDER BY Nome ASC;

INSERT INTO cartao (Numero, CVV, Expiracao, Valido, DataCadastro)
VALUES ("1111222233334444", 123, "01/23", "Valido", 20220726),
("9999999999999999", 456, "08/26", "Invalido", 20220520),
("6666555577774444", 789, "02/27", "Valido", 20220222);

SELECT * FROM cartao WHERE Valido="Valido" ORDER BY DataCadastro ASC;

INSERT INTO transacao (Id_Usuario, Id_Cartao, Valor, DataCadastro)
VALUES (1, 1, 250.00, 20220726),
(2, 2, 720.00, 20220520),
(1, 1, 15.00, 20220222);  

SELECT *
FROM  transacao
INNER JOIN usuario ON transacao.Id_Usuario = usuario.Id
INNER JOIN cartao ON transacao.Id_Cartao = cartao.Id;