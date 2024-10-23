-- LISTA DE EXERCÍCIOS - SQL

-- 01) Listar todos os produtos com as respectivas descrições, unidades e valores unitários, obtendo o seguinte resultado:

SELECT descricao, unidade, valor_unitario
FROM produtos;

SELECT *
FROM produtos;

-- 02) Listar todo o conteúdo de vendedor, obtendo o seguinte resultado, usando *:

SELECT *
FROM vendedores;

-- 03) Listar da tabela CLIENTE o CNPJ, o nome do cliente e seu endereço, obtendo o seguinte resultado:

SELECT cnpj, nome, endereco
FROM clientes; 

-- 04) Listar todas as cidades em que há clientes

SELECT DISTINCT cidade
FROM clientes;

-- 05) Listar todas as cidades e estados em que há clientes

SELECT DISTINCT cidade, uf
FROM clientes;

-- 06) Quais são os clientes que moram em Niterói?

SELECT nome, cidade
FROM clientes
WHERE cidade = 'Niteroi';
-- WHERE cidade = 'Niteroi' || cidade = 'Brasilia';
-- WHERE cidade = 'Niteroi' AND nome = 'Ana';
-- WHERE cidade = 'Niteroi' && nome = 'Ana';

-- 07) Listar os produtos que tenham unidade igual a ‘M’ e valor unitário igual a R$ 1,05 da tabela produto:

SELECT descricao
FROM produtos
WHERE unidade = 'M' AND valor_unitario = 1.05;

-- 08) Listar o código, a descrição e o valor unitario dos produtos que tenham o valor unitário na faixa de R$ 0,32 até R$ 2,00:

SELECT descricao, valor_unitario
FROM produtos
WHERE valor_unitario BETWEEN 0.32 AND 2.00;

-- 09) Listar oo código, a descrição e o valor unitario dos produtos que NÃO tenham o valor unitário na faixa de R$ 0,32 até R$ 2,00:

SELECT id, descricao, valor_unitario
FROM produtos
WHERE NOT valor_unitario BETWEEN 0.32 AND 2.00;

-- 10) Listar os nomes entre Ana e Jorge

SELECT nome
FROM clientes
WHERE nome BETWEEN 'Ana' AND 'Jorge';

-- 11) Listar Listar os vendedores com faixas de comissão A ou B

SELECT *
FROM vendedores
WHERE faixa_comissao IN ('A', 'B');

-- 12) Listar todos os clientes SEM Inscrição Estadual (IE)

SELECT *
FROM  clientes
WHERE ie IS NULL;

-- 13) Listar todos os clientes COM Inscrição Estadual (IE)

SELECT *
FROM  clientes
WHERE ie IS NOT NULL;

-- 14) Listar apenas os dois primeiros vendedores

SELECT *
FROM  vendedores
LIMIT 2;

-- 15) Listar todos os produtos que tenham o seu nome começando por Q:

SELECT *
FROM  produtos
WHERE nome LIKE 'Q%';

-- 16) Listar os vendedores que não começam por ‘Jo’:

SELECT *
FROM  vendedores
WHERE NOT nome LIKE 'Jo%';

-- 17) Listar todos os produtos cujo nome termina com 's';

SELECT *
FROM  produtos
WHERE nome LIKE '%s';

-- 18) Listar os produtos que contenham as letras "inh"

SELECT *
FROM  produtos
WHERE produtos LIKE '%inh&';

-- 19) Listar os chocolates e valores 




-- 20) Listar os vendedores cuja segunda letra do nome seja 'a'

SELECT *
FROM  vendedores
WHERE nome LIKE '_a%';


-- ORDER BY
-- 01) Listar todos os vendedores ordenados por nome

SELECT *
FROM  vendedores
ORDER BY nome;

-- 02) Listar todos os vendedores ordenados por nome de forma decrescente

SELECT *
FROM  vendedores
ORDER BY nome DESC; 

-- 03) Listar todos os vendedores ordenados por nome e salario 

SELECT *
FROM  vendedores
ORDER BY nome, salario; 

-- 04) Listar todos os clientes com seus estados, sendo que o estado deverá ser ordenado em ordem crescente e o nome por ordem descrescente
-- 05) Listar todos os vendedores que ganham MENOS de 1000 reais e apresentar em ordem crescente
-- 06) Listar os vendedores que não começam por ‘Jo’ e apresentar ordenado de forma decrescente


-- FUNÇÕES COUNT(), AVG(), SUM(), MIN() e MAX()
-- 01)Informe quantos clientes foram cadastrados

SELECT COUNT(*)
FROM clientes;

-- 02)Informe quantos produtos tem valor unitário abaixo de 0.50 centavos

SELECT COUNT(*)
FROM clientes
WHERE valor_unitario <= 0.50;

-- 03)Informe a média de salario dos vendedores

SELECT AVG(salario)
FROM vendedores;

-- 04)Informe a média de valores unitários dos produtos vendidos a M

SELECT AVG(valor_unitario) as valor
FROM produtos
WHERE unidade = 'M';

-- 05)Somar o valor de todos os salários

SELECT SUM(salario) as total
FROM vendedores;

-- 06)Somar o valor dos salários da comissão A
-- 07)Somar a quantidade de itens de pedidos
-- 08)Informe o menor salario do vendedores
-- 09)Informe o maior salario do vendedores
-- 10)Informe o maior salario do vendedores da faixa de comissão B
-- 11)Listar os nomes entre Ana e Jorge, ordenado de forma decrescente

 
-- GROUP BY
-- 01)Informe o número de clientes por Estado

SELECT COUNT(*)
FROM clientes
GROUP BY estado;

-- 02)Informe a média salarial por faixa de comissão

SELECT AVG(salario)
FROM vendedores
GROUP BY faixa_comissao;

-- 03)Informe a média salarial por faixa de comissão ordenado de forma decrescente por valor

SELECT AVG(salario)
FROM vendedores
GROUP BY faixa_comissao
ORDER BY valor DESC;


-- HAVING
-- 01)Informe a média salarial por faixa de comissão apenas das faixas com ganho acima de 2000 

SELECT AVG(salario) 
FROM vendedores
GROUP BY faixa_comissao
HAVING faixa_comissao > 2000;

-- 02)Informe a média salarial por faixa de comissão apenas das faixas com ganho acima de 2000 ordenado de forma decrescente por valor.

SELECT AVG(salario)
FROM vendedores
GROUP BY faixa_comissao
HAVING faixa_comissao > 2000
ORDER BY valor DESC;

-- COLUNAS CALCULADAS
-- 01)Calcular o novo salário fixo dos vendedores, de faixa de comissão ‘A’, calculado com base no reajuste de 75% acrescido de R$ 120,00 de bonificação. Ordenar pelo nome do vendedor
-- 02)Mostrar o novo salario fixo dos vendedores, de faixa de comissão 'C', calculado com base no reajuste de 75% acrescido de 120 reais de bonificação. Ordenar pelo nome do vendedor

SELECT nome, salario AS salario_anterior, salario * 1.75 + 120 AS novo_salario, faixa_comissao
FROM vendedores
WHERE faixa_comissao = 'C';

-- JOIN
-- 01)Listar todos os pedidos realizados, exibindo o nome dos clientes

SELECT p.id, id_pedido, c.nome
FROM pedidos as p
INNER JOIN clientes as c
ON p.id_clientes = c.id;

-- 02)Listar todos os pedidos realizados, exibindo o nome dos vendedores

SELECT p.id, id_pedido, v.nome
FROM pedidos as p
INNER JOIN vendedores as v
ON p.id_clientes = v.id;

-- 03)Listar todos os pedidos realizados, exibindo o nome dos vendedores e clientes, ordenados por prazo de entrega

SELECT p.id, id_pedido, c.nome, v.nome
FROM pedidos as p
INNER JOIN clientes as c, vendedores as v
ON p.id_clientes = c.id, v.id
ORDER BY 

-- 04)Listar o id e prazo de entrega dos pedidos realizados pela cliente 'Susana', incluindo o nome do vendedor
-- 05)Listar o prazo_entrega mínima para cada cliente, apresentando nome do 
-- 06)Listar os clientes e vendedores com prazo de entrega entre 10 e 20 dias e ordene por prazo de entrega. O nome do campo deve ser alterado para 
-- 07)Listar cliente e média de prazo para entrega, considerando apenas os clientes com prazo acima de 10 dia 
-- 08)Ao final, apresente somente os clientes cuja média é superior a 15 dias 
-- 09)Ordene por prazo máximo
-- 10)Listar os nomes dos produtos com quantidade somada, porém, considerando apenas os itens com quantidade inferior a 30.
-- 11)Ao final, apresente apenas os itens cuja soma é superior a 40

-- Exercício:

SELECT tipo,COUNT (tipo)
FROM formas_geometricas
WHERE tipo LIKE 'X' OR tipo LIKE 'O'
GROUP BY tipo
HAVING COUNT(tipo) > 4;


SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

SELECT clientes.id, clientes.nome, clientes.endereço, pedidos.prazo_entrega
FROM clientes
INNER JOIN pedidos
ON clientes.id = pedidos.id_clientes;

SELECT vendedores.faixa_comissao, clientes.nome, pedidos.prazo_entrega
FROM pedidos
INNER JOIN vendedores
ON vendedores.id = pedidos.id_vendedor
INNER JOIN clientes
ON clientes.id = pedidos.id_clientes;

SELECT c.nome as nome_cliente, COUNT(c.id) as qtdade_pedidos
FROM clientes as c
INNER JOIN pedidos as p
ON p.id_clientes = c.id
WHERE pedidos.id > 100
HAVING qtdade_pedidos = 1
ORDER BY c.id
ORDER BY nome_clientes;

SELECT * FROM vendas.pedidos;

SELECT pedidos.id, pedidos.prazo_entrega, clientes.nome, vendedores.nome
FROM pedidos
INNER JOIN clientes
ON pedidos.id_cliente = clientes.id
INNER JOIN vendedores
ON pedidos.id_vendedor = vendedores.id
WHERE prazo_entrega > 25;
