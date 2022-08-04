-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)

SELECT 
	*
FROM
	pedidos
    JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
    JOIN produtos ON produtos.id = produtos_pedidos.produto_id;

-- 2)

SELECT
	pedidos.id
FROM
	pedidos
    JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
    JOIN produtos ON produtos.id = produtos_pedidos.produto_id
    WHERE produtos.nome = 'Fritas';

-- 3)

SELECT
	clientes.nome AS gostam_de_fritas
FROM
	clientes
    JOIN pedidos ON clientes.id = pedidos.cliente_id
    JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
    JOIN produtos ON produtos.id = produtos_pedidos.produto_id
    WHERE produtos.nome = 'Fritas';

-- 4)

SELECT 
	SUM(produtos."preço")
FROM    
	produtos
    JOIN produtos_pedidos ON produtos.id = produtos_pedidos.produto_id
    JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
    JOIN clientes ON clientes.id = pedidos.cliente_id
    WHERE clientes.nome = 'Laura';

-- 5)

SELECT
	produtos.nome,
    COUNT(*)
FROM
	produtos
    JOIN produtos_pedidos ON produtos.id = produtos_pedidos.produto_id
    JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
GROUP BY
	produtos.nome
ORDER BY
	produtos.nome;