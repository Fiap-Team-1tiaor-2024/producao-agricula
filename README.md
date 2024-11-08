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
![image](https://github.com/user-attachments/assets/bad0b784-fb29-42d0-901c-8d1b2d7f3106)

## Modelo Relacional
![image](https://github.com/user-attachments/assets/c2155215-669a-4422-83d7-40e8c18f853d)

## Estrutura das Tabelas
```sql
CREATE TABLE Estado (
    ID_Estado INT PRIMARY KEY,
    Nome_Estado VARCHAR(100),
    Região VARCHAR(50)
);

CREATE TABLE Cultura (
    ID_Cultura INT PRIMARY KEY,
    Nome_Cultura VARCHAR(100)
);

CREATE TABLE Produção (
    ID_Produção INT PRIMARY KEY,
    Ano INT,
    Área_Plantada DECIMAL(10, 2),
    Produção_Total DECIMAL(10, 2),
    Produtividade DECIMAL(10, 2),
    ID_Estado INT,
    ID_Cultura INT,
    FOREIGN KEY (ID_Estado) REFERENCES Estado(ID_Estado),
    FOREIGN KEY (ID_Cultura) REFERENCES Cultura(ID_Cultura)
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
INSERT INTO Cultura (ID_Cultura, Nome_Cultura) VALUES
(1, 'Soja'),
(2, 'Milho'),
(3, 'Café');
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
SELECT Estado.Nome_Estado, SUM(Produção.Produção_Total) AS Produção_Total
FROM Produção
JOIN Estado ON Produção.ID_Estado = Estado.ID_Estado
WHERE Produção.Ano = 2023 AND Produção.ID_Cultura = 1
GROUP BY Estado.Nome_Estado;
```

### Evolução da área plantada de uma cultura ao longo dos anos
```sql
SELECT Ano, SUM(Área_Plantada) AS Área_Total
FROM Produção
WHERE ID_Cultura = 1
GROUP BY Ano
ORDER BY Ano;
```

### Ranking dos estados com maior produtividade em uma cultura específica
```sql
SELECT Estado.Nome_Estado, AVG(Produção.Produtividade) AS Produtividade_Média
FROM Produção
JOIN Estado ON Produção.ID_Estado = Estado.ID_Estado
WHERE Produção.ID_Cultura = 1
GROUP BY Estado.Nome_Estado
ORDER BY Produtividade_Média DESC;
```
