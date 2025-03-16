-- Inserção de dados Hotel --
use Hotel;

-- Tipos de Quarto -- 
INSERT INTO tipoquarto (id, nome_quarto, valor_diaria)
VALUES
(1, "Executivo", 300),
(2, "Luxo", 500),
(3, "Superluxo", 700);

-- Os dados de 9 quartos (3 para cada tipo de quarto) --
INSERT INTO quarto (numero_quarto, quantidade_camas, tipoquarto_id)
VALUES 
(101, 1, 1),
(102, 2, 1),
(103, 3, 1),
(201, 1, 2),
(202, 2, 2),
(203, 3, 2),
(301, 1, 3),
(302, 2, 3),
(303, 3, 3);

-- Os dados de de 4 recepcionistas e 1 gerente --
INSERT INTO funcionario (id, primeiro_nome, ultimo_nome, celular, email, gerente_id)
VALUES
(1, 'Carlos', 'Silva', '11987654321', 'carlos.silva@email.com', 1),
(2, 'Ana', 'Oliveira', '11976543210', 'ana.oliveira@email.com', 1),
(3, 'Bruno', 'Santos', '72965432109', 'bruno.santos@email.com', 1),
(4, 'Mariana', 'Costa', '69954321098', NULL, 1),
(5, 'Fernanda', 'Pereira', '99943210987', 'fernanda.pereira@email.com', 1);

-- Os dados de 6 hóspedes --
INSERT INTO hospede (id, primeiro_nome, ultimo_nome, celular, email)
VALUES
(1, 'Lucas', 'Ferreira', '43987654321', 'lucas.ferreira@email.com'),
(2, 'Juliana', 'Moura', '14976543210', 'juliana.moura@email.com'),
(3, 'Ricardo', 'Almeida', '55965432109', NULL),
(4, 'Patrícia', 'Lopes', '11954321098', 'patricia.lopes@email.com'),
(5, 'Renato', 'Souza', '43943210987', NULL),
(6, 'Carla', 'Ramos', '12932109876', 'carla.ramos@email.com');

-- Os dados de 10 reservas --
INSERT INTO reserva (codigo_reserva, check_in, check_out, numero_adultos, numero_criancas, funcionario_id, hospede_id, numero_quarto)
VALUES
(1, '2024-08-15', '2024-08-20', 2, 0, 1, 1, 101),  
(2, '2024-08-21', '2024-08-25', 2, 1, 2, 2, 102),  
(3, '2024-08-26', '2024-08-29', 1, 2, 2, 3, 103),  
(4, '2024-09-01', '2024-09-05', 2, 0, 3, 4, 201),  
(5, '2024-09-06', '2024-09-10', 2, 1, 1, 5, 202),  
(6, '2024-09-11', '2024-09-14', 1, 0, 3, 6, 301),  
(7, '2024-09-15', '2024-09-20', 2, 0, 1, 2, 302),  
(8, '2024-09-21', '2024-09-25', 1, 1, 3, 4, 101), 
(9, '2024-09-26', '2024-09-30', 2, 0, 2, 1, 201),  
(10, '2024-10-01', '2024-10-05', 2, 2, 3, 3, 202);  

/* ----------------------------------------------------------
Quarto 203 (Luxo) e Quarto 303 (Superluxo) não terão reservas.
Funcionários (id 5 e id 4) não realizaram nenhuma reserva.
Hóspedes (id 1, id 2, id 3 e id 4) fizeram duas reservas.
-------------------------------------------------------------- */