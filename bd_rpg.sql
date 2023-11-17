-- Define o mecanismo de armazenamento para tabelas InnoDB
SET default_storage_engine = InnoDB;

-- Remove tabelas se existirem
DROP TABLE IF EXISTS Personagem;
DROP TABLE IF EXISTS Racas;
DROP TABLE IF EXISTS Hab_Raca;
DROP TABLE IF EXISTS Origens;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Hab_Classes;
DROP TABLE IF EXISTS Poderes_Classes;

-- Criação da tabela Hab_Raca
CREATE TABLE Hab_Raca (
    nomeRacaPertence VARCHAR(60) NOT NULL,
    nomeHabRaca VARCHAR(60) NOT NULL PRIMARY KEY,
    descricaoHabRaca VARCHAR(600) NOT NULL
);

-- Criação da tabela Racas
CREATE TABLE Racas (
    nomeRaca VARCHAR(40) NOT NULL PRIMARY KEY,
    modAtributo VARCHAR(100) NOT NULL,
    nomeHabRaca VARCHAR(60) NOT NULL,
    FOREIGN KEY (nomeHabRaca) REFERENCES Hab_Raca(nomeHabRaca)
);

-- Criação da tabela Origens
CREATE TABLE Origens (
    nomeOrigem VARCHAR(40) NOT NULL PRIMARY KEY,
    itens VARCHAR(200) NOT NULL,
    beneficios VARCHAR(200) NOT NULL,
    nomeHabOrigem VARCHAR(60) NOT NULL,
    descricaoHabOrigem VARCHAR(600) NOT NULL
);

-- Criação da tabela Hab_Classes
CREATE TABLE Hab_Classes (
    nomeHabClasse VARCHAR(40) NOT NULL PRIMARY KEY,
    nomeClassePertence VARCHAR(60) NOT NULL,
    preRequisito VARCHAR(100),
    descricaoHabClasse VARCHAR(1200) NOT NULL
);

-- Criação da tabela Poderes_Classes
CREATE TABLE Poderes_Classes (
    nomePoderClasse VARCHAR(40) NOT NULL PRIMARY KEY,
    nomeClassePertence VARCHAR(60) NOT NULL,
    preRequisito VARCHAR(100),
    descricaoPoderClasse VARCHAR(1000) NOT NULL
);

-- Criação da tabela Classes
CREATE TABLE Classes (
    nomeClasse VARCHAR(40) NOT NULL PRIMARY KEY,
    pontosVida VARCHAR(120) NOT NULL,
    pontosMana VARCHAR(20) NOT NULL,
    pericias VARCHAR(450) NOT NULL,
    proeficiencias VARCHAR(45) NOT NULL,
    nomeHabClasse VARCHAR(60) NOT NULL,
    nomePoderClasse VARCHAR(60) NOT NULL,
    FOREIGN KEY (nomeHabClasse) REFERENCES Hab_Classes(nomeHabClasse),
    FOREIGN KEY (nomePoderClasse) REFERENCES Poderes_Classes(nomePoderClasse)
);

-- Criação da tabela Personagem
CREATE TABLE Personagem (
    nomePersonagem VARCHAR(40) NOT NULL PRIMARY KEY,
    nivelPersonagem VARCHAR(2) NOT NULL,
    atrFor INT NOT NULL,
    atrDes INT NOT NULL,
    atrCons INT NOT NULL,
    atrInt INT NOT NULL,
    atrSab INT NOT NULL,
    atrCar INT NOT NULL,
    nomeRaca VARCHAR(40) NOT NULL,
    nomeOrigem VARCHAR(40) NOT NULL,
    nomeClasse VARCHAR(40) NOT NULL,
    FOREIGN KEY (nomeRaca) REFERENCES Racas(nomeRaca),
    FOREIGN KEY (nomeOrigem) REFERENCES Origens(nomeOrigem),
    FOREIGN KEY (nomeClasse) REFERENCES Classes(nomeClasse)
);

