-- DDL para Funções (Functions)

-- 1. Função para obter o número total de músicos de uma nacionalidade específica
DELIMITER //
CREATE FUNCTION ObterTotalMusicosPorNacionalidade (nome_nacionalidade VARCHAR(20))
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total_musicos INT;
    SELECT COUNT(*) INTO total_musicos
    FROM Musicos
    WHERE Nacionalidade = nome_nacionalidade;
    RETURN total_musicos;
END //
DELIMITER ;

-- 2. Função para calcular a idade de um músico com base na sua data de nascimento
DELIMITER //
CREATE FUNCTION CalcularIdadeMusico (data_nascimento DATE)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE idade INT;
    SELECT TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) INTO idade;
    RETURN idade;
END //
DELIMITER ;

-- 3. Função para obter o número de concertos em que uma sinfonia específica foi executada
DELIMITER //
CREATE FUNCTION ObterContagemConcertosSinfonia (id_sinfonia INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE contagem_concertos INT;
    SELECT COUNT(*) INTO contagem_concertos
    FROM Concertos
    WHERE id_sinfonia = id_sinfonia;
    RETURN contagem_concertos;
END //
DELIMITER ;

-- 4. Função para obter o número de instrumentos de um tipo específico
DELIMITER //
CREATE FUNCTION ObterContagemInstrumentosPorTipo (tipo_instrumento VARCHAR(20))
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE contagem_instrumentos INT;
    SELECT COUNT(*) INTO contagem_instrumentos
    FROM Instrumentos
    WHERE Tipo = tipo_instrumento;
    RETURN contagem_instrumentos;
END //
DELIMITER ;

-- 5. Função para obter o nome do músico mais antigo no banco de dados
DELIMITER //
CREATE FUNCTION ObterNomeMusicoMaisAntigo()
RETURNS VARCHAR(45)
READS SQL DATA
BEGIN
    DECLARE nome_musico_mais_antigo VARCHAR(45);
    SELECT Nome INTO nome_musico_mais_antigo
    FROM Musicos
    ORDER BY DataNascimento ASC
    LIMIT 1;
    RETURN nome_musico_mais_antigo;
END //
DELIMITER ;

-- 6. Função para obter o número total de músicos em uma orquestra específica
DELIMITER //
CREATE FUNCTION ObterTotalMusicosEmOrquestra (id_orquestra INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total_musicos INT;
    SELECT COUNT(*) INTO total_musicos
    FROM MusicosOrquestras
    WHERE id_orquestra = id_orquestra;
    RETURN total_musicos;
END //
DELIMITER ;

-- Scripts de Teste para Funções

-- Para testar as funções, é necessário que haja dados nas tabelas.
-- Abaixo estão exemplos de inserção de dados para fins de teste.

-- Inserção de dados de exemplo para Musicos
INSERT INTO Musicos (Nome, Identidade, Nacionalidade, DataNascimento) VALUES
('João Silva', '123456789', 'Brasileira', '1980-05-10'),
('Maria Oliveira', '987654321', 'Brasileira', '1992-11-20'),
('Peter Müller', '112233445', 'Alemã', '1975-01-15'),
('Ana Paula', '333444555', 'Portuguesa', '1985-08-01');

-- Inserção de dados de exemplo para Sinfonias
INSERT INTO Sinfonias (Nome, Compositor, DataCriacao) VALUES
('Sinfonia No. 5', 'Ludwig van Beethoven', '1808-12-22'),
('Sinfonia No. 9', 'Ludwig van Beethoven', '1824-05-07'),
('Sinfonia do Novo Mundo', 'Antonín Dvořák', '1893-12-16');

-- Inserção de dados de exemplo para Concertos
INSERT INTO Concertos (id_sinfonia, DataConcerto, Local) VALUES
(1, '2024-07-15', 'Teatro Municipal'),
(1, '2024-08-20', 'Sala São Paulo'),
(2, '2024-09-01', 'Carnegie Hall');

-- Inserção de dados de exemplo para Instrumentos
INSERT INTO Instrumentos (Nome, Tipo) VALUES
('Violino', 'Cordas'),
('Violoncelo', 'Cordas'),
('Flauta', 'Sopros'),
('Trompete', 'Metais'),
('Clarinete', 'Sopros');

-- Inserção de dados de exemplo para Orquestras
INSERT INTO Orquestras (Nome, DataCriacao, Cidade, Pais) VALUES
('Orquestra Sinfônica Brasileira', '1940-07-11', 'Rio de Janeiro', 'Brasil'),
('Filarmônica de Berlim', '1882-05-01', 'Berlim', 'Alemanha');

-- Inserção de dados de exemplo para MusicosOrquestras
INSERT INTO MusicosOrquestras (id_musico, id_orquestra, DataIngresso) VALUES
(1, 1, '2000-01-01'), -- João Silva na OSB
(2, 1, '2010-03-15'), -- Maria Oliveira na OSB
(3, 2, '1995-07-01'); -- Peter Müller na Filarmônica de Berlim

-- Inserção de dados de exemplo para FuncoesMusicos
INSERT INTO FuncoesMusicos (Funcao) VALUES
('Músico'),
('Maestro'),
('Solista');

-- Inserção de dados de exemplo para MusicosConcertos
INSERT INTO MusicosConcertos (id_musico, id_concerto, id_funcao) VALUES
(1, 1, (SELECT id_funcao FROM FuncoesMusicos WHERE Funcao = 'Músico')),
(2, 1, (SELECT id_funcao FROM FuncoesMusicos WHERE Funcao = 'Músico')),
(3, 2, (SELECT id_funcao FROM FuncoesMusicos WHERE Funcao = 'Maestro'));


-- Teste 1: ObterTotalMusicosPorNacionalidade
SELECT ObterTotalMusicosPorNacionalidade('Brasileira') AS TotalMusicosBrasileiros;

-- Teste 2: CalcularIdadeMusico
SELECT CalcularIdadeMusico('1980-05-10') AS IdadeMusicoExemplo;
SELECT CalcularIdadeMusico((SELECT DataNascimento FROM Musicos WHERE Nome = 'João Silva')) AS IdadeJoaoSilva;

-- Teste 3: ObterContagemConcertosSinfonia
SELECT ObterContagemConcertosSinfonia(1) AS ContagemConcertosSinfonia5;

-- Teste 4: ObterContagemInstrumentosPorTipo
SELECT ObterContagemInstrumentosPorTipo('Cordas') AS TotalInstrumentosCordas;

-- Teste 5: ObterNomeMusicoMaisAntigo
SELECT ObterNomeMusicoMaisAntigo() AS MusicoMaisAntigo;

-- Teste 6: ObterTotalMusicosEmOrquestra
SELECT ObterTotalMusicosEmOrquestra(1) AS TotalMusicosOSB;


