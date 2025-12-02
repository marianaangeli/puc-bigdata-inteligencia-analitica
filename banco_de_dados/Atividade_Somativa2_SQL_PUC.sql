-- ============================================
-- SISTEMA DE GERENCIAMENTO DE VINHOS
-- ============================================

-- Criação das tabelas
-- ============================================

-- Tabela Regiao
CREATE TABLE Regiao (
    codRegiao BIGINT PRIMARY KEY AUTO_INCREMENT,
    nomeRegiao VARCHAR(100) NOT NULL,
    descricaoRegiao TEXT
);

-- Tabela Vinicola
CREATE TABLE Vinicola (
    codVinicola BIGINT PRIMARY KEY AUTO_INCREMENT,
    nomeVinicola VARCHAR(100) NOT NULL,
    descricaoVinicola TEXT,
    foneVinicola VARCHAR(15),
    emailVinicola VARCHAR(15),
    codRegiao BIGINT NOT NULL,
    FOREIGN KEY (codRegiao) REFERENCES Regiao(codRegiao)
);

-- Tabela Vinho
CREATE TABLE Vinho (
    codVinho BIGINT PRIMARY KEY AUTO_INCREMENT,
    nomeVinho VARCHAR(50) NOT NULL,
    tipoVinho VARCHAR(30),
    anoVinho INT,
    descricaoVinho TEXT,
    codVinicola BIGINT NOT NULL,
    FOREIGN KEY (codVinicola) REFERENCES Vinicola(codVinicola)
);

-- ============================================
-- Inserção de dados (mínimo 5 registros por tabela)
-- ============================================

-- Inserindo Regiões
INSERT INTO Regiao (nomeRegiao, descricaoRegiao) VALUES
('Vale do Douro', 'Região vinícola tradicional de Portugal, conhecida pelo Vinho do Porto'),
('Toscana', 'Famosa região italiana produtora de Chianti e Brunello'),
('Bordeaux', 'Prestigiada região francesa com vinhos elegantes'),
('Napa Valley', 'Principal região vinícola da Califórnia, Estados Unidos'),
('Vale dos Vinhedos', 'Primeira região demarcada do Brasil, no Rio Grande do Sul');

-- Inserindo Vinícolas
INSERT INTO Vinicola (nomeVinicola, descricaoVinicola, foneVinicola, emailVinicola, codRegiao) VALUES
('Quinta do Crasto', 'Vinícola familiar centenária', '351-254-920020', 'info@crasto.pt', 1),
('Antinori', 'Vinícola italiana com mais de 600 anos de tradição', '39-055-23595', 'info@antinori', 2),
('Château Margaux', 'Um dos mais prestigiados châteaux de Bordeaux', '33-557-887000', 'contact@margau', 3),
('Opus One', 'Joint venture entre Robert Mondavi e Baron Rothschild', '1-707-9447766', 'info@opusone.', 4),
('Casa Valduga', 'Vinícola brasileira premiada internacionalmente', '54-21053000', 'contato@valdug', 5);

-- Inserindo Vinhos
INSERT INTO Vinho (nomeVinho, tipoVinho, anoVinho, descricaoVinho, codVinicola) VALUES
('Crasto Superior', 'Tinto', 2020, 'Vinho tinto encorpado com notas de frutas negras', 1),
('Douro Reserva', 'Tinto', 2019, 'Elegante vinho do Douro com excelente estrutura', 1),
('Tignanello', 'Tinto', 2018, 'Super Toscano icônico com blend de Sangiovese', 2),
('Chianti Classico', 'Tinto', 2021, 'Vinho tradicional toscano frutado e fresco', 2),
('Margaux Grand Cru', 'Tinto', 2016, 'Vinho de excelência, elegante e complexo', 3),
('Pavillon Rouge', 'Tinto', 2019, 'Segundo vinho do Château, refinado e acessível', 3),
('Opus One', 'Tinto', 2018, 'Blend bordalês de alta qualidade, sofisticado', 4),
('Overture', 'Tinto', 2020, 'Blend elegante em estilo Opus One', 4),
('Gran Reserva', 'Tinto', 2017, 'Vinho brasileiro premium com blend de uvas nobres', 5),
('Casa Valduga Brut', 'Espumante', 2021, 'Espumante método tradicional refrescante', 5);

-- ============================================
-- CONSULTA SOLICITADA
-- Lista nome e ano dos vinhos, incluindo nome da vinícola e região
-- ============================================

SELECT 
    v.nomeVinho AS 'Nome do Vinho',
    v.anoVinho AS 'Ano',
    vin.nomeVinicola AS 'Vinícola',
    r.nomeRegiao AS 'Região'
FROM 
    Vinho v
    INNER JOIN Vinicola vin ON v.codVinicola = vin.codVinicola
    INNER JOIN Regiao r ON vin.codRegiao = r.codRegiao
ORDER BY 
    v.nomeVinho, v.anoVinho;

-- ============================================
-- CRIAÇÃO DO USUÁRIO SOMELLIER
-- ============================================

-- Criar usuário Somellier com acesso apenas pelo localhost
CREATE USER 'Somellier'@'localhost' IDENTIFIED BY 'senha_segura_123';

-- Conceder permissão de SELECT apenas nos campos específicos
GRANT SELECT (codVinicula, nomeVinicula) ON Vinicola TO 'Somellier'@'localhost';

-- Limitar a 40 consultas por hora
ALTER USER 'Somellier'@'localhost' WITH MAX_QUERIES_PER_HOUR 40;

-- Aplicar as mudanças
FLUSH PRIVILEGES;

-- ============================================
-- OBSERVAÇÕES IMPORTANTES
-- ============================================
-- 1. O modelo físico está implementado conforme o modelo conceitual e lógico
-- 2. As relações de integridade referencial foram mantidas
-- 3. Foram inseridos 5 regiões, 5 vinícolas e 10 vinhos (2 por vinícola)
-- 4. A consulta retorna nome e ano dos vinhos com suas vinícolas e regiões
-- 5. O usuário Somellier tem acesso restrito conforme especificado