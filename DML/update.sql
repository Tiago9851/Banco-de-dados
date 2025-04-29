-- 1. Atualizar o telefone de um músico
UPDATE Musicos SET telefone = '12345-6789' WHERE id_musico = 1;

-- 2. Alterar o compositor de uma sinfonia específica
UPDATE Sinfonias SET compositor = 'Bach' WHERE id_sinfonia = 2;

-- 3. Atualizar o nome de uma orquestra
UPDATE Orquestras SET nome = 'Orquestra Sinfônica Atualizada' WHERE id_orquestra = 3;

-- 4. Atualizar a nacionalidade de um músico
UPDATE Musicos SET nacionalidade = 'Portugal' WHERE id_musico = 4;

-- 5. Atualizar a data de fundação de uma orquestra
UPDATE Orquestras SET data_fundacao = '1900-01-01' WHERE id_orquestra = 5;

-- 6. Alterar o tipo de instrumento
UPDATE Instrumentos SET tipo = 'Cordas' WHERE id_instrumento = 1;

-- 7. Atualizar o status de uma sinfonia
UPDATE Sinfonias SET status = 'inativa' WHERE id_sinfonia = 6;

-- 8. Alterar a função de um músico
UPDATE Funcoes_Musicos SET nome_funcao = 'Pianista Principal' WHERE id_funcao = 3;

-- 9. Atualizar o nome de um músico
UPDATE Musicos SET nome = 'João Mendes Atualizado' WHERE id_musico = 7;

-- 10. Alterar a cidade de uma orquestra
UPDATE Orquestras SET cidade = 'Rio de Janeiro' WHERE id_orquestra = 2;