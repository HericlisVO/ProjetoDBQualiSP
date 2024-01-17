-- conectando ao schema

use  db_cds;

-- 32) Quantos titulos possui cada artista do catalogo?
select nome_art as 'Artistas',
	   count(nome_cd) as 'Qtd_Titulos',
       group_concat(nome_cd) as 'Tiutlos'
	   from artistas a
       left join titulos_artistas ta on a.cod_art = ta.cod_art
       left join titulos t on ta.cod_tit = t.cod_tit
       group by nome_art
       having count(nome_cd) < 2
       order by Qtd_titulos
       -- order by count(nome_cd)
;