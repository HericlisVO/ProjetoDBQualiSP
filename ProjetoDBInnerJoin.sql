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