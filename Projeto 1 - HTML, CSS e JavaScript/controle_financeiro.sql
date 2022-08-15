CREATE DATABASE controle_financeiro;
CREATE TABLE transacao (
	Id INT AUTO_INCREMENT NOT NULL,
    Tipo VARCHAR(7) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Valor decimal(10,2) NOT NULL,
    DataCadastro DATE,
    PRIMARY KEY(Id)
);

INSERT INTO transacao (Tipo, Nome, Valor, DataCadastro)
VALUES ("Compra", "Geladeira", -2500.00, 20220726),
("Venda", "Celular", 1999.99, 20220520),
("Venda", "Fogão", 1599.99, 20220222);

SELECT * FROM controle_financeiro.transacao ORDER BY DataCadastro ASC;

SELECT SUM(Valor) AS saldo FROM transacao;

DELETE FROM transacao;       