CREATE DATABASE IF NOT EXISTS fin;

USE fin;

CREATE TABLE IF NOT EXISTS tb_accounts (
    id VARCHAR(36) NOT NULL PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    balance FLOAT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tb_transactions (
    id VARCHAR(36) NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    amount FLOAT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    account_id VARCHAR(36) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_accounts_transactions FOREIGN KEY (account_id) 
    REFERENCES tb_accounts(id)
);

INSERT INTO tb_accounts (id, name, balance) VALUES 
    ('1', 'BRADESCO', 1000.0),
    ('2', 'ITAU', 1500.0);

INSERT INTO tb_transactions (id, name, description, category, amount, type, account_id) VALUES
    ('2', 'Salario', 'Salario', 'SALARIO', 3000, 'CREDITO', 2),
    ('3', 'Condominio', 'Moradia', 'CASA', -400, 'DEBITO', 1),
    ('4', 'Internet', 'Internet', 'CASA', -100, 'DEBITO', 1),
    ('5', 'Telefone', 'Telefone', 'CASA', -40, 'DEBITO', 1),
    ('6', 'TV por assinatura', 'TV por assinatura', 'CASA', 70, 'DEBITO', 1),
    ('7', 'Transferencia BRADESCO', 'Tranferencia Bradesco', 'Finanças', -2000, 'DEBITO', 2),
    ('8', 'Credito ITAU', 'Credito ITAU', 'Financas', 2000, 'CREDITO', 1),
    ('9', 'Adiantamento 13', 'Adiantamento 13 Salario', 'SALARIO', 2500, 'DEBITO', 2),
    ('10', 'Adiantamento Salario', 'Adiantamento Salario', 'SALARIO', 2000, 'DEBITO', 2),
    ('11', 'Telefone Celular', 'Telefone Celular', 'TELEFONIA', -50, 'DEBITO', 1),
    ('12', 'Supermercado', 'Supermercado', 'CASA',- 900, 'DEBITO', 1),
    ('13', 'Alimentacao', 'Alimentacao', 'ALIMENTACAO', -500, 'DEBITO', 1);
