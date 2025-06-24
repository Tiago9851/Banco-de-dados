 PROCEDURE 1: Adiciona novo músico, instrumento e habilidade
DELIMITER //
CREATE PROCEDURE AddMusicoInstrumento(
    IN nome VARCHAR(45), IN identidade VARCHAR(20), IN nacionalidade VARCHAR(20), IN nascimento DATE,
    IN instrumento VARCHAR(45), IN tipo VARCHAR(20)
)
BEGIN
    DECLARE novo_id_musico INT;
    DECLARE novo_id_instrumento INT;

    INSERT INTO Musicos(Nome, Identidade, Nacionalidade, DataNascimento)
    VALUES (nome, identidade, nacionalidade, nascimento);

    SET novo_id_musico = LAST_INSERT_ID();

    INSERT INTO Instrumentos(Nome, Tipo) VALUES (instrumento, tipo);
    SET novo_id_instrumento = LAST_INSERT_ID();

    INSERT INTO HabilidadesMusicos(id_musico, id_instrumento)
    VALUES (novo_id_musico, novo_id_instrumento);
END;
//
DELIMITER ;
-- TESTE:
CALL AddMusicoInstrumento('João das Cordas', 'ID1234', 'Brasileiro', '1990-05-20', 'Violão', 'Cordas');

-- PROCEDURE 2: Cadastrar nova orquestra com músico maestro
DELIMITER //
CREATE PROCEDURE CriarOrquestraComMaestro(
    IN nome_orq VARCHAR(45), IN cidade VARCHAR(45), IN pais VARCHAR(45),
    IN nome_musico VARCHAR(45), IN identidade VARCHAR(20), IN nacionalidade VARCHAR(20), IN nascimento DATE
)
BEGIN
    DECLARE id_orq INT;
    DECLARE id_musico INT;

    INSERT INTO Orquestras(Nome, DataCriacao, Cidade, Pais)
    VALUES (nome_orq, CURDATE(), cidade, pais);
    SET id_orq = LAST_INSERT_ID();

    INSERT INTO Musicos(Nome, Identidade, Nacionalidade, DataNascimento)
    VALUES (nome_musico, identidade, nacionalidade, nascimento);
    SET id_musico = LAST_INSERT_ID();

    INSERT INTO MusicosOrquestras(id_musico, id_orquestra, DataIngresso)
    VALUES (id_musico, id_orq, CURDATE());
END;
//
DELIMITER ;

-- TESTE:
CALL CriarOrquestraComMaestro('Filarmônica Recife', 'Recife', 'Brasil', 'Carlos Maestro', 'ID4567', 'Brasileiro', '1975-10-10');

-- PROCEDURE 3: Relatório de músicos por orquestra
DELIMITER //
CREATE PROCEDURE RelatorioMusicosPorOrquestra(IN orquestra_nome VARCHAR(45))
BEGIN
    SELECT M.Nome, M.Nacionalidade, MO.DataIngresso
    FROM Musicos M
    JOIN MusicosOrquestras MO ON M.id_musico = MO.id_musico
    JOIN Orquestras O ON O.id_orquestra = MO.id_orquestra
    WHERE O.Nome = orquestra_nome;
END;
//
DELIMITER ;

-- TESTE:
CALL RelatorioMusicosPorOrquestra('Filarmônica Recife');

-- PROCEDURE 4: Excluir músico e limpar dependências
DELIMITER //
CREATE PROCEDURE ExcluirMusicoCompleto(IN id_musico INT)
BEGIN
    DELETE FROM MusicosConcertos WHERE id_musico = id_musico;
    DELETE FROM HabilidadesMusicos WHERE id_musico = id_musico;
    DELETE FROM MusicosOrquestras WHERE id_musico = id_musico;
    DELETE FROM Musicos WHERE id_musico = id_musico;
END;
//
DELIMITER ;

-- TESTE:
CALL ExcluirMusicoCompleto(1);

-- PROCEDURE 5: Agendar novo concerto com músicos
DELIMITER //
CREATE PROCEDURE AgendarConcertoComMusicos(
    IN sinfonia_id INT, IN data DATE, IN local VARCHAR(45),
    IN musico1 INT, IN funcao1 INT,
    IN musico2 INT, IN funcao2 INT
)
BEGIN
    DECLARE id_concerto INT;
    
    INSERT INTO Concertos(id_sinfonia, DataConcerto, Local)
    VALUES (sinfonia_id, data, local);
    SET id_concerto = LAST_INSERT_ID();

    INSERT INTO MusicosConcertos(id_musico, id_concerto, id_funcao)
    VALUES (musico1, id_concerto, funcao1),
           (musico2, id_concerto, funcao2);
END;
//
DELIMITER ;

-- TESTE:
CALL AgendarConcertoComMusicos(1, '2025-07-15', 'Teatro Santa Isabel', 2, 1, 3, 2);

-- PROCEDURE 6: Listar instrumentos por tipo
DELIMITER //
CREATE PROCEDURE ListarInstrumentosPorTipo(IN tipo VARCHAR(20))
BEGIN
    SELECT * FROM Instrumentos
    WHERE Tipo = tipo
    ORDER BY Nome;
END;
//
DELIMITER ;

-- TESTE:
CALL ListarInstrumentosPorTipo('Cordas');





