-- Tabela de Sinfonias
CREATE TABLE Sinfonias (
    id_sinfonia INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    compositor VARCHAR(255),
    data_criacao DATE
);

-- Tabela de Músicos
CREATE TABLE Musicos (
    id_musico INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    identidade VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(100),
    data_nascimento DATE
);

-- Tabela de Orquestras
CREATE TABLE Orquestras (
    id_orquestra INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cidade VARCHAR(100),
    data_fundacao DATE
);

-- Tabela de Instrumentos
CREATE TABLE Instrumentos (
    id_instrumento INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(100)
);

-- Tabela de Funções dos Músicos
CREATE TABLE Funcoes_Musicos (
    id_funcao INT PRIMARY KEY,
    nome_funcao VARCHAR(255) NOT NULL
);

-- Relacionamentos: Um exemplo com Músicos e Orquestras
CREATE TABLE Musicos_Orquestras (
    id_musico INT,
    id_orquestra INT,
    data_inicio DATE,
    PRIMARY KEY (id_musico, id_orquestra),
    FOREIGN KEY (id_musico) REFERENCES Musicos(id_musico),
    FOREIGN KEY (id_orquestra) REFERENCES Orquestras(id_orquestra)
);