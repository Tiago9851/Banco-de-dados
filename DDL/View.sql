-- 1. View de músicos e suas orquestras
CREATE VIEW musicos_orquestras_view AS
SELECT m.nome AS musico, o.nome AS orquestra
FROM musicos m
JOIN musicos_orquestras mo ON m.id_musico = mo.id_musico
JOIN orquestras o ON mo.id_orquestra = o.id_orquestra;

-- 2. View de sinfonias e seus compositores
CREATE VIEW sinfonias_compositores_view AS
SELECT nome, compositor
FROM sinfonias;

-- 3. View de músicos de uma determinada orquestra
CREATE VIEW musicos_orquestra_view AS
SELECT m.nome AS musico
FROM musicos m
JOIN musicos_orquestras mo ON m.id_musico = mo.id_musico
WHERE mo.id_orquestra = 1;

-- 4. View de orquestras fundadas após 2000
CREATE VIEW orquestras_fundadas_apos_2000_view AS
SELECT nome, data_fundacao
FROM orquestras
WHERE data_fundacao > '2000-01-01';

-- 5. View de músicos de uma determinada nacionalidade
CREATE VIEW musicos_nacionalidade_view AS
SELECT nome
FROM musicos
WHERE nacionalidade = 'Brasileira';

-- 6. View de sinfonias criadas por um determinado compositor
CREATE VIEW sinfonias_compositor_view AS
SELECT nome
FROM sinfonias
WHERE compositor = 'Beethoven';

-- 7. View de orquestras e suas idades
CREATE VIEW orquestras_idades_view AS
SELECT nome, idade
FROM orquestras;

-- 8. View de músicos e suas identidades
CREATE VIEW musicos_identidades_view AS
SELECT nome, identidade
FROM musicos;

-- 9. View de sinfonias e suas datas de criação
CREATE VIEW sinfonias_datas_criacao_view AS
SELECT nome, data_criacao
FROM sinfonias;

-- 10. View de músicos que começaram em uma determinada data
CREATE VIEW musicos_data_inicio_view AS
SELECT m.nome
FROM musicos m
JOIN musicos_orquestras mo ON m.id_musico = mo.id_musico
WHERE mo.data_inicio = '2022-01-01';