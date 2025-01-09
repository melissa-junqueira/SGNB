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
   cnpj VARCHAR(18),
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

INSERT INTO tb_loja(nome_loja, senha) values ("Loja1234", "senha1234");
INSERT INTO tb_cliente(nome_cliente, telefone_cliente, email_cliente) values ("Cliente1234","0000000-00","emailgenerico1234@gmail.com");
INSERT INTO tb_bicicleta(nome_bike, marca_bike, cor, aro, classificacao, peso, preco) values ("Bicicleta Padrão", "Marca Genérica", "Vermelha", "20", "Adulto", "8Kg", '100.0');
INSERT INTO tb_endereco(cep, rua, bairro, numero, complemento, cidade, estado, pais) values ("00000-000","Rua 000", "Bairro 0", "n° 000", "~", "Cidade", "Estado", "País");
INSERT INTO tb_fornecedor(id_endereco, nome_fornecedor, telefone_fornecedor, cnpj, email_fornecedor) values (1, "Fornecedor X", "0000000-00", "00.000.000/0000-00", "emailgenerico123@gmail.com");
INSERT INTO tb_peca(id_fornecedor, nome_peca, marca_peca, valor_uni, descricao_peca) values (1, "Peça Padrão", "Marca Genérica", '0.45', "Uma peça qualquer.");
INSERT INTO tb_agendamento(id_cliente, data_hora_Ag, descricao_Ag) values (1, "2025-01-01 20:10:00", "Agendamento para Montagem de Bicicleta.");
INSERT INTO tb_servico(id_agendamento, id_peca, nome_Serv, data_hora_Serv, qntd_peca, valor_total_Ser) values (1, 1, "Montagem", "2025-01-01 20:10:00", 2, '45.0');
INSERT INTO tb_compra(id_cliente, id_bicicleta, data_hora_Comp, valor_total_Comp) values (1, 1, "2025-01-01 20:10:00", '100.0');
INSERT INTO tb_registro(id_compra, data_hora_compra) values (1, "2025-01-01 20:10:00");
INSERT INTO tb_estoque(id_loja,id_peca,id_bicicleta) values (1, 1, 1);

SELECT * FROM tb_loja;
SELECT * FROM tb_cliente;
SELECT * FROM tb_bicicleta;
SELECT * FROM tb_endereco;
SELECT * FROM tb_fornecedor;
SELECT * FROM tb_peca;
SELECT * FROM tb_agendamento;
SELECT * FROM tb_servico;
SELECT * FROM tb_compra;
SELECT * FROM tb_registro;
SELECT * FROM tb_estoque;
