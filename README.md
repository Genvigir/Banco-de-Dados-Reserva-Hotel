# Banco de Dados para Reserva de Quartos em Hotel

Este projeto consiste na modelagem de um **banco de dados relacional** para gerenciar o sistema de reservas de um hotel. O objetivo é garantir um controle eficiente das reservas, hóspedes, funcionários e tipos de quartos disponíveis.

## Estrutura do Banco de Dados

O banco de dados foi projetado com as seguintes tabelas principais:

### 1. **tipoquarto**
Armazena informações sobre os diferentes tipos de quartos disponíveis no hotel.
- `id` (BIGINT) - Identificador único do tipo de quarto.
- `nome_quarto` (VARCHAR) - Nome do tipo de quarto.
- `valor_diaria` (DECIMAL) - Valor da diária do tipo de quarto.

### 2. **quarto**
Registra os detalhes individuais de cada quarto.
- `numero_quarto` (BIGINT) - Número único do quarto.
- `quantidade_camas` (INT) - Quantidade de camas disponíveis no quarto.
- `tipoquarto_id` (BIGINT) - Relacionamento com a tabela **tipoquarto**.
- `valor_quarto_id` (BIGINT) - Referência ao valor da diária do quarto.

### 3. **hospede**
Contém informações sobre os hóspedes do hotel.
- `id` (BIGINT) - Identificador único do hóspede.
- `primeiro_nome` (VARCHAR) - Nome do hóspede.
- `ultimo_nome` (VARCHAR) - Sobrenome do hóspede.
- `celular` (VARCHAR) - Número de telefone do hóspede.
- `email` (VARCHAR) - Endereço de e-mail do hóspede.

### 4. **funcionario**
Registra informações dos funcionários responsáveis pelo hotel.
- `id` (BIGINT) - Identificador único do funcionário.
- `primeiro_nome` (VARCHAR) - Nome do funcionário.
- `ultimo_nome` (VARCHAR) - Sobrenome do funcionário.
- `celular` (VARCHAR) - Número de telefone do funcionário.
- `email` (VARCHAR) - Endereço de e-mail do funcionário.
- `gerente_id` (BIGINT) - Identificação do gerente responsável.

### 5. **reserva**
Gerencia as reservas feitas pelos hóspedes.
- `codigo_reserva` (BIGINT) - Código único da reserva.
- `check_in` (DATE) - Data de entrada do hóspede.
- `check_out` (DATE) - Data de saída do hóspede.
- `numero_adultos` (INT) - Número de adultos na reserva.
- `numero_criancas` (INT) - Número de crianças na reserva.
- `hospede_id` (BIGINT) - Referência ao hóspede que fez a reserva.
- `numero_quarto` (BIGINT) - Quarto reservado.
- `funcionario_id` (BIGINT) - Funcionário responsável pelo cadastro da reserva.

## Relacionamentos
- A tabela **quarto** está vinculada à tabela **tipoquarto**.
- A tabela **reserva** referencia **hospede**, **quarto** e **funcionario**.
- A tabela **funcionario** possui um relacionamento hierárquico com o próprio gerente.

Este banco de dados fornece uma base sólida para a gestão de reservas em um hotel, permitindo um controle eficiente das informações e garantindo uma experiência mais organizada para hóspedes e funcionários.
