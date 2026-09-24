DROP DATABASE IF EXISTS DBLojaGamer;
CREATE DATABASE IF NOT EXISTS DBLojaGamer DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_general_ci;
USE DBLojaGamer;

CREATE TABLE IF NOT EXISTS produtos (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE,
    categoria VARCHAR(30) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    estoque INT DEFAULT 0,
    data_cadastro DATE,
    PRIMARY KEY (id)
) DEFAULT CHARSET = utf8mb4;

INSERT INTO produtos (nome, categoria, preco, estoque, data_cadastro) VALUES 
('Mouse Sem Fio Logi', 'Periféricos', 89.90, 45, '2023-01-15'),
('Teclado Mecânico RGB', 'Periféricos', 250.00, 20, '2023-02-10'),
('Monitor UltraWide 29', 'Monitores', 1200.00, 8, '2022-11-20'),
('Headset Gamer USB', 'Periféricos', 180.50, 0, '2023-03-05'),
('Webcam Full HD 1080p', 'Periféricos', 210.00, 15, '2023-04-12'),
('Cadeira Ergonômica', 'Móveis', 850.00, 5, '2022-08-30'),
('Mesa Gamer em L', 'Móveis', 620.00, 3, '2022-09-15'),
('Notebook Core i5 16GB', 'Informática', 3450.00, 12, '2023-05-01'),
('SSD NVMe 1TB', 'Hardware', 420.00, 30, '2023-01-20'),
('HD Externo 2TB', 'Hardware', 380.00, 0, '2022-10-10'),
('Memória RAM 16GB DDR4', 'Hardware', 280.00, 25, '2023-02-28'),
('Placa de Vídeo RTX 3060', 'Hardware', 2100.00, 4, '2023-03-18'),
('Processador Ryzen 7', 'Hardware', 1450.00, 10, '2023-04-02'),
('Fonte Atx 650w Bronze', 'Hardware', 350.00, 18, '2023-01-05'),
('Gabinete Mid Tower', 'Hardware', 290.00, 7, '2022-12-01'),
('Impressora Multifuncional', 'Escritório', 780.00, 6, '2023-02-15'),
('Nobreak 1200VA', 'Escritório', 920.00, 2, '2022-07-22'),
('Filtro de Linha 6 Tomadas', 'Escritório', 45.90, 50, '2023-05-10'),
('Hub USB 3.0 4 Portas', 'Periféricos', 65.00, 0, '2023-03-22'),
('Suporte para Monitor Duo', 'Móveis', 190.00, 14, '2023-01-30'),
('Suporte para Notebook', 'Móveis', 75.00, 22, '2023-04-20'),
('Cabo HDMI 2.1 2m', 'Periféricos', 35.00, 60, '2023-02-05'),
('Roteador Wi-Fi 6 Gigabit', 'Redes', 320.00, 9, '2023-03-30'),
('Switch 8 Portas Gigabit', 'Redes', 140.00, 11, '2022-11-05'),
('Mochila para Notebook', 'Escritório', 160.00, 16, '2023-01-18');
-- 1
SELECT nome, preco, categoria FROM produtos ORDER BY preco ASC;
-- 2
SELECT * FROM produtos WHERE nome LIKE 'Suporte%';
-- 3
SELECT * FROM produtos WHERE nome LIKE '%Gamer%';
-- 4
SELECT nome, categoria, estoque FROM produtos WHERE categoria = 'Hardware' AND preco > 500.00;
-- 5
SELECT nome, categoria, preco FROM produtos WHERE categoria = 'Móveis' OR preco < 100.00;
-- 6
SELECT nome, categoria 
FROM produtos 
WHERE estoque = 0;
-- 7
SELECT nome, categoria
FROM produtos
WHERE estoque = 0;

-- 8
SELECT nome, preco
FROM produtos
WHERE preco BETWEEN 100.00 AND 400.00
ORDER BY preco DESC;

-- 9
SELECT nome, categoria
FROM produtos
WHERE NOT categoria = 'Periféricos';

-- 10
SELECT COUNT(*) AS total_produtos
FROM produtos;

-- 11
SELECT COUNT(*) AS total_produtos_acima_1000
FROM produtos
WHERE preco > 1000.00;

-- 12
SELECT SUM(estoque) AS total_itens_estoque
FROM produtos;

-- 13
SELECT AVG(preco) AS media_precos
FROM produtos;

-- 14
SELECT MAX(preco) AS maior_preco,
       MIN(preco) AS menor_preco
FROM produtos;

-- 15
SELECT MAX(preco) AS maior_preco_perifericos
FROM produtos
WHERE categoria = 'Periféricos';

-- 16
SELECT categoria, COUNT(*) AS quantidade_produtos
FROM produtos
GROUP BY categoria;

-- 17
SELECT categoria, SUM(estoque) AS total_estoque
FROM produtos
GROUP BY categoria;

-- 18
SELECT categoria, AVG(preco) AS media_preco
FROM produtos
GROUP BY categoria;

-- 19
SELECT categoria, COUNT(*) AS quantidade_produtos
FROM produtos
GROUP BY categoria
HAVING COUNT(*) > 4;

-- 20
SELECT categoria, AVG(preco) AS media_preco
FROM produtos
GROUP BY categoria
HAVING AVG(preco) > 300.00;

-- 21
SELECT nome,
       preco,
       estoque,
       (preco * estoque) AS valor_total_estoque
FROM produtos
WHERE estoque > 0
ORDER BY valor_total_estoque DESC;

-- 22
SELECT nome, categoria, estoque
FROM produtos
WHERE estoque <= 5
  AND categoria IN ('Hardware', 'Periféricos');

-- 23
SELECT nome, data_cadastro
FROM produtos
WHERE data_cadastro BETWEEN '2023-01-01' AND '2023-03-31'
ORDER BY data_cadastro DESC;

-- 24
SELECT categoria, AVG(estoque) AS media_estoque
FROM produtos
WHERE categoria <> 'Monitores'
GROUP BY categoria
HAVING AVG(estoque) < 15;

-- 25
SELECT nome, preco
FROM produtos
WHERE preco > (SELECT AVG(preco) FROM produtos);
