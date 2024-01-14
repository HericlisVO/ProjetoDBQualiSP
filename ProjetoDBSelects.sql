-- conectando ao schema
use db_cds;

desc titulos;


-- 1) Todos
select * from titulos;
-- 2) codigo 1, 2 ou 3
select * from titulos where cod_tit =1 OR cod_tit =2 OR cod_tit =3;
select * from titulos where cod_tit in(1,2,3);

select * from titulos where cod_tit >=1 and cod_tit <=3;
select * from titulos where cod_tit between 1 and 3;
select * from titulos where cod_tit <=3;
select * from titulos order by cod_tit asc limit 3;
select * from titulos order by cod_tit asc limit 0,3;
select * from titulos where cod_tit <4;

-- 2) codigo diferente de 2,6 e 9 
select * from titulos where cod_tit <>2 and cod_tit <> 6 and cod_tit <>9 ;
select * from titulos where cod_tit not in(2,6,9);

-- 4) preço de venda entre 10 e 30 
select * from titulos where val_cd between 100 and 150;
select * from titulos where val_cd > 100 and val_cd <150;

-- 5) preço de custo menor que 10
select * from titulos where val_compra <100;
select * from titulos where val_compra between 0 and 100;
-- 6) nome começado por consoante
-- 7) nome que contenha o texo 'saber'
-- 8) nome iniciado com 'acabou'
-- 9) lucro maior que 50%
-- 10)lucro menor que 100%
-- 11)lucro maior que 100.00



