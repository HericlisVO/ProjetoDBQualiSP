-- conectando ao schema

use  db_cds;

-- 32) Quantos titulos possui cada artista do catalogo?
select nome_art as 'Artistas',
		case
	   when  count(nome_cd) > 0 then count(nome_cd)
       else ''
       end as 'Qtd_Titulos',
       case
       when group_concat(nome_cd) is not null then group_concat(nome_cd)
       else 'Sem titulos'
       end as 'Tiutlos'
	   from artistas a
       left join titulos_artistas ta on a.cod_art = ta.cod_art
       left join titulos t on ta.cod_tit = t.cod_tit
       group by nome_art
       having count(nome_cd) < 2
       order by Qtd_titulos
       -- order by count(nome_cd)
;
-- 33) Quantos artistas possui cada gravadora relacionado

select g.nome_grav as 'Gravadora',
		count(nome_art) as 'Qtd_Artista',
	    group_concat(nome_art) as 'Artista'
        from gravadoras g
			join titulos t on g.cod_grav = t.cod_grav
            join titulos_artistas ta on t.cod_tit = ta.cod_tit
			join artistas a on ta.cod_art = a.cod_art
			group by g.nome_grav;
            
-- 34) Quantos artistas possui cada gravadora e qual o total de


select case
		when g.nome_grav is not null then g.nome_grav
        else 'Total : '
        end as 'Gravadora',
		count(nome_art) as 'Qtd_Artista',
	    group_concat(nome_art) as 'Artista'
        from gravadoras g
			join titulos t on g.cod_grav = t.cod_grav
            join titulos_artistas ta on t.cod_tit = ta.cod_tit
			join artistas a on ta.cod_art = a.cod_art
			group by g.nome_grav
            with rollup  ;


-- 35) Liste todos os pedidos feitos no ano 2013 e qual o total faturado no ano
select case
		when p.num_ped is not null then p.num_ped
        else 'Total Faturado no ano: '
        end as 'Pedido',
		 sum( qtd_cd * val_cd) as 'Valor Pedido'
		from  pedidos p 
        join titulos_pedidos tp on p.num_ped = tp.num_ped
			where year(data_ped) = 2013
		group by p.num_ped
          having sum( qtd_cd * val_cd) > 500
     -- with rollup
      union 
      select 'Total: ',
      sum( qtd_cd * val_cd)
      from  pedidos p 
        join titulos_pedidos tp on p.num_ped = tp.num_ped
			where year(data_ped) = 2013
            -- having sum( qtd_cd * val_cd) > 500
             -- with rollup
      ;
      
-- 36) Liste todos os funcionarios e quantos dependentes cada um possui
select nome_func as 'Funcionarios',
		case 
		when count( nome_dep) > 0 then concat('                   ', count( d.nome_dep))
        else ''
        end as 'Número Dependentes',
	case
     when group_concat(nome_dep) is not null then  group_concat(d.nome_dep)
	 else 'Sem dependentes'
     end as 'Nome Dependentes'
		from funcionarios f 
        left join dependentes d on f.cod_func = d.cod_func
        group by nome_func;