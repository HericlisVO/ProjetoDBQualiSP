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