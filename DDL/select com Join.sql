-- 1. Lista de músicos e suas respectivas orquestras
SELECT m.nome AS musico, o.nome AS orquestra
FROM musicos m
JOIN musicos_orquestras mo ON m.id_musico = mo.id_musico
JOIN orquestras o ON mo.id_orquestra = o.id_orquestra;

-- 2. Lista de sinfonias e seus compositores
SELECT nome, compositor
FROM sinfonias;

-- 3. Lista de músicos que participaram de uma determinada orquestra
SELECT m.nome AS musico
FROM musicos m
JOIN musicos_orquestras mo ON m.id_musico = mo.id_musico
WHERE mo.id_orquestra = 1;

-- 4. Lista de orquestras fundadas após 2000
SELECT nome, data_fundacao
FROM orquestras
WHERE data_fundacao > '2000-01-01';

-- 5. Lista de músicos de uma determinada nacionalidade
SELECT nome
FROM musicos
WHERE nacionalidade = 'Brasileira';

-- 6. Lista de sinfonias criadas por um determinado compositor
SELECT nome
FROM sinfonias
WHERE compositor = 'Beethoven';

-- 7. Lista de orquestras e suas respectivas idades
SELECT nome, idade
FROM orquestras;

-- 8. Lista de músicos e suas identidades
SELECT nome, identidade
FROM musicos;

-- 9. Lista de sinfonias e suas datas de criação
SELECT nome, data_criacao
FROM sinfonias;

-- 10. Lista de músicos que começaram em uma determinada data
SELECT m.nome
FROM musicos m
JOIN musicos_orquestras mo ON m.id_musico = mo.id_musico
WHERE mo.data_inicio = '2022-01-01';

-- 11. Lista de orquestras e seus músicos
SELECT o.nome AS orquestra, m.nome AS musico
FROM orquestras o
JOIN musicos_orquestras mo ON o.id_orquestra = mo.id_orquestra
JOIN musicos m ON mo.id_musico = m.id_musico;

-- 12. Lista de sinfonias e seus compositores, ordenadas por data de criação
SELECT nome, compositor, data_criacao
FROM sinfonias
ORDER BY data_criacao;

-- 13. Lista de músicos e suas orquestras, ordenadas por nome de músico
SELECT m.nome AS musico, o.nome AS orquestra
FROM musicos m
JOIN musicos_orquestras mo ON m.id_musico = mo.id_musico
JOIN orquestras o ON mo.id_orquestra = o.id_orquestra
ORDER BY m.nome;

-- 14. Lista de orquestras e suas idades, ordenadas por idade
SELECT nome, idade
FROM orquestras
ORDER BY idade;

-- 15. Lista de músicos e suas nacionalidades, ordenadas por nacionalidade
SELECT nome, nacionalidade
FROM musicos
ORDER BY nacionalidade;

-- 16. Lista de sinfonias e seus compositores, ordenadas por compositor
SELECT nome, compositor
FROM sinfonias
ORDER BY compositor;

-- 17. Lista de orquestras e suas datas de fundação, ordenadas por data de fundação
SELECT nome, data_fundacao
FROM orquestras
ORDER BY data_fundacao;

-- 18. Lista de músicos e suas identidades, ordenadas por identidade
SELECT nome, identidade
FROM musicos
ORDER BY identidade;

-- 19. Lista de sinfonias e suas datas de criação, ordenadas por data de criação
SELECT nome, data_criacao
FROM sinfonias
ORDER BY data_criacao;

-- 20. Lista de músicos que começaram em uma determinada data, ordenadas por nome de músico
SELECT m.nome
FROM musicos m
JOIN musicos_orquestras mo ON m.id_musico = mo.id_musico
WHERE mo.data_inicio = '2022-01-01'
ORDER BY m.nome;