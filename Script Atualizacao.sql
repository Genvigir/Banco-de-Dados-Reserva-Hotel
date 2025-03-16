-- Atualização de dados Hotel --
use Hotel;

-- A troca do tipo de quarto de ao menos uma reserva --
UPDATE reserva
SET numero_quarto = 301  
WHERE codigo_reserva = 4; 
 
-- Troca de gerente e recepcionista --
UPDATE funcionario
SET gerente_id = 2
WHERE gerente_id = 1;
UPDATE funcionario
SET gerente_id = 2
WHERE id = 2;
UPDATE funcionario
SET gerente_id = 2
WHERE id = 1;

-- O cancelamento de no mínimo uma reserva --
DELETE FROM reserva
WHERE codigo_reserva = 6;

-- A alteração do período de ao menos uma reserva --
UPDATE reserva
SET check_in = '2024-09-17',  
    check_out = '2024-09-22'  
WHERE codigo_reserva = 7;  