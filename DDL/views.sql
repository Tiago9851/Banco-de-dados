-- 1. INNER JOIN, UPPER, ORDER BY
CREATE VIEW vw_MusicosOrquestras_NomeMaiusculo AS
SELECT 
    UPPER(M.nome) AS NomeMusico, 
    O.nome AS NomeOrquestra
FROM 
    Musicos M
INNER JOIN 
    Musicos_Orquestras MO ON M.id_musico = MO.id_musico
INNER JOIN 
    Orquestras O ON MO.id_orquestra = O.id_orquestra
ORDER BY 
    NomeMusico;

-- 2. LEFT JOIN, CONCAT
CREATE VIEW vw_MusicosOrquestras_CidadeConcatenada AS
SELECT 
    M.nome AS NomeMusico,
    CONCAT(O.nome, ' (', O.cidade, ')') AS NomeOrquestraCidade
FROM 
    Musicos M
LEFT JOIN 
    Musicos_Orquestras MO ON M.id_musico = MO.id_musico
LEFT JOIN 
    Orquestras O ON MO.id_orquestra = O.id_orquestra;

-- 3. GROUP BY, COUNT
CREATE VIEW vw_NumeroMusicosPorOrquestra AS
SELECT 
    O.nome AS NomeOrquestra,
    COUNT(MO.id_musico) AS NumeroDeMusicos
FROM 
    Orquestras O
LEFT JOIN 
    Musicos_Orquestras MO ON O.id_orquestra = MO.id_orquestra
GROUP BY 
    O.nome;

-- 4. INNER JOIN, GROUP BY, ORDER BY, COUNT
CREATE VIEW vw_NumeroSinfoniasPorCompositor AS
SELECT 
    S.compositor AS Compositor,
    COUNT(S.id_sinfonia) AS NumeroDeSinfonias
FROM 
    Sinfonias S
GROUP BY 
    S.compositor
ORDER BY 
    NumeroDeSinfonias DESC;

-- 5. LEFT JOIN, UPPER
CREATE VIEW vw_MusicosOrquestras_NomeMusicoMaiusculo AS
SELECT 
    UPPER(M.nome) AS NomeMusico,
    O.nome AS NomeOrquestra
FROM 
    Musicos M
LEFT JOIN 
    Musicos_Orquestras MO ON M.id_musico = MO.id_musico
LEFT JOIN 
    Orquestras O ON MO.id_orquestra = O.id_orquestra;

-- 6. CONCAT, ORDER BY
CREATE VIEW vw_InfoMusico_NomeNacionalidade AS
SELECT 
    CONCAT(nome, ' (', nacionalidade, ')') AS InfoMusico
FROM 
    Musicos
ORDER BY 
    nome;

-- 7. INNER JOIN, GROUP BY, COUNT, ORDER BY
CREATE VIEW vw_NumeroMusicosUnicosPorCidade AS
SELECT 
    O.cidade AS Cidade,
    COUNT(DISTINCT MO.id_musico) AS NumeroDeMusicosUnicos
FROM 
    Orquestras O
INNER JOIN 
    Musicos_Orquestras MO ON O.id_orquestra = MO.id_orquestra
GROUP BY 
    O.cidade
ORDER BY 
    NumeroDeMusicosUnicos DESC;

-- 8. LEFT JOIN, GROUP BY, COUNT
CREATE VIEW vw_NumeroMusicosPorNacionalidade AS
SELECT 
    M.nacionalidade AS Nacionalidade,
    COUNT(M.id_musico) AS NumeroDeMusicos
FROM 
    Musicos M
GROUP BY 
    M.nacionalidade;

-- 9. UPPER, ORDER BY
CREATE VIEW vw_NomesSinfoniasMaiusculas AS
SELECT 
    UPPER(nome) AS NomeSinfonia
FROM 
    Sinfonias
ORDER BY 
    nome;

-- 10. CONCAT, LEFT JOIN
CREATE VIEW vw_InfoMusicoFuncao AS
SELECT 
    CONCAT(M.nome, ' (', F.nome_funcao, ')') AS InfoMusicoFuncao
FROM 
    Musicos M
LEFT JOIN 
    Funcoes_Musicos F ON 1=1;  -- Simulação de relação (adaptar se houver relação real)

-- 11. INNER JOIN, GROUP BY, COUNT, ORDER BY
CREATE VIEW vw_NumeroInstrumentosPorTipo AS
SELECT 
    I.tipo AS TipoInstrumento,
    COUNT(I.id_instrumento) AS NumeroDeInstrumentos
FROM 
    Instrumentos I
GROUP BY 
    I.tipo
ORDER BY 
    NumeroDeInstrumentos DESC;

-- 12. UPPER, LEFT JOIN, ORDER BY
CREATE VIEW vw_OrquestrasMusicos_NomesMaiusculos AS
SELECT 
    UPPER(O.nome) AS NomeOrquestra,
    M.nome AS NomeMusico
FROM 
    Orquestras O
LEFT JOIN 
    Musicos_Orquestras MO ON O.id_orquestra = MO.id_orquestra
LEFT JOIN 
    Musicos M ON MO.id_musico = M.id_musico
ORDER BY 
    NomeOrquestra, NomeMusico;

-- 13. CONCAT, GROUP BY
CREATE VIEW vw_InfoSinfonias_Contagem AS
SELECT 
    CONCAT(S.nome, ' (', S.compositor, ')') AS InfoSinfonia,
    COUNT(*)
FROM 
    Sinfonias S
GROUP BY 
    InfoSinfonia;

-- 14. INNER JOIN, GROUP BY, COUNT, ORDER BY
CREATE VIEW vw_NumeroOrquestrasPorNacionalidade AS
SELECT 
    M.nacionalidade, 
    COUNT(DISTINCT O.id_orquestra)
FROM 
    Musicos M
INNER JOIN 
    Musicos_Orquestras MO ON M.id_musico = MO.id_musico
INNER JOIN 
    Orquestras O ON MO.id_orquestra = O.id_orquestra
GROUP BY 
    M.nacionalidade
ORDER BY 
    COUNT(DISTINCT O.id_orquestra) DESC;

-- 15. UPPER, LEFT JOIN, GROUP BY
CREATE VIEW vw_NumeroOrquestrasPorCidade_Maiuscula AS
SELECT 
    UPPER(O.cidade) AS CidadeOrquestra,
    COUNT(O.id_orquestra) AS NumeroOrquestras
FROM 
    Orquestras O
GROUP BY 
    CidadeOrquestra;

-- 16. CONCAT, ORDER BY
CREATE VIEW vw_InfoInstrumentos AS
SELECT 
    CONCAT(I.nome, ' (', I.tipo, ')') AS InfoInstrumento
FROM 
    Instrumentos I
ORDER BY 
    I.nome;

-- 17. INNER JOIN, GROUP BY, COUNT, ORDER BY
CREATE VIEW vw_NumeroSinfoniasPorCompositor2 AS
SELECT 
    S.compositor,
    COUNT(S.id_sinfonia)
FROM
    Sinfonias S
GROUP BY
    S.compositor
ORDER BY
    COUNT(S.id_sinfonia) DESC;

-- 18. UPPER, LEFT JOIN
CREATE VIEW vw_MusicosOrquestras_NomeMusicoMaiusculo2 AS
SELECT 
    UPPER(M.nome),
    O.nome
FROM 
    Musicos M
LEFT JOIN 
    Musicos_Orquestras MO ON M.id_musico = MO.id_musico
LEFT JOIN 
    Orquestras O ON MO.id_orquestra = O.id_orquestra;

-- 19. CONCAT, GROUP BY, COUNT
CREATE VIEW vw_NumeroMusicosPorOrquestraCidade AS
SELECT 
    CONCAT(O.nome, ' - ', O.cidade),
    COUNT(MO.id_musico)
FROM 
    Orquestras O
LEFT JOIN 
    Musicos_Orquestras MO ON O.id_orquestra = MO.id_orquestra
GROUP BY 
    CONCAT(O.nome, ' - ', O.cidade);

-- 20. INNER JOIN, ORDER BY
CREATE VIEW vw_MusicosOrquestras_Ordenado AS
SELECT 
    M.nome,
    O.nome
FROM 
    Musicos M
INNER JOIN 
    Musicos_Orquestras MO ON M.id_musico = MO.id_musico
INNER JOIN 
    Orquestras O ON MO.id_orquestra = O.id_orquestra
ORDER BY 
    O.nome, M.nome;