-- DDL para Gatilhos (Triggers)

-- 1. Gatilho para atualizar um timestamp 'ultima_atualizacao' na tabela Musicos
-- Primeiro, adicione uma coluna à tabela Musicos para este gatilho.
ALTER TABLE Musicos ADD COLUMN UltimaAtualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

DELIMITER //
CREATE TRIGGER trg_Musicos_AtualizarTimestamp
BEFORE UPDATE ON Musicos
FOR EACH ROW
BEGIN
    SET NEW.UltimaAtualizacao = NOW();
END //
DELIMITER ;

-- 2. Gatilho para impedir que um músico seja excluído se estiver atualmente atribuído a algum concerto
DELIMITER //
CREATE TRIGGER trg_ImpedirExclusaoMusicoSeEmConcerto
BEFORE DELETE ON Musicos
FOR EACH ROW
BEGIN
    DECLARE contagem_concertos INT;
    SELECT COUNT(*) INTO contagem_concertos
    FROM MusicosConcertos
    WHERE id_musico = OLD.id_musico;

    IF contagem_concertos > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possível excluir o músico: ainda está atribuído a um ou mais concertos.';
    END IF;
END //
DELIMITER ;

-- 3. Gatilho para garantir que uma data de concerto não possa estar no passado ao inserir um novo concerto
DELIMITER //
CREATE TRIGGER trg_Concertos_VerificarDataFutura
BEFORE INSERT ON Concertos
FOR EACH ROW
BEGIN
    IF NEW.DataConcerto < CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A data do concerto não pode estar no passado.';
    END IF;
END //
DELIMITER ;

-- 4. Gatilho para atribuir automaticamente uma função padrão (por exemplo, 'Músico') se nenhuma função for especificada ao adicionar um músico a um concerto
-- Primeiro, garanta que a função 'Músico' exista em FuncoesMusicos
INSERT IGNORE INTO FuncoesMusicos (Funcao) VALUES ('Músico');

DELIMITER //
CREATE TRIGGER trg_MusicosConcertos_FuncaoPadrao
BEFORE INSERT ON MusicosConcertos
FOR EACH ROW
BEGIN
    IF NEW.id_funcao IS NULL THEN
        SELECT id_funcao INTO NEW.id_funcao FROM FuncoesMusicos WHERE Funcao = 'Músico';
    END IF;
END //
DELIMITER ;

-- 5. Gatilho para registrar alterações nos nomes das orquestras em uma tabela de auditoria
-- Primeiro, crie uma tabela de auditoria.
CREATE TABLE Auditoria_Orquestras_Nome_Alteracao (
    id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
    id_orquestra INT,
    NomeAntigo VARCHAR(45),
    NomeNovo VARCHAR(45),
    DataAlteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER trg_Orquestras_RegistrarAlteracaoNome
AFTER UPDATE ON Orquestras
FOR EACH ROW
BEGIN
    IF OLD.Nome <> NEW.Nome THEN
        INSERT INTO Auditoria_Orquestras_Nome_Alteracao (id_orquestra, NomeAntigo, NomeNovo)
        VALUES (OLD.id_orquestra, OLD.Nome, NEW.Nome);
    END IF;
END //
DELIMITER ;

-- 6. Gatilho para impedir que uma sinfonia seja excluída se for referenciada em algum concerto
DELIMITER //
CREATE TRIGGER trg_ImpedirExclusaoSinfoniaSeReferenciada
BEFORE DELETE ON Sinfonias
FOR EACH ROW
BEGIN
    DECLARE contagem_concertos INT;
    SELECT COUNT(*) INTO contagem_concertos
    FROM Concertos
    WHERE id_sinfonia = OLD.id_sinfonia;

    IF contagem_concertos > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possível excluir a sinfonia: ela é referenciada em um ou mais concertos.';
    END IF;
END //
DELIMITER ;

-- Scripts de Teste para Gatilhos

-- Teste 1: trg_Musicos_AtualizarTimestamp
-- Atualize o nome de um músico e observe a alteração do timestamp UltimaAtualizacao.
UPDATE Musicos
SET Nome = 'João Pedro Silva'
WHERE id_musico = 1;

SELECT id_musico, Nome, UltimaAtualizacao FROM Musicos WHERE id_musico = 1;

-- Teste 2: trg_ImpedirExclusaoMusicoSeEmConcerto
-- Tente excluir um músico que está em um concerto (deve falhar).
-- Certifique-se de que o Músico 1 esteja vinculado a um concerto em MusicosConcertos
-- (Se você já executou a inserção de dados de teste acima, ele já estará ligado ao Concero 1)
-- INSERT INTO MusicosConcertos (id_musico, id_concerto, id_funcao) VALUES (1, 1, (SELECT id_funcao FROM FuncoesMusicos WHERE Funcao = 'Músico'));

DELETE FROM Musicos WHERE id_musico = 1; -- Isso deve acionar a mensagem de erro.

-- Agora, exclua um músico que NÃO esteja em nenhum concerto (deve ter sucesso).
-- Assumindo que o id_musico 4 é o "Ana Paula" inserido nos dados de teste.
DELETE FROM Musicos WHERE id_musico = 4;

-- Teste 3: trg_Concertos_VerificarDataFutura
-- Tente inserir um concerto com uma data passada (deve falhar).
INSERT INTO Concertos (id_sinfonia, DataConcerto, Local) VALUES
(1, '2023-01-01', 'Local Antigo'); -- Isso deve acionar a mensagem de erro.

-- Insira um concerto com uma data futura (deve ter sucesso).
INSERT INTO Concertos (id_sinfonia, DataConcerto, Local) VALUES
(1, '2025-12-31', 'Novo Local');

-- Teste 4: trg_MusicosConcertos_FuncaoPadrao
-- Insira um músico em um concerto sem especificar uma função (deve assumir 'Músico' por padrão).
-- O id_musico 3 é "Peter Müller", o id_concerto 3 é "Carnegie Hall".
INSERT INTO MusicosConcertos (id_musico, id_concerto, id_funcao) VALUES
(3, 3, NULL); -- id_funcao é NULL

-- Verifique o valor inserido
SELECT mc.id_musico_concerto, m.Nome AS Musico, c.Local AS Concerto, f.Funcao AS FuncaoAtribuida
FROM MusicosConcertos mc
JOIN Musicos m ON mc.id_musico = m.id_musico
JOIN Concertos c ON mc.id_concerto = c.id_concerto
JOIN FuncoesMusicos f ON mc.id_funcao = f.id_funcao
WHERE mc.id_musico = 3 AND mc.id_concerto = 3;


-- Teste 5: trg_Orquestras_RegistrarAlteracaoNome
-- Atualize o nome de uma orquestra e verifique a tabela de auditoria.
UPDATE Orquestras
SET Nome = 'Orquestra Sinfônica do Brasil'
WHERE id_orquestra = 1;

SELECT * FROM Auditoria_Orquestras_Nome_Alteracao;

-- Teste 6: trg_ImpedirExclusaoSinfoniaSeReferenciada
-- Tente excluir uma sinfonia que está vinculada a um concerto (deve falhar).
DELETE FROM Sinfonias WHERE id_sinfonia = 1; -- Isso deve acionar a mensagem de erro.

-- Agora, insira uma nova sinfonia não vinculada a nenhum concerto e tente excluí-la (deve ter sucesso).
INSERT INTO Sinfonias (Nome, Compositor, DataCriacao) VALUES
('Sinfonia No. 1', 'Johannes Brahms', '1876-11-04');

DELETE FROM Sinfonias WHERE id_sinfonia = 4; -- Assumindo que id_sinfonia 4 é a recém-inserida.