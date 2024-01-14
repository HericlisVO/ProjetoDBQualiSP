-- criando o banco de dados cds
create schema db_cds;
-- usando o banco de dados no sgbd
use db_cds;


-- tabela funcionarios
create table funcionarios
(
		cod_func int not null auto_increment,
		nome_func varchar(100) not null,
		end_func varchar(200) not null,
		sal_func decimal(10.2) not null default 0,
		sexo_func char(1) not null default 'f',

		constraint pk_func primary key (cod_func),
		constraint ch_func_1 check (sal_func >=0),
		constraint ch_func_2 check (sexo_func in ('f','m'))
);


desc funcionarios;

-- dados tabela funcionarios 
insert into funcionarios 
						values 
                        (null, 'vania gabriela pereira','rua a',2500.00,'f'),
                        (null, 'noberto pereira da silva','rua b',2300.00,'m'),
                        (null, 'olavo linhares','rua c',2580.00,'m'),
                        (null, 'paula da silva','rua d',3000.00,'f'),
                        (null, 'rolando rocha','rua e',2000.00,'m'); 
 