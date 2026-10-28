use show_pass;

INSERT INTO cliente (nome_completo, cpf, email, fone, data_cadastro) VALUES
('Carlos Eduardo Silva', '111.222.333-44', 'carlos.silva@email.com', '(11) 98765-4321', '2026-01-10 10:00:00'),
('Mariana Souza Lima', '222.333.444-55', 'mariana.lima@email.com', '(21) 99876-5432', '2026-01-15 14:30:00'),
('Roberto Alves Mendes', '333.444.555-66', 'roberto.mendes@email.com', '(31) 97654-3210', '2026-02-01 09:15:00'),
('Fernanda Costa Rocha', '444.555.666-77', 'fernanda.rocha@email.com', '(41) 96543-2109', '2026-02-10 16:45:00'),
('Lucas Pereira Gomez', '555.666.777-88', 'lucas.gomez@email.com', '(51) 95432-1098', '2026-02-20 11:20:00');

INSERT INTO arena (nome, endereco, cidade, estado, capacidade_total) VALUES
('Allianz Parque', 'Av. Francisco Matarazzo, 1705', 'São Paulo', 'SP', 45000),
('Maracanã', 'Av. Maracanã, s/n', 'Rio de Janeiro', 'RJ', 78000),
('Mineirão', 'Av. Antônio Abrahão Caram, 1001', 'Belo Horizonte', 'MG', 62000),
('Ligga Arena', 'Rua Buenos Aires, 1260', 'Curitiba', 'PR', 42000),
('Arena do Grêmio', 'Av. Padre Leopoldino Brentano, 110', 'Porto Alegre', 'RS', 55000);

INSERT INTO setores (id_arena, nome_setor, descricao) VALUES
(1, 'Pista Premium', 'Área em frente ao palco principal'),
(1, 'Cadeira Inferior', 'Cadeiras cobertas nível intermediário'),
(2, 'Maracanã Mais', 'Setor VIP com serviço de buffet'),
(3, 'Arquibancada Amarela', 'Setor popular central'),
(4, 'Setor VIP Central', 'Visão central privilegiada');

INSERT INTO assentos (id_setores, codigo_assento, fuleira, numero) VALUES
(1, 'PP-A01', 'A', 1),
(1, 'PP-A02', 'A', 2),
(2, 'CI-B10', 'B', 10),
(3, 'MM-C05', 'C', 5),
(4, 'AA-D15', 'D', 15),
(5, 'VC-E01', 'E', 1);

INSERT INTO eventos (id_arena, nome_evento, categoria, data_hora, status) VALUES
(1, 'Rock World Tour 2026', 'Show', '2026-11-15 21:00:00', 'Confirmado'),
(2, 'Final da Copa Clássica', 'Futebol', '2026-12-05 16:00:00', 'Confirmado'),
(3, 'Festival Pop Brasil', 'Festival', '2026-11-20 18:00:00', 'Confirmado'),
(4, 'Symphonic Metal Night', 'Show', '2026-11-28 20:30:00', 'Confirmado'),
(5, 'Espetáculo de Dança Modern', 'Teatro', '2026-12-10 19:00:00', 'Confirmado');

INSERT INTO precos_setor (id_evento, id_setores, valor) VALUES
(1, 1, 600.00),
(1, 2, 350.00),
(2, 3, 450.00),
(3, 4, 200.00),
(4, 5, 500.00);

INSERT INTO vendas (id_cliente, data_venda, valor_total, forma_pagamento, status_venda) VALUES
(1, '2026-10-01 10:15:00', 1200.00, 'Cartão de Crédito', 'Aprovada'),
(2, '2026-10-02 11:30:00', 350.00, 'PIX', 'Aprovada'),
(3, '2026-10-03 15:45:00', 450.00, 'Cartão de Débito', 'Aprovada'),
(4, '2026-10-04 09:20:00', 200.00, 'PIX', 'Aprovada'),
(5, '2026-10-05 14:10:00', 500.00, 'Boleto Bancário', 'Aprovada');

INSERT INTO ingressos (id_venda, id_evento, id_assentos, id_preco, codigo_qr, status_ingresso) VALUES
(1, 1, 1, 1, 'QR-ROCK2026-001', 'Valido'),
(1, 1, 2, 1, 'QR-ROCK2026-002', 'Valido'),
(2, 1, 3, 2, 'QR-ROCK2026-003', 'Valido'),
(3, 2, 4, 3, 'QR-FUT2026-001', 'Valido'),
(4, 3, 5, 4, 'QR-FEST2026-001', 'Valido'),
(5, 4, 6, 5, 'QR-METAL2026-001', 'Valido');

-- Pesquisas --
select * from cliente;

select * from arena;

select * from assentos;

select * from eventos;

select * from ingressos;

select * from precos_setor;

select * from setores;

select * from vendas;

-- Listagem de eventos filtrados por estado da arena (INNER JOIN, WHERE)
SELECT e.nome_evento, e.categoria, e.data_hora, a.nome AS arena, a.cidade, a.estado FROM eventos e
INNER JOIN arena a ON e.id_arena = a.id_arena WHERE a.estado = 'SP';

-- Busca de clientes por domínio de e-mail (LIKE, ORDER BY)
SELECT id_cliente, nome_completo, email, fone FROM cliente
WHERE email LIKE '%@email.com' ORDER BY nome_completo ASC;

-- Faturamento bruto total por evento (SUM, GROUP BY, ORDER BY)
SELECT e.nome_evento, COUNT(i.id_ingresso) AS total_ingressos_vendidos, SUM(p.valor) AS faturamento_total
FROM ingressos i INNER JOIN eventos e ON i.id_evento = e.id_evento INNER JOIN precos_setor p ON i.id_preco = p.id_preco
GROUP BY e.id_evento, e.nome_evento ORDER BY faturamento_total DESC;

-- Vendas realizadas em um intervalo de datas (BETWEEN)
SELECT v.id_venda, c.nome_completo AS cliente, v.data_venda, v.valor_total, v.forma_pagamento
FROM vendas v INNER JOIN cliente c ON v.id_cliente = c.id_cliente WHERE v.data_venda BETWEEN '2026-10-01 00:00:00' AND '2026-10-03 23:59:59';

-- Eventos com faturamento acumulado superior a R$ 400,00 (HAVING)
SELECT e.nome_evento, SUM(p.valor) AS receita_total FROM ingressos i INNER JOIN eventos e ON i.id_evento = e.id_evento
INNER JOIN precos_setor p ON i.id_preco = p.id_preco GROUP BY e.id_evento, e.nome_evento HAVING SUM(p.valor) > 400.00;

-- Compras contendo mais de 1 ingresso no mesmo pedido (COUNT, HAVING)
SELECT v.id_venda, c.nome_completo AS cliente, COUNT(i.id_ingresso) AS quantidade_ingressos
FROM vendas v INNER JOIN cliente c ON v.id_cliente = c.id_cliente INNER JOIN ingressos i ON v.id_venda = i.id_venda
GROUP BY v.id_venda, c.nome_completo HAVING COUNT(i.id_ingresso) > 1;

-- Quantidade total de eventos cadastrados por categoria (COUNT, GROUP BY)
SELECT categoria, COUNT(*) AS total_eventos FROM eventos
GROUP BY categoria ORDER BY total_eventos DESC;


