*ANALISANDO O PERFIL DOS CLIENTES*

**sexo mais predomintante**

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
**agrupando meus clientes por faixa etária**

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
**vendo o total de clientes por estado**

```sql
select estado, count(*) as total_cliente
from endereco e 
group by estado
order by total_cliente desc
limit 10; 
```
**Determinar o cliente mais ativo com base na quantidade de pedidos**

ou seja o que efetuou maior quantidade de pedidos

```sql
SELECT clientes.ID_cliente, clientes.nome_completo, SUM(ITENS_PEDIDO.QTD) AS total_comprado
FROM clientes
JOIN PEDIDO ON clientes.ID_cliente = PEDIDO.ID_cliente
JOIN ITENS_PEDIDO ON PEDIDO.ID_pedido = ITENS_PEDIDO.ID_pedido
GROUP BY clientes.ID_cliente
ORDER BY total_comprado DESC
LIMIT 8;

```
***usando subquery***

```sql
SELECT 
    clientes.ID_cliente, 
    clientes.nome_completo, 
    (
        SELECT SUM(ITENS_PEDIDO.QTD) 
        FROM ITENS_PEDIDO 
        JOIN PEDIDO ON PEDIDO.ID_pedido = ITENS_PEDIDO.ID_pedido 
        WHERE PEDIDO.ID_cliente = clientes.ID_cliente
    ) AS total_comprado
FROM clientes 
ORDER BY total_comprado DESC
LIMIT 10;
```

***usando partition by***

```sql
SELECT 
    clientes.ID_cliente, 
    clientes.nome_completo,
    SUM(ITENS_PEDIDO.QTD) OVER (PARTITION BY clientes.ID_cliente) AS total_comprado
FROM 
    clientes
JOIN 
    PEDIDO ON clientes.ID_cliente = PEDIDO.ID_cliente
JOIN 
    ITENS_PEDIDO ON PEDIDO.ID_pedido = ITENS_PEDIDO.ID_pedido
ORDER BY 
    total_comprado DESC
LIMIT 10;
```
**análisar o cliente que fez o pedido mais alto**

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
LIMIT 1;
```
**análisar o cliente que fez o pedido mais baixo**

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
LIMIT 1;

```

**análisando a média de pedido por cliente**

```sql
	
SELECT 
    clientes.id_cliente,
    clientes.nome_completo,
    Produtos.nome_produto,
    AVG(PEDIDO.total) OVER (PARTITION BY clientes.id_cliente) AS total_pedido
FROM 
    clientes 
JOIN 
    PEDIDO ON clientes.id_cliente = PEDIDO.id_cliente 
JOIN 
    ITENS_PEDIDO  ON PEDIDO.id_pedido = ITENS_PEDIDO.id_pedido 
JOIN 
    Produtos ON ITENS_PEDIDO.id_produto = Produtos.id_produto
ORDER BY 
	total_pedido;
```
**Estado que teve mais pedidos**

esta errado

```sql
SELECT 
    endereco.estado,
    SUM(ITENS_PEDIDO.QTD) OVER (PARTITION BY clientes.ID_cliente) AS total_comprado
FROM 
    endereco 
join
	clientes on endereco.id_cliente = clientes.id_cliente 
JOIN 
    PEDIDO ON clientes.ID_cliente = PEDIDO.ID_cliente
JOIN 
    ITENS_PEDIDO ON PEDIDO.ID_pedido = ITENS_PEDIDO.ID_pedido
ORDER BY 
    total_comprado DESC
LIMIT 10;
```
**produto mais pedido/vendido**
dessa forma esta errada 

```sql
SELECT 
    Produtos.id_produto,
    Produtos.nome_produto,
    SUM(ITENS_PEDIDO.qtd) OVER (PARTITION BY Produtos.id_produto) AS produto_mais_pedido
FROM 
    Produtos  
JOIN 
    ITENS_PEDIDO ON Produtos.id_produto = ITENS_PEDIDO.ID_produto 
ORDER BY 
    produto_mais_pedido DESC;
```

dessa forma esta certa

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

**Receita gerada para cada produto**
pq usar o SUM??
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

```sql

```

```sql

```

```sql

```

```sql

```
