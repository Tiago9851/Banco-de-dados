-- 11. Deletar um músico específico
DELETE FROM Musicos WHERE id_musico = 8;

-- 12. Remover uma sinfonia do banco de dados
DELETE FROM Sinfonias WHERE id_sinfonia = 9;

-- 13. Deletar uma orquestra específica
DELETE FROM Orquestras WHERE id_orquestra = 10;

-- 14. Remover um instrumento da tabela
DELETE FROM Instrumentos WHERE id_instrumento = 5;

-- 15. Deletar uma função de músico
DELETE FROM Funcoes_Musicos WHERE id_funcao = 4;

-- 16. Deletar o vínculo de um músico com uma orquestra
DELETE FROM Musicos_Orquestras WHERE id_musico = 2 AND id_orquestra = 3;

-- 17. Remover todos os músicos brasileiros
DELETE FROM Musicos WHERE nacionalidade = 'Brasil';

-- 18. Remover sinfonias compostas antes de 1800
DELETE FROM Sinfonias WHERE ano_criacao < '1800-01-01';

-- 19. Deletar instrumentos do tipo "Percussão"
DELETE FROM Instrumentos WHERE tipo = 'Percussão';

-- 20. Remover músicos sem função atribuída
DELETE FROM Musicos WHERE id_musico NOT IN (SELECT id_funcao FROM Funcoes_Musicos);