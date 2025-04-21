CREATE DATABASE RECYCL;
USE RECYCL;

CREATE TABLE users(
    usr_id VARCHAR(36) PRIMARY KEY,
    usr_nome VARCHAR(70) NOT NULL,
    usr_cpf CHAR(14) NOT NULL UNIQUE,
    usr_email VARCHAR(50) NOT NULL UNIQUE,
    usr_saldo DECIMAL(10,2) NOT NULL
);

CREATE TABLE seguranca(
    seg_senha CHAR(128) PRIMARY KEY, -- SHA512(SALT + INPUTED SENHA)
    seg_salt CHAR(16) NOT NULL,
    seg_antiphishing VARCHAR(150),
    seg_telefone INT NOT NULL,
    usr_id VARCHAR(36) NOT NULL UNIQUE,
    FOREIGN KEY (usr_id) REFERENCES users(usr_id)
);


CREATE TABLE materiais_reciclaveis(
    mat_id INT(5) PRIMARY KEY,
    mat_nome VARCHAR(70) NOT NULL,
    mat_valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE tipos_transacao(
    tip_id CHAR(1) PRIMARY KEY,
    tip_tipo VARCHAR(20) NOT NULL
);

CREATE TABLE transacoes (
    tra_id INT(10) PRIMARY KEY,
    usr_id VARCHAR(36) NOT NULL,
    tip_id CHAR(1) NOT NULL,
    tra_valor DECIMAL(10,2) NOT NULL,
    tra_data DATE NOT NULL,
    FOREIGN KEY (usr_id) REFERENCES users(usr_id),
    FOREIGN KEY (tip_id) REFERENCES tipos_transacao(tip_id)
);

CREATE TABLE historico_avaliacoes(
    his_id INT(7) PRIMARY KEY,
    his_avaliador INT (7) NOT NULL,
    his_avaliado INT(7) NOT NULL,
    his_comentario VARCHAR(500) NOT NULL,
    his_classificacao CHAR(1) NOT NULL
);

CREATE TABLE produtos(
    pro_id INT(7) PRIMARY KEY,
    pro_nome VARCHAR(100) NOT NULL,
    pro_descricao VARCHAR(500),
    pro_preco DECIMAL(10,2) NOT NULL,
    pro_estoque INT(10) NOT NULL
);

CREATE TABLE trocas_materiais(
    trm_ID INT(10) PRIMARY KEY,
    usr_id VARCHAR(36) NOT NULL,
    mat_id INT(7) NOT NULL,
    trm_quantidade DECIMAL(10,2) NOT NULL,
    trm_DATA DATE NOT NULL,
    FOREIGN KEY (usr_id) REFERENCES users(usr_id),
    FOREIGN KEY (mat_id) REFERENCES materiais_reciclaveis(mat_id)
);

CREATE TABLE trocas_seeds(
    trs_ID INT(10) PRIMARY KEY,
    usr_id_origem VARCHAR(36) NOT NULL,
    usr_id_destino VARCHAR(36) NOT NULL,
    trs_quantidade DECIMAL(10,2) NOT NULL,
    trs_data DATE NOT NULL,
    FOREIGN KEY (usr_id_origem) REFERENCES users(usr_id),
    FOREIGN KEY (usr_id_destino) REFERENCES users(usr_id)
);
