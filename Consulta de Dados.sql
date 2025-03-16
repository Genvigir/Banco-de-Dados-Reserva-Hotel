-- Consulta de dados Hotel --
use Hotel;

-- Listar todos os recepcionistas que efetuaram ao menos uma reserva --
SELECT DISTINCT f.id, f.primeiro_nome, f.ultimo_nome, f.celular, f.email
FROM funcionario f
JOIN reserva r ON f.id = r.funcionario_id;

-- Listar todos os recepcionistas que não efetuaram nenhuma reserva --
SELECT f.id, f.primeiro_nome, f.ultimo_nome, f.celular, f.email
FROM funcionario f
LEFT JOIN reserva r ON f.id = r.funcionario_id
WHERE r.funcionario_id IS NULL;

-- Listar os dados de todos os hóspedes que realizaram mais de uma reserva, --
-- bem como os dados do quarto e do(a) recepcionista que fez as respectivas reservas --

WITH HospedesComMaisReservas AS (
    SELECT h.id AS hospede_id
    FROM hospede h
    JOIN reserva r ON h.id = r.hospede_id
    GROUP BY h.id
    HAVING COUNT(r.codigo_reserva) > 1
)

SELECT h.id AS hospede_id, h.primeiro_nome AS hospede_primeiro_nome, h.ultimo_nome AS hospede_ultimo_nome,
       q.numero_quarto, q.quantidade_camas,
       f.id AS funcionario_id, f.primeiro_nome AS funcionario_primeiro_nome, f.ultimo_nome AS funcionario_ultimo_nome
FROM HospedesComMaisReservas hcr
JOIN reserva r ON hcr.hospede_id = r.hospede_id
JOIN hospede h ON r.hospede_id = h.id
JOIN quarto q ON r.numero_quarto = q.numero_quarto
JOIN funcionario f ON r.funcionario_id = f.id;

-- Listar os dados do hóspede com o maior número de reservas --

WITH max_reservas AS (
    SELECT COUNT(r.codigo_reserva) AS total_reservas
    FROM hospede h
    JOIN reserva r ON h.id = r.hospede_id
    GROUP BY h.id
)

SELECT h.*, COUNT(r.codigo_reserva) AS total_reservas
FROM hospede h
JOIN reserva r ON h.id = r.hospede_id
GROUP BY h.id, h.primeiro_nome, h.ultimo_nome, h.celular, h.email 
HAVING COUNT(r.codigo_reserva) = (SELECT MAX(total_reservas) FROM max_reservas);


-- Listar os dados do quarto que mais foi reservado --
SELECT q.numero_quarto, q.quantidade_camas, COUNT(r.numero_quarto) AS total_reservas
FROM quarto q
JOIN reserva r ON q.numero_quarto = r.numero_quarto
GROUP BY q.numero_quarto
HAVING COUNT(r.numero_quarto) = (
    SELECT MAX(total_reservas)
    FROM (
        SELECT COUNT(r.numero_quarto) AS total_reservas
        FROM quarto q
        JOIN reserva r ON q.numero_quarto = r.numero_quarto
        GROUP BY q.numero_quarto
    ) AS subquery
)
ORDER BY q.numero_quarto;

-- Listar o maior valor total de uma reserva (considerando o valor da diária, o período e o número de adultos), -- 
-- apresentando os dados da reserva e o valor total --

SELECT r.codigo_reserva, r.check_in, r.check_out, r.numero_adultos, 
       tq.nome_quarto, tq.valor_diaria, 
       (DATEDIFF(r.check_out, r.check_in) * tq.valor_diaria * r.numero_adultos) AS valor_total
FROM reserva r
JOIN quarto q ON r.numero_quarto = q.numero_quarto
JOIN tipoquarto tq ON q.tipoquarto_id = tq.id
ORDER BY valor_total DESC
LIMIT 1;

-- Listar os dados dos quartos com o maior número de camas --
SELECT q.numero_quarto, q.quantidade_camas, tq.nome_quarto, tq.valor_diaria
FROM quarto q
JOIN tipoquarto tq ON q.tipoquarto_id = tq.id
WHERE q.quantidade_camas = (
    SELECT MAX(quantidade_camas)
    FROM quarto
)
