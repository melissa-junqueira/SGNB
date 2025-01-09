CREATE DATABASE IF NOT EXISTS bd_sgnb;

USE bd_sgnb;

#DROP DATABASE bd_sgnb;

#DROP TABLE IF EXISTS tb_loja;

CREATE TABLE tb_loja(
   id_loja int NOT NULL AUTO_INCREMENT,
   nome_loja VARCHAR(100) NOT NULL,
   senha VARCHAR(90) NOT NULL,
   
   PRIMARY KEY(id_loja)
);

#DROP TABLE IF EXISTS tb_cliente;

CREATE TABLE tb_cliente(
   id_cliente int NOT NULL AUTO_INCREMENT,
   nome_cliente VARCHAR(100) NOT NULL,
   telefone_cliente VARCHAR(11) NOT NULL,
   email_cliente VARCHAR(150),
   
   PRIMARY KEY(id_cliente)
);

#DROP TABLE IF EXISTS tb_bicicleta;

CREATE TABLE tb_bicicleta(
   id_bicicleta int NOT NULL AUTO_INCREMENT,
   nome_bike VARCHAR(100) NOT NULL,
   marca_bike VARCHAR(90) NOT NULL,
   cor VARCHAR(35) NOT NULL,
   aro VARCHAR(6) NOT NULL,
   classificacao VARCHAR(8) NOT NULL,
   peso VARCHAR(5),
   preco double,
   
   PRIMARY KEY(id_bicicleta)
);

#DROP TABLE IF EXISTS tb_endereco;

CREATE TABLE tb_endereco(
   id_endereco int NOT NULL AUTO_INCREMENT,
   cep VARCHAR(9),
   rua VARCHAR(100),
   bairro VARCHAR(90),
   numero VARCHAR(10),
   complemento VARCHAR(60),
   cidade VARCHAR(25) NOT NULL,
   estado VARCHAR(10) NOT NULL,
   pais VARCHAR(15) NOT NULL,
   
   PRIMARY KEY(id_endereco)
);

#DROP TABLE IF EXISTS tb_fornecedor;

CREATE TABLE tb_fornecedor(
   id_fornecedor int NOT NULL AUTO_INCREMENT,
   id_endereco int NOT NULL,
   nome_fornecedor VARCHAR(100) NOT NULL,
   telefone_fornecedor VARCHAR(11) NOT NULL,
   cnpj VARCHAR(14),
   email_fornecedor VARCHAR(150),
   
   PRIMARY KEY(id_fornecedor),
   FOREIGN KEY(id_endereco) REFERENCES tb_endereco(id_endereco)
);

#DROP TABLE IF EXISTS tb_peca;

CREATE TABLE tb_peca(
   id_peca int NOT NULL AUTO_INCREMENT,
   id_fornecedor int NOT NULL,
   nome_peca VARCHAR(80) NOT NULL,
   marca_peca VARCHAR(90) NOT NULL,
   valor_uni double NOT NULL,
   descricao_peca TEXT,
   
   PRIMARY KEY(id_peca),
   FOREIGN KEY(id_fornecedor) REFERENCES tb_fornecedor(id_fornecedor)
);

#DROP TABLE IF EXISTS tb_agendamento;

CREATE TABLE tb_agendamento(
    id_agendamento int NOT NULL AUTO_INCREMENT,
    id_cliente int NOT NULL,
    data_hora_Ag DATETIME NOT NULL,
    descricao_Ag TEXT NOT NULL,
    #descrever tipo de serviço: "Serviço de Agendamento" ou "Serviço de Conserto"
    
    PRIMARY KEY(id_agendamento),
    FOREIGN KEY(id_cliente) REFERENCES tb_cliente(id_cliente)
);

#DROP TABLE IF EXISTS tb_servico;

CREATE TABLE tb_servico(
   id_servico int NOT NULL AUTO_INCREMENT,
   id_agendamento int NOT NULL,
   id_peca int,
   nome_Serv VARCHAR(30),
   data_hora_Serv DATETIME NOT NULL, 
   qntd_peca int,
   valor_total_Ser double,
   
   PRIMARY KEY(id_servico),
   FOREIGN KEY(id_agendamento) REFERENCES tb_agendamento(id_agendamento),
   FOREIGN KEY(id_peca) REFERENCES tb_peca(id_peca)
);

#DROP TABLE IF EXISTS tb_compra;

CREATE TABLE tb_compra(
   id_compra int NOT NULL AUTO_INCREMENT,
   id_cliente int NOT NULL,
   id_bicicleta int NOT NULL,
   data_hora_Comp DATETIME NOT NULL,
   valor_total_Comp double,
   
   PRIMARY KEY(id_compra),
   FOREIGN KEY(id_cliente) REFERENCES tb_cliente(id_cliente),
   FOREIGN KEY(id_bicicleta) REFERENCES tb_bicicleta(id_bicicleta)
);

#DROP TABLE IF EXISTS tb_registro;

CREATE TABLE tb_registro(
   id_compra int NOT NULL,
   data_hora_Compra DATETIME NOT NULL,
   
   FOREIGN KEY(id_compra) REFERENCES tb_compra(id_compra)
);

#DROP TABLE IF EXISTS tb_estoque;

CREATE TABLE tb_estoque(
   id_loja int NOT NULL,
   id_peca INT NOT NULL,
   id_bicicleta int NOT NULL,
   
   FOREIGN KEY(id_loja) REFERENCES tb_loja(id_loja),
   FOREIGN KEY(id_peca) REFERENCES tb_peca(id_peca),
   FOREIGN KEY(id_bicicleta) REFERENCES tb_bicicleta(id_bicicleta)
);

INSERT INTO _ values (DEFAULT);
INSERT INTO _ values (DEFAULT);
INSERT INTO _ values (DEFAULT);
INSERT INTO _ values (DEFAULT);
INSERT INTO _ values (DEFAULT);
INSERT INTO _ values (DEFAULT);
INSERT INTO _ values (DEFAULT);
INSERT INTO _ values (DEFAULT);
INSERT INTO _ values (DEFAULT);
INSERT INTO _ values (DEFAULT);
INSERT INTO _ values (DEFAULT);

SELECT * FROM _;
SELECT * FROM _;
SELECT * FROM _;
SELECT * FROM _;
SELECT * FROM _;
SELECT * FROM _;
SELECT * FROM _;
SELECT * FROM _;
SELECT * FROM _;
SELECT * FROM _;
SELECT * FROM _;
