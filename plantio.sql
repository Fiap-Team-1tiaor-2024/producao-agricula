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
