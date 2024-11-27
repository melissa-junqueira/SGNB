DROP DATABASE bd_sgnb;
CREATE DATABASE bd_sgnb;
USE bd_sgnb;

CREATE TABLE tb_cliente (
	cliente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL
);

CREATE TABLE tb_loja (
	loja_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL
);

CREATE TABLE tb_agendamento (
	agendamento_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES tb_cliente (cliente_id),
    loja_id INT NOT NULL,
    FOREIGN KEY (loja_id) REFERENCES tb_loja (loja_id),
    dia INT NOT NULL,
    mes INT NOT NULL,
    hora INT NOT NULL
);

CREATE TABLE tb_servico (
	servico_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    loja_id INT NOT NULL,
    FOREIGN KEY (loja_id) REFERENCES tb_loja (loja_id),
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    valor INT NOT NULL
);

CREATE TABLE tb_fornecedor (
	fornecedor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL
);

CREATE TABLE tb_peca (
	peca_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fornecedor_id INT NOT NULL,
    FOREIGN KEY (fornecedor_id) REFERENCES tb_fornecedor (fornecedor_id),
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    estoque INT NOT NULL,
    valor DOUBLE NOT NULL
);

CREATE TABLE tb_venda (
	venda_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    servico_id INT NOT NULL,
    FOREIGN KEY (servico_id) REFERENCES tb_servico (servico_id),
    peca_id INT NOT NULL,
    FOREIGN KEY (peca_id) REFERENCES tb_peca (peca_id),
    quantidade INT NOT NULL
);