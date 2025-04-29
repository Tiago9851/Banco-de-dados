-- 1. Adicionar uma coluna para armazenar o telefone dos músicos
ALTER TABLE Musicos ADD telefone VARCHAR(20);

-- 2. Alterar o tamanho máximo da coluna nome na tabela Orquestras
ALTER TABLE Orquestras MODIFY nome VARCHAR(300);

-- 3. Renomear a coluna data_criacao na tabela Sinfonias para ano_criacao
ALTER TABLE Sinfonias RENAME COLUMN data_criacao TO ano_criacao;

-- 4. Remover a coluna tipo da tabela Instrumentos
ALTER TABLE Instrumentos DROP COLUMN tipo;

-- 5. Adicionar uma restrição UNIQUE à coluna identidade na tabela Musicos
ALTER TABLE Musicos ADD CONSTRAINT unique_identidade UNIQUE (identidade);

-- 6. Adicionar uma chave estrangeira entre a tabela Funcoes_Musicos e Musicos
ALTER TABLE Funcoes_Musicos ADD CONSTRAINT fk_funcao_musico FOREIGN KEY (id_funcao) REFERENCES Musicos(id_musico);

-- 7. Alterar o tipo de dados da coluna data_fundacao na tabela Orquestras para DATE
ALTER TABLE Orquestras MODIFY data_fundacao DATE;

-- 8. Adicionar uma coluna para registrar o status de uma sinfonia (ativa/inativa)
ALTER TABLE Sinfonias ADD status VARCHAR(10) DEFAULT 'ativa';

-- 9. Renomear a tabela Instrumentos para Equipamentos
ALTER TABLE Instrumentos RENAME TO Equipamentos;

-- 10. Adicionar uma coluna para a data de atualização na tabela Musicos
ALTER TABLE Musicos ADD data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;