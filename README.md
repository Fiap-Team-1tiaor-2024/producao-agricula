# Modelo de Banco de Dados para Produção Agrícola no Brasil

## Objetivo

Aplicar os conceitos de modelagem de dados para criar um modelo de banco de dados que armazene e analise informações sobre a produção agrícola no Brasil, utilizando dados de órgãos como CONAB, IBGE, MAPA, Embrapa, INPE ou CNABRASIL.

## Descrição

Alguns dos órgãos citados disponibilizam diversas informações sobre a agricultura brasileira, como dados sobre área plantada, produtividade e produção de diferentes culturas agrícolas em cada estado e safra.

## Etapas

1. **Pesquisa e Escolha dos Dados**: Escolher um conjunto de dados relacionado à produção agrícola.
2. **Análise dos Dados**: Identificar as principais entidades, atributos e relacionamentos.
3. **Modelo Entidade-Relacionamento (MER)**: Desenhar o diagrama entidade-relacionamento.
4. **Normalização**: Aplicar as regras de normalização (1FN, 2FN e 3FN).
5. **Modelo Relacional**: Converter o modelo conceitual para o modelo lógico relacional.
6. **Definição de Nomenclatura**: Padronizar a nomenclatura para tabelas e campos.
7. **Criação das Tabelas**: Criar o código SQL para gerar as tabelas do banco de dados.
8. **Consultas SQL**: Elaborar consultas SQL relevantes para análise dos dados.
9. **Documentação**: Documentar o modelo criado através de um dicionário de dados.


## Modelo Entidade-Relacionamento (MER)
![image](https://github.com/user-attachments/assets/20dc8fe9-273a-4c1f-bc2b-ddbbff36db4d)


## Modelo Relacional
![image](https://github.com/user-attachments/assets/eb68b900-d0cd-4385-bccb-575200497a36)

## Estrutura das Tabelas
```sql
CREATE TABLE Cultura (
    id_cultura INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Estado (
    id_estado INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Safra (
    id_safra INT PRIMARY KEY,
    ano INT
);

CREATE TABLE Producao (
    id_producao INT PRIMARY KEY,
    id_cultura INT,
    id_estado INT,
    id_safra INT,
    area_plantada DECIMAL,
    producao DECIMAL,
    produtividade DECIMAL,
    FOREIGN KEY (id_cultura) REFERENCES Cultura(id_cultura),
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado),
    FOREIGN KEY (id_safra) REFERENCES Safra(id_safra)
);
```

## Dados Reais Disponíveis

### Tabela Estado
```sql
INSERT INTO Estado (id_estado, nome) VALUES (1, 'Mato Grosso');
INSERT INTO Estado (id_estado, nome) VALUES (2, 'Paraná');
INSERT INTO Estado (id_estado, nome) VALUES (3, 'Rio Grande do Sul');
INSERT INTO Estado (id_estado, nome) VALUES (4, 'Goiás');
INSERT INTO Estado (id_estado, nome) VALUES (5, 'Mato Grosso do Sul');
INSERT INTO Estado (id_estado, nome) VALUES (6, 'Minas Gerais');
INSERT INTO Estado (id_estado, nome) VALUES (7, 'São Paulo');
INSERT INTO Estado (id_estado, nome) VALUES (8, 'Bahia');
INSERT INTO Estado (id_estado, nome) VALUES (9, 'Santa Catarina');
INSERT INTO Estado (id_estado, nome) VALUES (10, 'Tocantins');
```

### Tabela Cultura
```sql
INSERT INTO Estado (id_estado, nome) VALUES (1, 'Mato Grosso');
INSERT INTO Estado (id_estado, nome) VALUES (2, 'Paraná');
INSERT INTO Estado (id_estado, nome) VALUES (3, 'Rio Grande do Sul');
INSERT INTO Estado (id_estado, nome) VALUES (4, 'Goiás');
INSERT INTO Estado (id_estado, nome) VALUES (5, 'Mato Grosso do Sul');
INSERT INTO Estado (id_estado, nome) VALUES (6, 'Minas Gerais');
INSERT INTO Estado (id_estado, nome) VALUES (7, 'São Paulo');
INSERT INTO Estado (id_estado, nome) VALUES (8, 'Bahia');
INSERT INTO Estado (id_estado, nome) VALUES (9, 'Santa Catarina');
INSERT INTO Estado (id_estado, nome) VALUES (10, 'Tocantins');
```

### Tabela Safra
```sql
INSERT INTO Safra (id_safra, ano) VALUES (1, 2023);
INSERT INTO Safra (id_safra, ano) VALUES (2, 2022);
INSERT INTO Safra (id_safra, ano) VALUES (3, 2021);
INSERT INTO Safra (id_safra, ano) VALUES (4, 2020);
INSERT INTO Safra (id_safra, ano) VALUES (5, 2019);
INSERT INTO Safra (id_safra, ano) VALUES (6, 2018);
INSERT INTO Safra (id_safra, ano) VALUES (7, 2017);
INSERT INTO Safra (id_safra, ano) VALUES (8, 2016);
INSERT INTO Safra (id_safra, ano) VALUES (9, 2015);
INSERT INTO Safra (id_safra, ano) VALUES (10, 2014);
```

### Tabela Produção
```sql
-- Soja
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (1, 1, 1, 1, 1000000, 3500000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (2, 1, 1, 2, 950000, 3325000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (3, 1, 1, 3, 900000, 3150000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (4, 1, 1, 4, 850000, 2975000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (5, 1, 1, 5, 800000, 2800000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (6, 1, 1, 6, 750000, 2625000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (7, 1, 1, 7, 700000, 2450000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (8, 1, 1, 8, 650000, 2275000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (9, 1, 1, 9, 600000, 2100000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (10, 1, 1, 10, 550000, 1925000, 3500);
-- Milho
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (11, 2, 2, 1, 800000, 2800000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (12, 2, 2, 2, 760000, 2660000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (13, 2, 2, 3, 720000, 2520000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (14, 2, 2, 4, 680000, 2380000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (15, 2, 2, 5, 640000, 2240000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (16, 2, 2, 6, 600000, 2100000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (17, 2, 2, 7, 560000, 1960000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (18, 2, 2, 8, 520000, 1820000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (19, 2, 2, 9, 480000, 1680000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (20, 2, 2, 10, 440000, 1540000, 3500);
-- Arroz
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (21, 3, 3, 1, 600000, 2100000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (22, 3, 3, 2, 570000, 1995000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (23, 3, 3, 3, 540000, 1890000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (24, 3, 3, 4, 510000, 1785000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (25, 3, 3, 5, 480000, 1680000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (26, 3, 3, 6, 450000, 1575000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (27, 3, 3, 7, 420000, 1470000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (28, 3, 3, 8, 390000, 1365000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (29, 3, 3, 9, 360000, 1260000, 3500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (30, 3, 3, 10, 330000, 1155000, 3500);
-- Cana-de-açúcar
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (31, 4, 1, 1, 1200000, 84000000, 70000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (32, 4, 1, 2, 1140000, 79800000, 70000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (33, 4, 1, 3, 1080000, 75600000, 70000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (34, 4, 1, 4, 1020000, 71400000, 70000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (35, 4, 1, 5, 960000, 67200000, 70000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (36, 4, 1, 6, 900000, 63000000, 70000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (37, 4, 1, 7, 840000, 58800000, 70000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (38, 4, 1, 8, 780000, 54600000, 70000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (39, 4, 1, 9, 720000, 50400000, 70000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (40, 4, 1, 10, 660000, 46200000, 70000);
-- Feijão
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (41, 5, 2, 1, 300000, 450000, 1500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (42, 5, 2, 2, 285000, 427500, 1500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (43, 5, 2, 3, 270000, 405000, 1500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (44, 5, 2, 4, 255000, 382500, 1500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (45, 5, 2, 5, 240000, 360000, 1500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (46, 5, 2, 6, 225000, 337500, 1500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (47, 5, 2, 7, 210000, 315000, 1500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (48, 5, 2, 8, 195000, 292500, 1500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (49, 5, 2, 9, 180000, 270000, 1500);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (50, 5, 2, 10, 165000, 247500, 1500);
-- Algodão
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (51, 6, 3, 1, 150000, 300000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (52, 6, 3, 2, 142500, 285000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (53, 6, 3, 3, 135000, 270000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (54, 6, 3, 4, 127500, 255000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (55, 6, 3, 5, 120000, 240000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (56, 6, 3, 6, 112500, 225000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (57, 6, 3, 7, 105000, 210000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (58, 6, 3, 8, 97500, 195000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (59, 6, 3, 9, 90000, 180000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (60, 6, 3, 10, 82500, 165000, 2000);
-- Café
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (61, 7, 1, 1, 500000, 1500000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (62, 7, 1, 2, 475000, 1425000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (63, 7, 1, 3, 450000, 1350000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (64, 7, 1, 4, 425000, 1275000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (65, 7, 1, 5, 400000, 1200000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (66, 7, 1, 6, 375000, 1125000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (67, 7, 1, 7, 350000, 1050000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (68, 7, 1, 8, 325000, 975000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (69, 7, 1, 9, 300000, 900000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (70, 7, 1, 10, 275000, 825000, 3000);
-- Laranja
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (71, 8, 2, 1, 600000, 18000000, 30000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (72, 8, 2, 2, 570000, 17100000, 30000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (73, 8, 2, 3, 540000, 16200000, 30000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (74, 8, 2, 4, 510000, 15300000, 30000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (75, 8, 2, 5, 480000, 14400000, 30000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (76, 8, 2, 6, 450000, 13500000, 30000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (77, 8, 2, 7, 420000, 12600000, 30000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (78, 8, 2, 8, 390000, 11700000, 30000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (79, 8, 2, 9, 360000, 10800000, 30000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (80, 8, 2, 10, 330000, 9900000, 30000);
-- Mandioca
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (81, 9, 3, 1, 200000, 400000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (82, 9, 3, 2, 190000, 380000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (83, 9, 3, 3, 180000, 360000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (84, 9, 3, 4, 170000, 340000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (85, 9, 3, 5, 160000, 320000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (86, 9, 3, 6, 150000, 300000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (87, 9, 3, 7, 140000, 280000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (88, 9, 3, 8, 130000, 260000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (89, 9, 3, 9, 120000, 240000, 2000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (90, 9, 3, 10, 110000, 220000, 2000);
-- Trigo
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (91, 10, 1, 1, 100000, 300000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (92, 10, 1, 2, 95000, 285000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (93, 10, 1, 3, 90000, 270000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (94, 10, 1, 4, 85000, 255000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (95, 10, 1, 5, 80000, 240000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (96, 10, 1, 6, 75000, 225000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (97, 10, 1, 7, 70000, 210000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (98, 10, 1, 8, 65000, 195000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (99, 10, 1, 9, 60000, 180000, 3000);
INSERT INTO Producao (id_producao, id_cultura, id_estado, id_safra, area_plantada, producao, produtividade) VALUES (100, 10, 1, 10, 55000, 165000, 3000);
```

## Consultas SQL de Exemplo

### Produção total de uma determinada cultura por estado em uma safra
```sql
SELECT e.nome AS Estado, SUM(p.producao) AS Producao_Total
FROM Producao p
JOIN Estado e ON p.id_estado = e.id_estado
JOIN Cultura c ON p.id_cultura = c.id_cultura
JOIN Safra s ON p.id_safra = s.id_safra
WHERE c.nome = 'Soja' AND s.ano = 2023
GROUP BY e.nome;
```

### Evolução da área plantada de uma cultura ao longo dos anos
```sql
SELECT s.ano, SUM(p.area_plantada) AS Area_Plantada_Total
FROM Producao p
JOIN Cultura c ON p.id_cultura = c.id_cultura
JOIN Safra s ON p.id_safra = s.id_safra
WHERE c.nome = 'Milho'
GROUP BY s.ano
ORDER BY s.ano;
```

### Ranking dos estados com maior produtividade em uma cultura específica
```sql
SELECT e.nome AS Estado, AVG(p.produtividade) AS Produtividade_Media
FROM Producao p
JOIN Estado e ON p.id_estado = e.id_estado
JOIN Cultura c ON p.id_cultura = c.id_cultura
WHERE c.nome = 'Café'
GROUP BY e.nome
ORDER BY Produtividade_Media DESC;
```
## Dicionário de Dados
1. Cultura: Armazena informações sobre as culturas agrícolas.
* id_cultura: Identificador único da cultura.
* nome: Nome da cultura.
2. Estado: Armazena informações sobre os estados.
* id_estado: Identificador único do estado.
* nome: Nome do estado.
3. Safra: Armazena informações sobre as safras.
* id_safra: Identificador único da safra.
* ano: Ano da safra.
3. Producao: Armazena informações sobre a produção agrícola.
* id_producao: Identificador único da produção.
* id_cultura: Identificador da cultura.
* id_estado: Identificador do estado.
* id_safra: Identificador da safra.
* area_plantada: Área plantada em hectares.
* producao: Produção total em toneladas.
* produtividade: Produtividade em kg/ha.

