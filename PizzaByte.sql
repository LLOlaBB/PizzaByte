CREATE DATABASE PizzaByte;

USE PizzaByte;

CREATE TABLE Produtos(
	IdProduto INT IDENTITY(1,1) PRIMARY KEY,
	NomeProduto VARCHAR (255),
	CategoriaProduto VARCHAR(255),
	DescricaoProduto Varchar(255),
	ValorProduto DECIMAL(5,2)
);

CREATE TABLE Usuarios(
	IdCliente INT IDENTITY(1,1) PRIMARY KEY,
	TipoCliente CHAR(1),
	NomeCliente VARCHAR(255),
	TelefoneCliente VARCHAR(16), /*Imaginei que VARCHAR seria melhor por conta das barrinhas ex: (99) 9 9999-9999*/
	EmailCliente VARCHAR(255),
	SenhaCliente VARCHAR(255),
	Endereco VARCHAR(255)
);

CREATE TABLE Entrega(
	IdEntrega INT IDENTITY(1,1) PRIMARY KEY,
	NomeMotoboy VARCHAR(255),
	VeiculoMotoboy VARCHAR(255),
	TelefoneMotoboy VARCHAR(16),
	ValorEntrega DECIMAL (18,2),
	ValorMotoboy DECIMAL(10,2)
);

CREATE TABLE Carrinho(
	IdCarrinho INT PRIMARY KEY IDENTITY(1,1),
	Observacao VARCHAR (255),
);

CREATE TABLE Vendas(
	IdVenda INT IDENTITY(1,1) PRIMARY KEY,
	TempoVenda DATETIME, 
	StatusVenda VARCHAR(255),
	DataVenda datetime,
	Preco DECIMAL(5,2),
	TipoVenda CHAR(1),
	idCliente INT,
	idEntrega INT,
	idCarrinho INT,
	CONSTRAINT fk_Usuarios_id FOREIGN KEY (idCliente) 
	REFERENCES Usuarios(IdCliente),
	CONSTRAINT fk_entrega_id FOREIGN KEY (idEntrega)
	REFERENCES Entrega(IdEntrega),
	CONSTRAINT fk_carrinho_id FOREIGN KEY (idCarrinho)
	REFERENCES Carrinho(IdCarrinho)
);

CREATE TABLE CarrinhoProduto(
	IdCarrinho int,
	IdProduto int,
	QuantidadePC INT,
	Sabores VARCHAR (255),
	PRIMARY KEY (IdCarrinho, IdProduto),
	FOREIGN KEY(IdProduto)
	REFERENCES Produtos(IdProduto),
	FOREIGN KEY (IdCarrinho)
	REFERENCES Carrinho(IdCarrinho)
);

insert into Usuarios 
(TipoCliente, NomeCliente, TelefoneCliente, 
EmailCliente, SenhaCliente,Endereco)
VALUES 
('C', 'Lucas', '(00)0000-0000', 'lucas@email.com', 
'senha123', 'Amazonas')

insert into Usuarios 
(TipoCliente, NomeCliente, TelefoneCliente, 
EmailCliente, SenhaCliente,Endereco)
VALUES 
('C', 'Laura', '(11)1111-1111', 'laura@email.com', 
'senha123', 'Rio Grande do Sul')

insert into Usuarios 
(TipoCliente, NomeCliente, TelefoneCliente, 
EmailCliente, SenhaCliente,Endereco)
VALUES 
('C', 'Tais', '(22)0000-0000', 'tais@email.com', 
'senha123', 'S�o Paulo')


select *
from Usuarios;

insert into Produtos
(NomeProduto, CategoriaProduto, DescricaoProduto, ValorProduto)
values
('Pizza Pequena Tradicional', 'Pizza Tradicional', 'Pizza para at� uma pessoa', 18.90)

insert into Produtos
(NomeProduto, CategoriaProduto, DescricaoProduto, ValorProduto)
values
('Pizza M�dia Tradicional', 'Pizza Tradicional', 'Pizza para at� 3 pessoas', 49.90)

insert into Produtos
(NomeProduto, CategoriaProduto, DescricaoProduto, ValorProduto)
values
('Pizza Grande Tradicional', 'Pizza Tradicional', 'Pizza para at� 5 pessoas', 65.00)


select *
from Produtos;

INSERT INTO Entrega
(NomeMotoboy, VeiculoMotoboy, TelefoneMotoboy, 
ValorEntrega,ValorMotoboy)
VALUES
('Elenilson', 'Honda Biz', '(33)0000-0000',
10.00, 0.10)


select *
from Entrega;

INSERT INTO Carrinho(Observacao)
VALUES ('Sem Cebola');

INSERT INTO Carrinho(Observacao)
VALUES ('Sem gl�tem, sem borda')

INSERT INTO Carrinho(Observacao)
VALUES ('Sou alergica a queijo, fa�a com massa bem assada e escreva uma mensagem na caixa')


select *
from Carrinho;

INSERT INTO Vendas
(TempoVenda, StatusVenda, DataVenda, 
Preco, TipoVenda, idCliente, idEntrega, idCarrinho)
VALUES
('20:00:00', 'Feita', '22-02-2022', 50, 'E', 1,1,1)

INSERT INTO Vendas
(TempoVenda, StatusVenda, DataVenda, 
Preco, TipoVenda, idCliente, idEntrega, idCarrinho)
VALUES
('20:30:00', 'Pendente', '22-02-2022', 50, 'L', 1,1,1)

INSERT INTO Vendas
(TempoVenda, StatusVenda, DataVenda, 
Preco, TipoVenda, idCliente, idEntrega, idCarrinho)
VALUES
('21:00:00', 'Cancelada', '22-02-2022', 50, 'E', 1,1,1)

SELECT *
FROM Vendas;

INSERT INTO CarrinhoProduto
(IdCarrinho, IdProduto, QuantidadePC, Sabores)
VALUES
(1,1, 3, 'Frango com Catupiry')

INSERT INTO CarrinhoProduto
(IdCarrinho, IdProduto, QuantidadePC, Sabores)
VALUES
(1,2, 1, 'Frango com Calabresa')

INSERT INTO CarrinhoProduto
(IdCarrinho, IdProduto, QuantidadePC, Sabores)
VALUES
(1,3, 1, 'Mussarela')

SELECT *
FROM CarrinhoProduto;