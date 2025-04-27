-- View 1: Músicos de uma orquestra específica
CREATE VIEW View_Musicos_Orquestra AS
SELECT m.nome AS Nome_Musico, o.nome AS Nome_Orquestra
FROM Musicos m
JOIN Musicos_Orquestras mo ON m.id_musico = mo.id_musico
JOIN Orquestras o ON mo.id_orquestra = o.id_orquestra;

-- View 2: Orquestras de cada músico
CREATE VIEW View_Orquestras_Musicos AS
SELECT m.nome AS Nome_Musico, o.nome AS Nome_Orquestra
FROM Musicos m
JOIN Musicos_Orquestras mo ON m.id_musico = mo.id_musico
JOIN Orquestras o ON mo.id_orquestra = o.id_orquestra;

-- View 3: Sinfonias por compositor
CREATE VIEW View_Sinfonias_Compositor AS
SELECT nome AS Nome_Sinfonia, compositor AS Compositor, ano_criacao AS Ano_Criacao
FROM Sinfonias;

-- View 4: Funções dos músicos por orquestra
CREATE VIEW View_Funcoes_Musicos AS
SELECT o.nome AS Nome_Orquestra, m.nome AS Nome_Musico, f.nome_funcao AS Funcao
FROM Funcoes_Musicos f
JOIN Musicos m ON f.id_funcao = m.id_musico
JOIN Musicos_Orquestras mo ON m.id_musico = mo.id_musico
JOIN Orquestras o ON mo.id_orquestra = o.id_orquestra;

-- View 5: Músicos brasileiros em orquestras internacionais
CREATE VIEW View_Musicos_Brasileiros_Internacionais AS
SELECT m.nome AS Nome_Musico, o.nome AS Nome_Orquestra, o.cidade AS Cidade_Orquestra
FROM Musicos m
JOIN Musicos_Orquestras mo ON m.id_musico = mo.id_musico
JOIN Orquestras o ON mo.id_orquestra = o.id_orquestra
WHERE m.nacionalidade = 'Brasil' AND o.cidade <> 'Brasil';

-- View 6: Instrumentos tocados por músicos
CREATE VIEW View_Instrumentos_Musicos AS
SELECT m.nome AS Nome_Musico, i.nome AS Nome_Instrumento, i.tipo AS Tipo
FROM Musicos m
JOIN Instrumentos i ON m.id_musico = i.id_instrumento;

-- View 7: Orquestras fundadas antes de 1900
CREATE VIEW View_Orquestras_Historicas AS
SELECT nome AS Nome_Orquestra, cidade AS Cidade, data_fundacao AS Data_Fundacao
FROM Orquestras
WHERE data_fundacao < '1900-01-01';

-- View 8: Sinfonias apresentadas por mais de três orquestras
CREATE VIEW View_Sinfonias_Populares AS
SELECT s.nome AS Nome_Sinfonia, COUNT(mo.id_orquestra) AS Total_Orquestras
FROM Sinfonias s
JOIN Musicos_Orquestras mo ON s.id_sinfonia = mo.id_orquestra
GROUP BY s.nome
HAVING COUNT(mo.id_orquestra) > 3;

-- View 9: Regentes por orquestra
CREATE VIEW View_Regentes_Orquestra AS
SELECT o.nome AS Nome_Orquestra, m.nome AS Nome_Musico
FROM Musicos m
JOIN Funcoes_Musicos f ON m.id_musico = f.id_funcao
JOIN Musicos_Orquestras mo ON m.id_musico = mo.id_musico
JOIN Orquestras o ON mo.id_orquestra = o.id_orquestra
WHERE f.nome_funcao = 'Regente';

-- View 10: Total de músicos por orquestra
CREATE VIEW View_Total_Musicos_Orquestra AS
SELECT o.nome AS Nome_Orquestra, COUNT(mo.id_musico) AS Total_Musicos
FROM Orquestras o
JOIN Musicos_Orquestras mo ON o.id_orquestra = mo.id_orquestra
GROUP BY o.nome;