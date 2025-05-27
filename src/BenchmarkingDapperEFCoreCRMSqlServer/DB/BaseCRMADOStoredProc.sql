USE master
GO

CREATE DATABASE BaseCRMADOStoredProc
GO

USE BaseCRMADOStoredProc
GO

CREATE TABLE dbo.Empresas(
	IdEmpresa int IDENTITY(1,1) NOT NULL,
	CNPJ char(14) NOT NULL,
	Nome varchar(100) NOT NULL,
	Cidade varchar(50) NOT NULL,
	CONSTRAINT PK_Empresas PRIMARY KEY (IdEmpresa)
)
GO

CREATE TABLE dbo.Contatos(
	IdContato int IDENTITY(1,1) NOT NULL,
	Nome varchar(100) NOT NULL,
	Telefone varchar(20) NOT NULL,
	IdEmpresa int NOT NULL,
	CONSTRAINT PK_Contatos PRIMARY KEY (IdContato),
	CONSTRAINT FK_Contato_Empresa FOREIGN KEY (IdEmpresa) REFERENCES dbo.Empresas(IdEmpresa)
)
GO

CREATE PROCEDURE dbo.InserirEmpresa
	@CNPJ char(14),
	@Nome varchar(100),
	@Cidade varchar(50)
AS
BEGIN
	INSERT INTO dbo.Empresas (CNPJ, Nome, Cidade)
	VALUES (@CNPJ, @Nome, @Cidade);

	-- Retorna o Id gerado
	SELECT SCOPE_IDENTITY() AS IdEmpresa;
END
GO

CREATE PROCEDURE dbo.InserirContato
	@Nome varchar(100),
	@Telefone varchar(20),
	@IdEmpresa int
AS
BEGIN
	INSERT INTO dbo.Contatos (Nome, Telefone, IdEmpresa)
	VALUES (@Nome, @Telefone, @IdEmpresa);

	-- Retorna o Id gerado
	SELECT SCOPE_IDENTITY() AS IdContato;
END
GO

USE master
GO