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