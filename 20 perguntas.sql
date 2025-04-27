-- 1. Liste os músicos de uma orquestra específica
SELECT m.nome
FROM Musicos m
JOIN Musicos_Orquestras mo ON m.id_musico = mo.id_musico
WHERE mo.id_orquestra = 1;

-- 2. Orquestras em que um músico específico atuou
SELECT o.nome
FROM Orquestras o
JOIN Musicos_Orquestras mo ON o.id_orquestra = mo.id_orquestra
WHERE mo.id_musico = 2;

-- 3. Sinfonias compostas por um compositor específico
SELECT nome, data_criacao
FROM Sinfonias
WHERE compositor = 'Mozart';

-- 4. Funções dos músicos em uma orquestra
SELECT DISTINCT f.nome_funcao
FROM Funcoes_Musicos f
JOIN Musicos m ON f.id_funcao = m.id_musico
JOIN Musicos_Orquestras mo ON m.id_musico = mo.id_musico
WHERE mo.id_orquestra = 3;

-- 5. Músicos brasileiros que participaram de orquestras estrangeiras
SELECT m.nome
FROM Musicos m
JOIN Musicos_Orquestras mo ON m.id_musico = mo.id_musico
JOIN Orquestras o ON mo.id_orquestra = o.id_orquestra
WHERE m.nacionalidade = 'Brasil' AND o.cidade <> 'Brasil';

-- 6. Instrumentos tocados em sinfonias de Beethoven
SELECT DISTINCT i.nome
FROM Instrumentos i
WHERE i.tipo IN (
    SELECT tipo FROM Sinfonias WHERE compositor = 'Beethoven'
);

-- 7. Orquestra com mais músicos
SELECT o.nome
FROM Orquestras o
JOIN Musicos_Orquestras mo ON o.id_orquestra = mo.id_orquestra
GROUP BY o.nome
ORDER BY COUNT(mo.id_musico) DESC
LIMIT 1;

-- 8. Músicos que atuaram em mais de uma orquestra
SELECT m.nome
FROM Musicos m
JOIN Musicos_Orquestras mo ON m.id_musico = mo.id_musico
GROUP BY m.nome
HAVING COUNT(mo.id_orquestra) > 1;

-- 9. Sinfonias apresentadas por mais de 3 orquestras
SELECT s.nome
FROM Sinfonias s
JOIN Musicos_Orquestras mo ON s.id_sinfonia = mo.id_orquestra
GROUP BY s.nome
HAVING COUNT(mo.id_orquestra) > 3;

-- 10. Músicos com múltiplas funções
SELECT m.nome
FROM Musicos m
JOIN Funcoes_Musicos f ON m.id_musico = f.id_funcao
GROUP BY m.nome
HAVING COUNT(f.id_funcao) > 1;

-- 11. Instrumentos de músicos alemães
SELECT i.nome
FROM Instrumentos i
JOIN Musicos m ON i.id_instrumento = m.id_musico
WHERE m.nacionalidade = 'Alemanha';

-- 12. Músicos nascidos antes de 1980
SELECT nome
FROM Musicos
WHERE data_nascimento < '1980-01-01';

-- 13. Sinfonias do século XIX
SELECT nome
FROM Sinfonias
WHERE data_criacao BETWEEN '1800-01-01' AND '1899-12-31';

-- 14. Orquestras fundadas antes de 1900
SELECT nome
FROM Orquestras
WHERE data_fundacao < '1900-01-01';

-- 15. Músicos que atuaram como regentes em 2024
SELECT m.nome
FROM Musicos m
JOIN Funcoes_Musicos f ON m.id_musico = f.id_funcao
JOIN Musicos_Orquestras mo ON m.id_musico = mo.id_musico
WHERE f.nome_funcao = 'Regente' AND mo.data_inicio LIKE '2024%';

-- 16. Instrumentos de corda em sinfonias de Mahler
SELECT DISTINCT i.nome
FROM Instrumentos i
WHERE i.tipo = 'Corda' AND i.nome IN (
    SELECT tipo FROM Sinfonias WHERE compositor = 'Mahler'
);

-- 17. Músicos na estreia de uma sinfonia
SELECT m.nome
FROM Musicos m
JOIN Musicos_Orquestras mo ON m.id_musico = mo.id_musico
JOIN Sinfonias s ON mo.id_orquestra = s.id_sinfonia
WHERE mo.data_inicio = s.data_criacao;

-- 18. Nacionalidades dos músicos em uma orquestra específica
SELECT DISTINCT m.nacionalidade
FROM Musicos m
JOIN Musicos_Orquestras mo ON m.id_musico = mo.id_musico
WHERE mo.id_orquestra = 4;

-- 19. Quantidade de sinfonias por compositor
SELECT compositor, COUNT(*) AS total_sinfonias
FROM Sinfonias
GROUP BY compositor;

-- 20. Quantidade de músicos em cada orquestra
SELECT o.nome, COUNT(mo.id_musico) AS total_musicos
FROM Orquestras o
JOIN Musicos_Orquestras mo ON o.id_orquestra = mo.id_orquestra
GROUP BY o.nome;