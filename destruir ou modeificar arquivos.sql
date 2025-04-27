-- Desabilitar constraints temporariamente (opcional, dependendo do SGBD)
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Excluir todas as views
DROP VIEW IF EXISTS View_Musicos_Orquestra;
DROP VIEW IF EXISTS View_Orquestras_Musicos;
DROP VIEW IF EXISTS View_Sinfonias_Compositor;
DROP VIEW IF EXISTS View_Funcoes_Musicos;
DROP VIEW IF EXISTS View_Musicos_Brasileiros_Internacionais;
DROP VIEW IF EXISTS View_Instrumentos_Musicos;
DROP VIEW IF EXISTS View_Orquestras_Historicas;
DROP VIEW IF EXISTS View_Sinfonias_Populares;
DROP VIEW IF EXISTS View_Regentes_Orquestra;
DROP VIEW IF EXISTS View_Total_Musicos_Orquestra;

-- 2. Excluir todas as tabelas
DROP TABLE IF EXISTS Musicos_Orquestras;
DROP TABLE IF EXISTS Funcoes_Musicos;
DROP TABLE IF EXISTS Instrumentos;
DROP TABLE IF EXISTS Equipamentos; -- Caso "Instrumentos" tenha sido renomeada
DROP TABLE IF EXISTS Orquestras;
DROP TABLE IF EXISTS Sinfonias;
DROP TABLE IF EXISTS Musicos;

-- 3. Excluir procedimentos armazenados (se existirem)
DROP PROCEDURE IF EXISTS exemplo_procedimento1;
DROP PROCEDURE IF EXISTS exemplo_procedimento2;

-- 4. Excluir funções armazenadas (se existirem)
DROP FUNCTION IF EXISTS exemplo_funcao1;
DROP FUNCTION IF EXISTS exemplo_funcao2;

-- 5. Limpar outras dependências (índices, triggers, etc.)
DROP TRIGGER IF EXISTS exemplo_trigger1;
DROP TRIGGER IF EXISTS exemplo_trigger2;

-- Reativar constraints (opcional, dependendo do SGBD)
SET FOREIGN_KEY_CHECKS = 1;