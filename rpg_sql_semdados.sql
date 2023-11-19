CREATE TABLE Hab_Raca (
    nomeRacaPertence VARCHAR(60) NOT NULL,
    nomeHabRaca VARCHAR(60) NOT NULL PRIMARY KEY,
    descricaoHabRaca VARCHAR(600) NOT NULL
);

CREATE TABLE Racas (
    nomeRaca VARCHAR(40) NOT NULL PRIMARY KEY,
    modAtributo VARCHAR(100) NOT NULL,
    nomeHabRaca VARCHAR(60),
    FOREIGN KEY (nomeHabRaca) REFERENCES Hab_Raca (nomeHabRaca)
);

CREATE TABLE Origens (
    nomeOrigem VARCHAR(40) NOT NULL PRIMARY KEY,
    itens VARCHAR(200) NOT NULL,
    beneficios VARCHAR(200) NOT NULL,
    nomeHabOrigem VARCHAR(60) NOT NULL,
    descricaoHabOrigem VARCHAR(600) NOT NULL
);

CREATE TABLE Hab_Classes (
    nomeHabClasse VARCHAR(40) NOT NULL PRIMARY KEY,
    nomeClassePertence VARCHAR(60) NOT NULL,
    preRequisito VARCHAR(100),
    descricaoHabClasse VARCHAR(1200) NOT NULL
);

CREATE TABLE Poderes_Classes (
    nomePoderClasse VARCHAR(40) NOT NULL PRIMARY KEY,
    nomeClassePertence VARCHAR(60) NOT NULL,
    preRequisito VARCHAR(100),
    descricaoPoderClasse VARCHAR(1000) NOT NULL
);

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

CREATE TABLE Personagem (
    nomePersonagem VARCHAR(40) NOT NULL PRIMARY KEY,
    nivelPersonagem VARCHAR(2) NOT NULL,
    atrFor INT NOT NULL,
    atrDes INT NOT NULL,
    atrCons INT NOT NULL,
    atrInt INT NOT NULL,
    atrSab INT NOT NULL,
    atrCar INT NOT NULL,
    nomeRaca VARCHAR(40),
    nomeOrigem VARCHAR(40),
    FOREIGN KEY (nomeRaca) REFERENCES Racas (nomeRaca),
    FOREIGN KEY (nomeOrigem) REFERENCES Origens (nomeOrigem)
);

CREATE TABLE Multiclasse (
    nomePersonagem VARCHAR(40),
    nomeClasse VARCHAR(40),
    PRIMARY KEY (nomePersonagem, nomeClasse),
    FOREIGN KEY (nomePersonagem) REFERENCES Personagem (nomePersonagem),
    FOREIGN KEY (nomeClasse) REFERENCES Classes (nomeClasse)
);