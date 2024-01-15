-- usando o banco de dados no sgbd
use db_cds;


-- Exercicios com JOIN de de varias tabelas e OUTER JOIN

-- 19) pedidos de funcionarios sem filhos

select 	num_ped as 'Pedido',
		nome_func as 'Funcionario',
        nome_dep as 'Dependente'
		from pedidos p 
				join funcionarios f on p.cod_func = f.cod_func
                left join dependentes d on f.cod_func = d.cod_func
                where cod_dep is null
                order by num_ped;

-- 20) pedidos de clientes solteiros
	select  num_ped as 'Pedido',
			nome_cli as 'Cliente',
            nome_conj as 'Conjuge'
			from 
			conjuges cj
            right join clientes c on cj.cod_cli =c.cod_cli
            join pedidos p on c.cod_cli = p.cod_cli
            where cj.cod_cli is null
		--  where nome_conj is null
            ;
-- 21) pedidos de cliente solteiro que comprou 'marisa monte'

select  p.num_ped as 'Pedido',
			nome_cli as 'Cliente',
            nome_conj as 'Conjuge',
            nome_art as 'Artistas',
            nome_cd as 'Titulo'
			from 
			conjuges cj
			right join clientes c on cj.cod_cli =c.cod_cli
            join pedidos p on c.cod_cli = p.cod_cli
			join titulos_pedidos tp on p.num_ped =tp.num_ped 
            join titulos t on tp.cod_tit = t.cod_tit 
            join titulos_artistas ta on t.cod_tit = ta.cod_tit
            join artistas a on ta.cod_art = a.cod_art
            
            where cj.cod_cli is null
            and nome_art = 'marisa monte'
            
            -- where cj.cod_cli is null
		-- where nome_conj is null
            ;
            
-- 22) pedidos de 'marisa monte' com nome do funcionario e com nome do cliente


select  p.num_ped as 'Pedido',
			nome_cli as 'Cliente',
            nome_func as 'Funcionarios',
            nome_art as 'Artistas',
            nome_cd as 'Titulo'
			from pedidos p 
			join clientes c on c.cod_cli = p.cod_cli
            join funcionarios on p.cod_func = f.cod_func
			join titulos_pedidos tp on p.num_ped =tp.num_ped 
            join titulos t on tp.cod_tit = t.cod_tit 
            join titulos_artistas ta on t.cod_tit = ta.cod_tit
            join artistas a on ta.cod_art = a.cod_art
            
            where   nome_art = 'marisa monte'
            
        
            ;
            
-- 23) pedidos de mpb, exceto titulo começando com vogal, com nome do funcionario e nome do
-- cliente e com nome do conjuge e filhos.(se existirem)
select p.num_ped as'Pedido',
		nome_func as 'Funcionario',
        nome_dep as 'Dependente',
        nome_cli as 'Cliente',
        nome_conj as 'Conjuge',
        nome_cd as 'Titulo'
		from pedidos p 
        join funcionarios f on p.cod_func = f.cod_func
		left join dependentes d on f.cod_func =d.cod_func
        join clientes c on p.cod_cli = c.cod_cli
        left join conjuges cj on c.cod_cli = cj.cod_cli
		join titulos_pedidos tp on p.num_ped =tp.num_ped 
		join titulos t on tp.cod_tit = t.cod_tit 
        join categorias ct on t.cod_cat = ct.cod_cat
        where nome_cat ='mpb' and nome_cd regexp '^[^aeiou]'
        ;