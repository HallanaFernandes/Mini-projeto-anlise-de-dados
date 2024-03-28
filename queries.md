
**Consulta do sexo mais predomintante**

```sql
SELECT 
    sexo,
    COUNT(*) AS total_clientes_sexo
FROM 
    clientes
GROUP BY 
    sexo;
```
**encontrando qual a idade minima e máxima dos meus clientes**

```sql
SELECT 
    MIN(idade) AS menor_idade,
    MAX(idade) AS maior_idade
FROM 
    clientes;
```
**Consulta de cliente por faixa etária**

```sql
SELECT 
    CASE 
        WHEN idade BETWEEN 12 AND 25 THEN '12-25 anos'
        WHEN idade BETWEEN 26 AND 33 THEN '26 -33 anos'
        ELSE 'Outros'
    END AS faixa_etária,
    COUNT(*) AS total_de_clientes_por_idade
FROM clientes c 
GROUP BY 
    faixa_etária;
   
```
**Consulta do total de clientes por estado**

```sql
select estado, count(*) as total_cliente
from endereco e 
group by estado
order by total_cliente desc
limit 10; 
```
**Consulta para ver o cliente mais ativo com base na quantidade de pedidos**

```sql
SELECT clientes.ID_cliente, clientes.nome_completo, SUM(ITENS_PEDIDO.QTD) AS total_de_pedido
FROM clientes
JOIN PEDIDO ON clientes.ID_cliente = PEDIDO.ID_cliente
JOIN ITENS_PEDIDO ON PEDIDO.ID_pedido = ITENS_PEDIDO.ID_pedido
GROUP BY clientes.ID_cliente
ORDER BY total_de_pedido DESC
LIMIT 8;

```
**Consulta do cliente que fez o pedido mais alto**

```sql	
SELECT 
    clientes.id_cliente,
    clientes.nome_completo,
    Produtos.nome_produto,
    SUM(PEDIDO.total) OVER (PARTITION BY clientes.id_cliente) AS total_pedido
FROM 
    clientes 
JOIN 
    PEDIDO ON clientes.id_cliente = PEDIDO.id_cliente 
JOIN 
    ITENS_PEDIDO  ON PEDIDO.id_pedido = ITENS_PEDIDO.id_pedido 
JOIN 
    Produtos ON ITENS_PEDIDO.id_produto = Produtos.id_produto
ORDER BY 
	total_pedido DESC 
LIMIT 3;
```
**Consulta do cliente que fez o pedido mais baixo**

```sql
	
SELECT 
    clientes.id_cliente,
    clientes.nome_completo,
    Produtos.nome_produto,
    SUM(PEDIDO.total) OVER (PARTITION BY clientes.id_cliente) AS total_pedido
FROM 
    clientes 
JOIN 
    PEDIDO ON clientes.id_cliente = PEDIDO.id_cliente 
JOIN 
    ITENS_PEDIDO  ON PEDIDO.id_pedido = ITENS_PEDIDO.id_pedido 
JOIN 
    Produtos ON ITENS_PEDIDO.id_produto = Produtos.id_produto
ORDER BY 
	total_pedido 
LIMIT 3;

```

**Consulta do valor médio de pedido**

```sql
SELECT 
    clientes.ID_cliente, 
    clientes.nome_completo,
    AVG(ITENS_PEDIDO.QTD) AS valor_medio_de_pedido
FROM 
    clientes
JOIN 
    PEDIDO ON clientes.ID_cliente = PEDIDO.ID_cliente
JOIN 
    ITENS_PEDIDO ON PEDIDO.ID_pedido = ITENS_PEDIDO.ID_pedido
GROUP BY 
    clientes.ID_cliente, 
    clientes.nome_completo
order by valor_medio_de_pedido desc;
```

**Consulta do estado que teve mais pedidos**


```sql
SELECT 
    e.estado,
    SUM(ip.qtd) AS total_de_pedido
FROM
    endereco as e 
JOIN 
    clientes as c ON e.id_cliente = c.id_cliente 
JOIN 
    PEDIDO as p ON c.id_cliente = p.id_cliente 
JOIN 
    ITENS_PEDIDO ip ON p.id_pedido = ip.id_pedido 
GROUP BY  
    e.estado;
```

**Consulta do produto mais pedido/vendido**

```sql
SELECT 
    Produtos.id_produto,
    Produtos.nome_produto,
    SUM(ITENS_PEDIDO.qtd) AS produto_mais_pedido
FROM 
    Produtos  
JOIN 
    ITENS_PEDIDO ON Produtos.id_produto = ITENS_PEDIDO.ID_produto 
GROUP BY 
    Produtos.id_produto, Produtos.nome_produto
ORDER BY 
    produto_mais_pedido DESC;
```

**Consulta da receita gerada para cada produto**

```sql

SELECT
    Produtos.nome_produto,
    Produtos.id_produto,
    SUM(Produtos.valor_unitario * ITENS_PEDIDO.qtd) AS total
FROM
    Produtos 
JOIN
    ITENS_PEDIDO ON Produtos.id_produto = ITENS_PEDIDO.id_produto
GROUP BY
    Produtos.nome_produto, Produtos.id_produto 
ORDER BY
    Produtos.id_produto ;
```
**Consulta da frequencia de compra por produto**

```sql
SELECT
    Produtos.id_produto,
    Produtos.nome_produto,
    COUNT(*) AS frequencia_de_compra
FROM
    Produtos
JOIN
    ITENS_PEDIDO ON Produtos.id_produto = ITENS_PEDIDO.id_produto
GROUP BY
    Produtos.id_produto, Produtos.nome_produto
ORDER BY
    frequencia_de_compra DESC;
```
**Consulta do intervalo de compra por cliente**

```sql

SELECT 
	clientes.nome_completo,
	clientes.id_cliente,
	ABS(TIMESTAMPDIFF(MONTH, max(PEDIDO.data_pedido), MIN(PEDIDO.data_pedido))) as intervalo_em_meses_de_compra
FROM
	PEDIDO 
JOIN
	clientes on PEDIDO.id_cliente = clientes.id_cliente 
GROUP BY 
	clientes.id_cliente, clientes.nome_completo
ORDER BY intervalo_em_meses_de_compra DESC ;
```
**Consulta do faturamento de 2023**

```sql
SELECT 
	SUM(total) as faturamento_2023
FROM
	PEDIDO p 
```
**Consulta do faturamento por mês**

```sql
SELECT 
    MONTH(data_pedido) AS mes,
    YEAR(data_pedido) AS ano,
    SUM(total) AS faturamento
FROM 
    PEDIDO
GROUP BY 
    MONTH(data_pedido), YEAR(data_pedido)
ORDER BY 
    ano, mes;
```

**Consulta do valor liquido por pedido**

```sql
SELECT
    PEDIDO.ID_PEDIDO,
    PEDIDO.TOTAL AS total_vendas,
    SUM(custo_do_produto.custo_unitario) AS custo_unitario_total,
    (PEDIDO.TOTAL - SUM(custo_do_produto.custo_unitario)) AS lucro_liquido
FROM
    PEDIDO
JOIN
    ITENS_PEDIDO ON PEDIDO.ID_PEDIDO = ITENS_PEDIDO.id_pedido
JOIN
    custo_do_produto ON ITENS_PEDIDO.id_produto = custo_do_produto.id_produto
GROUP BY
    PEDIDO.ID_PEDIDO, PEDIDO.TOTAL;
```


**Consulta do valor liquido total do ano de 2023**

```sql
SELECT
    SUM(lucro_liquido) AS lucro_liquido_total
FROM (
    SELECT
        PEDIDO.ID_PEDIDO,
        PEDIDO.TOTAL AS total_vendas,
        SUM(custo_do_produto.custo_unitario) AS custo_unitario_total,
        (PEDIDO.TOTAL - SUM(custo_do_produto.custo_unitario)) AS lucro_liquido
    FROM
        PEDIDO
    JOIN
        ITENS_PEDIDO ON PEDIDO.ID_PEDIDO = ITENS_PEDIDO.id_pedido
    JOIN
        custo_do_produto ON ITENS_PEDIDO.id_produto = custo_do_produto.id_produto
    GROUP BY
        PEDIDO.ID_PEDIDO, PEDIDO.TOTAL
) AS lucro_por_pedido;

```

--- view clientes por sexo
--- view_faixa_etaria_clientes