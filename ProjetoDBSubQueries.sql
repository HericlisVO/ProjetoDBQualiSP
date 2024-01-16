-- conectando ao schema 

use db_cds;

-- Exercicios com SUB SELECT

-- 26) Apresente somente os clientes solteiros

select * from clientes where cod_cli not in(select cod_cli from conjuges);
-- 27) Apresente todos os clientes casados
select * from clientes where cod_cli  in(select cod_cli from conjuges);

-- 27b) Cliente casados e Solteiro usando Sub Select
select nome_cli as 'Cliente' ,
	   'Solteiro' as 'Estado civil'
from clientes where cod_cli in(select cod_cli from conjuges)
union
select nome_cli,
	   'Casado'
	from clientes where cod_cli not in(select cod_cli from conjuges)
    order by Cliente;
    
-- 28) Apresente todas as Categorias que estão sem CD

select * from categorias where cod_cat not in(select distinct cod_cat from titulos);

-- 29) Apresente apenas os Funcionarios que tem dependentes e que nunca atenderama nenhum pedido

select * from funcionarios 
			where cod_func in(select distinct cod_func from dependentes)
            and cod_func not in (select distinct cod_func from pedidos)
            ;
            
-- 30) Mostre todos os funcionarios que atenderam a clientes casados

select nome_func as 'Funcionario' from funcionarios where cod_func in(
			select distinct cod_func from pedidos where 
				cod_cli in(select cod_cli from conjuges)) -- subquery dentro de subquery

;

-- 31) apresente os dados dos cds mais caros
select * from titulos;
select * from titulos order by val_cd DESC;
select * from titulos  where val_cd =(select max(val_cd) from titulos);
