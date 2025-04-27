-- Inserts para a tabela Sinfonias
INSERT INTO Sinfonias (id_sinfonia, nome, compositor, data_criacao) VALUES
(1, 'Sinfonia nº 1', 'Beethoven', '1800-04-02'),
(2, 'Sinfonia nº 5', 'Beethoven', '1808-12-22'),
(3, 'Sinfonia nº 9', 'Beethoven', '1824-05-07'),
(4, 'Sinfonia nº 40', 'Mozart', '1788-07-25'),
(5, 'Sinfonia nº 41', 'Mozart', '1788-08-10'),
(6, 'Sinfonia nº 6', 'Tchaikovsky', '1893-10-28'),
(7, 'Sinfonia nº 2', 'Rachmaninoff', '1908-02-08'),
(8, 'Sinfonia nº 4', 'Mahler', '1901-11-25'),
(9, 'Sinfonia nº 3', 'Brahms', '1883-12-02'),
(10, 'Sinfonia nº 7', 'Sibelius', '1924-03-24');

-- Inserts para a tabela Musicos
INSERT INTO Musicos (id_musico, nome, identidade, nacionalidade, data_nascimento) VALUES
(1, 'Carlos Silva', '123456789', 'Brasil', '1985-03-15'),
(2, 'Ana Souza', '987654321', 'Brasil', '1990-05-20'),
(3, 'Jorge Lima', '456123789', 'Portugal', '1978-11-12'),
(4, 'Maria Costa', '654987321', 'Argentina', '1982-08-08'),
(5, 'John Smith', '321654987', 'EUA', '1995-02-14'),
(6, 'Sophia Müller', '159753486', 'Alemanha', '1998-07-19'),
(7, 'Lucas Santos', '753951468', 'Brasil', '1987-01-21'),
(8, 'Gabriela Gomes', '852369741', 'Espanha', '1992-06-05'),
(9, 'Pedro Alvarez', '951357486', 'Chile', '1984-09-13'),
(10, 'Emma Brown', '654123987', 'Reino Unido', '1991-04-17');

-- Inserts para a tabela Orquestras
INSERT INTO Orquestras (id_orquestra, nome, cidade, data_fundacao) VALUES
(1, 'Filarmônica de Berlim', 'Berlim', '1882-05-01'),
(2, 'Orquestra Sinfônica de São Paulo', 'São Paulo', '1954-01-18'),
(3, 'Orquestra de Paris', 'Paris', '1967-02-14'),
(4, 'Orquestra de Londres', 'Londres', '1932-03-09'),
(5, 'Orquestra de Viena', 'Viena', '1900-10-28'),
(6, 'Orquestra de Boston', 'Boston', '1881-10-22'),
(7, 'Orquestra Nacional do Chile', 'Santiago', '1941-07-17'),
(8, 'Orquestra Sinfônica do Japão', 'Tóquio', '1926-10-05'),
(9, 'Orquestra Filarmônica de Nova York', 'Nova York', '1842-12-07'),
(10, 'Orquestra Sinfônica de Birmingham', 'Birmingham', '1920-03-29');

-- Inserts para a tabela Instrumentos
INSERT INTO Instrumentos (id_instrumento, nome, tipo) VALUES
(1, 'Violino', 'Corda'),
(2, 'Viola', 'Corda'),
(3, 'Cello', 'Corda'),
(4, 'Contrabaixo', 'Corda'),
(5, 'Flauta', 'Sopro'),
(6, 'Clarinete', 'Sopro'),
(7, 'Oboé', 'Sopro'),
(8, 'Trompete', 'Metais'),
(9, 'Trombona', 'Metais'),
(10, 'Tímpano', 'Percussão');

-- Inserts para a tabela Funções_Musicos
INSERT INTO Funcoes_Musicos (id_funcao, nome_funcao) VALUES
(1, 'Regente'),
(2, 'Solista'),
(3, 'Violinista Principal'),
(4, 'Violoncelista Principal'),
(5, 'Pianista'),
(6, 'Trompetista'),
(7, 'Clarinetista'),
(8, 'Timpanista'),
(9, 'Oboísta'),
(10, 'Flautista');

-- Inserts para a tabela de relacionamento Musicos_Orquestras
INSERT INTO Musicos_Orquestras (id_musico, id_orquestra, data_inicio) VALUES
(1, 2, '2010-01-01'),
(2, 2, '2015-06-15'),
(3, 3, '2012-08-01'),
(4, 3, '2018-05-20'),
(5, 4, '2020-02-14'),
(6, 4, '2019-07-07'),
(7, 5, '2013-11-25'),
(8, 6, '2016-04-12'),
(9, 7, '2017-09-10'),
(10, 8, '2021-03-17');