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


```sql

```


```sql

```
