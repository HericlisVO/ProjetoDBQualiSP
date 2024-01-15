-- conectando ao schema
use db_cds;

-- 12) quantos titulos existem cadastrados no sistema?

-- usando agregação 
select * from titulos;
select count(*) from titulos;
select count(cod_tit) from titulos;

-- 13) Liste todos os titulos trazendo a categoria e a gravadora

select 	nome_cat as 'Categoria',
	nome_cd as 'Titulo',
    nome_grav as 'Gravadora'
	from titulos t
	join categorias ct on t.cod_cat = ct.cod_cat
    join gravadoras g on t.cod_grav = g.cod_grav
    order by nome_cat, nome_cd;
;

-- 14) Qual a categoria e valor do titulo mais caro que nós compramos?
select 
		nome_cat as 'Categoria',
        nome_cd as 'Titulo',
        val_compra as 'Valor compra'
		from titulos t 
        join categorias ct on t.cod_cat = ct.cod_cat
        where val_compra= (select max(val_compra) from titulos);
        
-- 15) Qual a Categoria , a gravadora e o valor do titulo mais caro que nós já compramos?


select 
		nome_cat as 'Categoria',
        nome_cd as 'Titulo',
        val_compra as 'Valor compra',
        nome_grav as  'Gravadora'
		from titulos t 
        join categorias ct on t.cod_cat = ct.cod_cat
        join gravadoras g on t.cod_grav = g.cod_grav
        where val_compra= (select max(val_compra) from titulos);
        

-- 16) Quantos clientes do estado de são paulo nós temos no nosso sistema ?

select 	
		count(cod_cli) as 'Número de Clientes de São Paulo'
		from clientes cl 
		join cidades cd on cl.cod_cid = cd.cod_cid 
        join estados e on cd.sigla_est = e.sigla_est
        where nome_est = 'São Paulo'
        ;
        
        
-- 17) Quanto cada funcionário recebeu de comissão em cada venda? A comissão é de 50% do Lucro.
select nome_func as 'Funcionário',
		p.num_ped as 'Pedido',
        nome_cd as 'Titulos',
		qtd_cd as 'Numero de cds',
       round( (qtd_cd * (tp.val_cd -  val_compra))/2, 2) as 'Comissão do Vendedor'
		from funcionarios f 
        join pedidos p on f.cod_func = p.cod_func
        join titulos_pedidos tp on p.num_ped = tp.num_ped
        join titulos t on tp.cod_tit = t.cod_tit;



select nome_func as 'Funcionário',
		p.num_ped as 'Pedido',
        group_concat(nome_cd) as 'Titulos',
       sum(round( (qtd_cd * (tp.val_cd -  val_compra))/2, 2)) as 'Comissão do Vendedor'
		from funcionarios f 
        join pedidos p on f.cod_func = p.cod_func
        join titulos_pedidos tp on p.num_ped = tp.num_ped
        join titulos t on tp.cod_tit = t.cod_tit
        group by p.num_ped 
        ;

-- 18) Quanto cada funcionario recebeu ao total?
select nome_func as 'Funcionário',
		group_concat( distinct p.num_ped) as 'Pedidos',
       sum(round( (qtd_cd * (tp.val_cd -  val_compra))/2, 2)) as 'Comissão do Vendedor'
		from funcionarios f 
        join pedidos p on f.cod_func = p.cod_func
        join titulos_pedidos tp on p.num_ped = tp.num_ped
        join titulos t on tp.cod_tit = t.cod_tit
        group by nome_func  
        ;

select nome_func as 'Funcionário',
		group_concat( distinct p.num_ped) as 'Pedidos',
       sum(round( (qtd_cd * (tp.val_cd -  val_compra))/2, 2)) as 'Comissão do Vendedor'
		from funcionarios f 
        join pedidos p on f.cod_func = p.cod_func
        join titulos_pedidos tp on p.num_ped = tp.num_ped
        join titulos t on tp.cod_tit = t.cod_tit
        group by nome_func  
        with rollup
        ;
        
-- 18A) totalização de comições
select case
		when nome_func is not null then nome_func
        else 'Total de Comissões'
        end as 'Funcionario',
        case 
		  when nome_func is not null then group_concat( distinct p.num_ped) 
        else ''
        end as 'Pedidos',
       sum(round( (qtd_cd * (tp.val_cd -  val_compra))/2, 2)) as 'Comissão do Vendedor'
		from funcionarios f 
        join pedidos p on f.cod_func = p.cod_func
        join titulos_pedidos tp on p.num_ped = tp.num_ped
        join titulos t on tp.cod_tit = t.cod_tit
        group by nome_func
        with rollup
        
        ;