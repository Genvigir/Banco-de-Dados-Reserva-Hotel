create database Hotel;
use Hotel;
 
CREATE TABLE funcionario (
    id BIGINT PRIMARY KEY,
    primeiro_nome VARCHAR(50) NOT NULL CHECK (primeiro_nome <> ''),
    ultimo_nome VARCHAR(50) NOT NULL CHECK (ultimo_nome <> ''),
    celular VARCHAR(20) NOT NULL CHECK (celular <> ''),
    email VARCHAR(100),
    gerente_id BIGINT NOT NULL,
    FOREIGN KEY (gerente_id) REFERENCES funcionario(id)
);

CREATE TABLE hospede (
    id BIGINT PRIMARY KEY,
    primeiro_nome VARCHAR(50) NOT NULL CHECK (primeiro_nome <> ''),
    ultimo_nome VARCHAR(50) NOT NULL  CHECK (ultimo_nome <> ''),
    celular VARCHAR(20) NOT NULL CHECK (celular <> ''),
    email VARCHAR(100)
);

CREATE TABLE tipoquarto (
    id BIGINT PRIMARY KEY,
    nome_quarto VARCHAR(50) NOT NULL CHECK (nome_quarto <> ''),
    valor_diaria DECIMAL(10,2) NOT NULL CHECK (valor_diaria > 0)
);

CREATE TABLE quarto (
    numero_quarto BIGINT PRIMARY KEY,
    quantidade_camas INT NOT NULL CHECK (quantidade_camas > 0),
    tipoquarto_id BIGINT NOT NULL,
    FOREIGN KEY (tipoquarto_id) REFERENCES tipoquarto(id)
);

CREATE TABLE reserva (
    codigo_reserva BIGINT PRIMARY KEY,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    numero_adultos INT NOT NULL CHECK (numero_adultos > 0),
    numero_criancas INT NOT NULL CHECK (numero_criancas >= 0),
    funcionario_id BIGINT NOT NULL,
    hospede_id BIGINT NOT NULL,
    numero_quarto BIGINT NOT NULL, 
    FOREIGN KEY (hospede_id) REFERENCES hospede(id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id),
    FOREIGN KEY (numero_quarto) REFERENCES quarto(numero_quarto)  
);
