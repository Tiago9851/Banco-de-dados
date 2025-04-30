-- 1. INNER JOIN, UPPER, ORDER BY 
-- Lista os nomes dos músicos e as orquestras em que tocam,
-- colocando os nomes dos músicos em letras maiúsculas e ordenando o resultado alfabeticamente pelo nome do músico.
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

-- 2. LEFT JOIN, CONCAT: 
-- Lista os nomes dos músicos e, se aplicável, o nome e a cidade da orquestra em que tocam
SELECT 
    M.nome AS NomeMusico,
    CONCAT(O.nome, ' (', O.cidade, ')') AS NomeOrquestraCidade
FROM 
    Musicos M
LEFT JOIN 
    Musicos_Orquestras MO ON M.id_musico = MO.id_musico
LEFT JOIN 
    Orquestras O ON MO.id_orquestra = O.id_orquestra;

-- 3. GROUP BY, COUNT:
-- Conta o número de músicos em cada orquestra
SELECT 
    O.nome AS 'Nome Da Orquestra',
    COUNT(MO.id_musico) AS 'Numero de musicos'
FROM 
    Orquestras O
LEFT JOIN 
    Musicos_Orquestras MO ON O.id_orquestra = MO.id_orquestra
GROUP BY 
    O.nome;

-- 4. INNER JOIN, GROUP BY, ORDER BY, COUNT:
-- Conta o número de sinfonias compostas por cada compositor e lista os compositores em ordem decrescente de número de sinfonias.
SELECT 
    S.compositor AS Compositor,
    COUNT(S.id_sinfonia) AS NumeroDeSinfonias
FROM 
    Sinfonias S
GROUP BY 
    S.compositor
ORDER BY 
    NumeroDeSinfonias DESC;

-- 5. LEFT JOIN, UPPER:
-- Semelhante à consulta 2, lista os músicos e suas orquestras,
-- mas coloca os nomes dos músicos em maiúsculas. Usa LEFT JOIN para incluir todos os músicos
SELECT 
    UPPER(M.nome) AS 'Nome Musico',
    O.nome AS 'Nome Orquestra'
FROM 
    Musicos M
LEFT JOIN 
    Musicos_Orquestras MO ON M.id_musico = MO.id_musico
LEFT JOIN 
    Orquestras O ON MO.id_orquestra = O.id_orquestra;

-- 6. CONCAT, ORDER BY:
-- Combina o nome e a nacionalidade de cada músico em uma única coluna e ordena a lista alfabeticamente pelo nome.
SELECT 
    CONCAT(nome, ' (', nacionalidade, ')') AS InfoMusico
FROM 
    Musicos
ORDER BY 
    nome;

-- 7. INNER JOIN, GROUP BY, COUNT, ORDER BY:
-- Conta o número de músicos únicos que tocam em orquestras em cada cidade e lista as cidades em ordem decrescente de número de músicos únicos.
SELECT 
    O.cidade AS Cidade,
    COUNT(DISTINCT MO.id_musico) AS 'Numero De Musicos Unicos'
FROM 
    Orquestras O
INNER JOIN 
    Musicos_Orquestras MO ON O.id_orquestra = MO.id_orquestra
GROUP BY 
    O.cidade
ORDER BY 
    'Numero De Musicos Unicos' DESC;

-- 8. LEFT JOIN, GROUP BY, COUNT:
-- Conta o número de músicos por nacionalidade.
SELECT 
    M.nacionalidade AS Nacionalidade,
    COUNT(M.id_musico) AS 'Numero De Musicos'
FROM 
    Musicos M
GROUP BY 
    M.nacionalidade;

-- 9. UPPER, ORDER BY:
-- Lista os nomes de todas as sinfonias em maiúsculas, ordenados alfabeticamente.
SELECT 
    UPPER(nome) AS 'Nome Sinfonia'
FROM 
    Sinfonias
ORDER BY 
    nome;

-- 10. CONCAT, LEFT JOIN: 
-- combinar o nome do músico com sua função.

SELECT 
    CONCAT(M.nome, ' (', F.nome_funcao, ')') AS 'Informa Musico e Funcao'
FROM 
    Musicos M
LEFT JOIN 
    Funcoes_Musicos F ON 1=1;  -- Simulação de relação (adaptar se houver relação real)

-- 11. INNER JOIN, GROUP BY, COUNT, ORDER BY:
-- Conta o número de instrumentos por tipo e lista os tipos em ordem decrescente de número de instrumentos
SELECT 
    I.tipo AS TipoInstrumento,
    COUNT(I.id_instrumento) AS 'Numero De Instrumentos'
FROM 
    Instrumentos I
GROUP BY 
    I.tipo
ORDER BY 
    'Numero De Instrumentos' DESC;

-- 12.  UPPER, LEFT JOIN, ORDER BY:
-- Lista as orquestras (em maiúsculas) e os músicos que tocam nelas,
-- ordenando primeiro por nome da orquestra e depois por nome do músico. 
SELECT 
    UPPER(O.nome) AS 'Nome Orquestra',
    M.nome AS 'Nome Musico'
FROM 
    Orquestras O
LEFT JOIN 
    Musicos_Orquestras MO ON O.id_orquestra = MO.id_orquestra
LEFT JOIN 
    Musicos M ON MO.id_musico = M.id_musico
ORDER BY 
    'Nome Orquestra', 'Nome Musico';

-- 13. CONCAT, GROUP BY
-- Lista cada sinfonia (formatada como "Nome da Sinfonia (Compositor)") e conta quantas vezes cada combinação aparece (neste caso, sempre 1, 
-- a menos que haja duplicatas na tabela).
-- O GROUP BY aqui é um pouco redundante, mas demonstra o uso.
SELECT 
    CONCAT(S.nome, ' (', S.compositor, ')') AS InfoSinfonia,
    COUNT(*)
FROM 
    Sinfonias S
GROUP BY 
    InfoSinfonia;

-- 14. INNER JOIN, GROUP BY, COUNT, ORDER BY:
-- Conta o número de orquestras distintas em que músicos de cada nacionalidade tocam e lista as nacionalidades em ordem decrescente.
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

-- 15. UPPER, LEFT JOIN, GROUP BY:
--  Conta o número de orquestras por cidade (em maiúsculas).
SELECT 
    UPPER(O.cidade) AS CidadeOrquestra,
    COUNT(O.id_orquestra) AS NumeroOrquestras
FROM 
    Orquestras O
GROUP BY 
    CidadeOrquestra;

-- 16. CONCAT, ORDER BY:
-- Lista os instrumentos formatados como "Nome do Instrumento (Tipo)" e ordenados alfabeticamente pelo nome do instrumento
SELECT 
    CONCAT(I.nome, ' (', I.tipo, ')') AS InfoInstrumento
FROM 
    Instrumentos I
ORDER BY 
    I.nome;

-- 17. INNER JOIN, GROUP BY, COUNT, ORDER BY:
-- Conta quantas sinfonias cada compositor escreveu e ordena os compositores pelo número de sinfonias, do maior para o menor.
SELECT 
    M.compositor,
    COUNT(S.id_sinfonia)
FROM
    Sinfonias S
GROUP BY
    M.compositor
ORDER BY
    COUNT(S.id_sinfonia) DESC;

-- 18. UPPER, LEFT JOIN:
-- Lista os nomes dos músicos em maiúsculas e os nomes das orquestras em que tocam. Usa LEFT JOIN para garantir que todos os músicos sejam listados.
SELECT 
    UPPER(M.nome),
    O.nome
FROM 
    Musicos M
LEFT JOIN 
    Musicos_Orquestras MO ON M.id_musico = MO.id_musico
LEFT JOIN 
    Orquestras O ON MO.id_orquestra = O.id_orquestra;

-- 19. CONCAT, GROUP BY, COUNT:
-- Conta o número de músicos por orquestra, onde o nome e a cidade da orquestra são combinados em uma única coluna para identificação.
SELECT 
    CONCAT(O.nome, ' - ', O.cidade),
    COUNT(MO.id_musico)
FROM 
    Orquestras O
LEFT JOIN 
    Musicos_Orquestras MO ON O.id_orquestra = MO.id_orquestra
GROUP BY 
    CONCAT(O.nome, ' - ', O.cidade);

-- 20.  INNER JOIN, ORDER BY:
-- Lista os nomes dos músicos e as orquestras em que tocam, ordenando primeiro pelo nome da orquestra e depois pelo nome do músico.
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

SELECT
    nome AS NomeInstrumento,
    tipo AS TipoInstrumento
FROM
    Instrumentos;
