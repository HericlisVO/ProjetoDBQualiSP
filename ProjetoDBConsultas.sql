-- conectando ao schema

use db_cds;

-- Union
-- 37) Todos os pedidos
-- com funcionarios e clientes.
-- trazer conjuges e dependentes se existirem.
-- trazer funcionarios e clientes que nunca fizeram um pedido.

select num_ped,
	nome_func,
    nome_dep,
    nome_cli,
    nome_conj
		from pedidos p
        right join funcionarios f on p.cod_func = f.cod_func
        left join dependentes d on f.cod_func = d.cod_func
		left join clientes c on p.cod_cli = c.cod_cli -- retorna o olavo linhares- funcionario que nunca fez pedidos
        -- mas não retorna os clientes que nunca fizeram pedidos
        left join conjuges cj on c.cod_cli = cj.cod_cli

union

select num_ped,
	nome_func,
    nome_dep,
    nome_cli,
    nome_conj
		from pedidos p
        right join funcionarios f on p.cod_func = f.cod_func
        left join dependentes d on f.cod_func = d.cod_func
		right join clientes c on p.cod_cli = c.cod_cli -- retorna o olavo linhares- funcionario que nunca fez pedidos
        -- mas não retorna os clientes que nunca fizeram pedidos
        left join conjuges cj on c.cod_cli = cj.cod_cli;

-- 38) criar view com a consulta anterior
create or replace view mostraTudo as

select num_ped,
	nome_func,
    nome_dep,
    nome_cli,
    nome_conj
		from pedidos p
        right join funcionarios f on p.cod_func = f.cod_func
        left join dependentes d on f.cod_func = d.cod_func
		left join clientes c on p.cod_cli = c.cod_cli -- retorna o olavo linhares- funcionario que nunca fez pedidos
        -- mas não retorna os clientes que nunca fizeram pedidos
        left join conjuges cj on c.cod_cli = cj.cod_cli

union

select num_ped,
	nome_func,
    nome_dep,
    nome_cli,
    nome_conj
		from pedidos p
        right join funcionarios f on p.cod_func = f.cod_func
        left join dependentes d on f.cod_func = d.cod_func
		right join clientes c on p.cod_cli = c.cod_cli -- retorna o olavo linhares- funcionario que nunca fez pedidos
        -- mas não retorna os clientes que nunca fizeram pedidos
        left join conjuges cj on c.cod_cli = cj.cod_cli;
        
        
select * from mostraTudo;

select *
		from mostraTudo
        where  num_ped is null
        and nome_conj is not null;
        
show databases;

use mysql;
show tables;

use information_schema;
show tables;select * from views;

-- criar uma tabela temporaria view com o resultado da consulta utilizando a view mostraTudo

use db_cds;
show tables;
create temporary table tempMotraTudo as select * from mostraTudo;

desc tempMotraTudo;
select * from tempMotraTudo;