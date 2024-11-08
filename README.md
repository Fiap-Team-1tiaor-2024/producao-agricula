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
INSERT INTO Estado (ID_Estado, Nome_Estado, Região) VALUES
(1, 'São Paulo', 'Sudeste'),
(2, 'Minas Gerais', 'Sudeste'),
(3, 'Paraná', 'Sul');
```

### Tabela Cultura
```sql
INSERT INTO Cultura (id_cultura, nome) VALUES (1, 'Soja');
INSERT INTO Cultura (id_cultura, nome) VALUES (2, 'Milho');
INSERT INTO Cultura (id_cultura, nome) VALUES (3, 'Café');
```

### Tabela Produção
```sql
INSERT INTO Produção (ID_Produção, Ano, Área_Plantada, Produção_Total, Produtividade, ID_Estado, ID_Cultura) VALUES
(1, 2023, 1500.00, 4500.00, 3.00, 1, 1),
(2, 2023, 1200.00, 3600.00, 3.00, 2, 2),
(3, 2023, 800.00, 2400.00, 3.00, 3, 3);
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

