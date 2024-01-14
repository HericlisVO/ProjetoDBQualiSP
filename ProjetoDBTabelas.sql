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
 
 -- Tabela Dependentes
 
 create table dependentes (
		cod_dep int not null auto_increment,
        cod_func int not null,
        nome_dep varchar(100) not null,
        sexo_dep char(1) not null default'm',
        -- restrição completa de nivel de tabela
        constraint pk_dep primary key (cod_dep),
        
        constraint fk_dep foreign key (cod_func) references funcionarios( cod_func),
        
        constraint ch_dep check(sexo_dep in('f','m'))
 
 );
 
  -- dados tabela dependentes
  
  insert dependentes values
					(null,1,'ana pereira','f'),
					(null,1,'roberto pereira','m'),
					(null,1,'celso pereira','m'),
					(null,3,'brisa linhares','f'),
					(null,3,'mari sol linhares','f'),
					(null,4,'sonia da silva','f');
                   
-- tabela estado

create table estados 
(
		sigla_est char(2) not null,
        nome_est char(50) not null,
        
        constraint pk_est primary key(sigla_est),
        constraint uq_est unique(nome_est)

);

-- dados tabela estados
insert estados values
					('sp','são paulo'),
                    ('mg','minas gerais'),
					('rj','rio de janeiro');
	
-- tabela cidade                   
create table cidades 
(

		cod_cid int not null auto_increment,
		sigla_est char(2) not null,
        nome_cid varchar(100) not null,
        
        constraint pk_cid primary key (cod_cid),
        constraint fk_cid foreign key (sigla_est) references estados(sigla_est)
);

-- dados tabela cidades

insert cidades values 
					(null, 'sp','são paulo'),
					(null, 'sp','sorocaba'),
					(null, 'sp','jundiaí'),
					(null, 'sp','americana'),
					(null, 'sp','araraquara'),
					(null, 'mg','ouro preto'),
					(null, 'rj','cachoeiro do itapemirim');
