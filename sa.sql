-- Create the database
-- CREATE DATABASE IF NOT EXISTS mysqlproduto;

-- Use the database
-- USE mysqlproduto;

-- Create the produto table
-- CREATE TABLE IF NOT EXISTS produto (
  --  id INT AUTO_INCREMENT PRIMARY KEY,
 --   nome VARCHAR(255) NOT NULL,
 --   preco DECIMAL(10,2) NOT NULL,
 --   categoria VARCHAR(100) NOT NULL
-- );

-- Insert data into the produto table
-- Corrected INSERT statement:
-- INSERT INTO produto (nome, preco, categoria) VALUES ('Lucca', 13122.00, 'Humano');

DROP database gerenciamento_produtos;

-- Criação do banco de dados (se ainda não existir)
CREATE DATABASE IF NOT EXISTS gerenciamento_produtos;

-- Usar o banco de dados
USE gerenciamento_produtos;

-- Tabela: categorias
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE
);


-- Tabela: clientes
CREATE TABLE clientes (
id INT auto_increment primary KEY,
nome varchar(255) NOT NULL,
cpf varchar(14) not null unique,
email varchar(255),
endereco TEXT,
segenero ENUM ('M', 'F') default'Helicoptero de Combate Russo Alemão criado a 2000 anos atrás'
);

-- Tabela: fornecedores
CREATE TABLE fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    contato VARCHAR(255), 
    avaliacao DECIMAL(1,2)
);

-- Tabela: produtos
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    id_categoria INT,
    id_fornecedor INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id) ON DELETE SET NULL,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id) ON DELETE SET NULL
);

DROP TABLE fornecedores;

-- Inserção de dados de exemplo na tabela categorias (sem 'Móveis')
INSERT INTO categorias (nome) VALUES
('Eletrônicos'),
('Roupas'),
('Alimentos'),
('Livros');

-- Inserção de dados de exemplo na tabela fornecedores
INSERT INTO fornecedores (nome, contato) VALUES
('Tech Supplies Ltda.', 'contato@techsupplies.com'),
('Fashion Wear S.A.', 'vendas@fashionwear.com'),
('Food Distributors Inc.', 'info@fooddist.com'),
('Book Haven Editora', 'editora@bookhaven.com');

-- Inserção de dados de exemplo na tabela produtos (sem produtos da categoria 'Móveis')
INSERT INTO produtos (nome, descricao, preco, quantidade_estoque, id_categoria, id_fornecedor) VALUES
('Smartphone X', 'Última geração de smartphones com câmera de alta resolução.', 1200.00, 50, 1, 1),
('Camiseta Algodão', 'Camiseta 100% algodão, confortável e durável.', 45.90, 200, 2, 2),
('Arroz Integral 1kg', 'Arroz integral orgânico, pacote de 1kg.', 12.50, 300, 3, 3),
('O Guia do Mochileiro das Galáxias', 'Livro clássico de ficção científica.', 35.00, 100, 4, 4),
('Notebook Gamer', 'Notebook de alta performance para jogos.', 3500.00, 20, 1, 1),
('Calça Jeans Slim Fit', 'Calça jeans masculina com corte slim fit.', 99.90, 150, 2, 2),
('Feijão Carioca 1kg', 'Feijão carioca selecionado, pacote de 1kg.', 8.75, 250, 3, 3),
('1984', 'Distopia clássica de George Orwell.', 28.00, 120, 4, 4);
