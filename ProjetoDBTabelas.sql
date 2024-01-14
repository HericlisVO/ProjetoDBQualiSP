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
                    
-- tabela cliente

create table clientes
(
		cod_cli int not null auto_increment,
        cod_cid int not null,
        nome_cli varchar(100) not null,
        end_cli varchar(100) not null,
        renda_cli decimal(10.2) not null default 0,
        sexo_cli char(1) not  null default 'f',
        
        constraint pk_cli primary key(cod_cli),
        constraint fk_cli foreign key(cod_cid) references cidades(cod_cid),
        constraint ch_cli_1 check (renda_cli>=0),
        constraint ch_cli_2 check(sexo_cli in ('f','m'))
		
);


-- dados tabela

insert clientes values
					(null,1,'josé nogueira','rua a',1500.00,'m'),
					(null,1,'angelo pereira','rua b',2000.00,'m'),
					(null,1,'além mar paranhos','rua c',1500.00,'f'),
					(null,1,'catarina souza','rua d',892.00,'f'),
					(null,1,'vagner costa','rua e',950.00,'m'),
					(null,2,'antenor da costa','rua f',1582.00,'m'),
					(null,2,'maria amélia de souza','rua g',1152.02,'f'),
					(null,2,'paulo roberto da silva','rua h',3250.00,'m'),
					(null,3,'fatima de souza','rua i',1632.00,'f'),
					(null,3,'joel da rocha','rua j',2000,'m');

-- tabela conjuges

create table conjuges 
(
		cod_cli int not null,
        nome_conj varchar(100) not null,
        renda_conj decimal(10.2) not null default 0,
        sexo_conj char(1) not null default 'm',
        
        constraint pk_conj primary key (cod_cli),
        constraint fk_conj foreign key (cod_cli) references clientes (cod_cli),
        constraint ch_conj_1 check (renda_conj >=0),
        constraint ch_conj_2 check (sexo_conj in ('f','m'))
        
);


-- dados tabela conjuge
insert conjuges values 
				(1,'carla nogueira',2500.00,'f'),
				(2,'emilia pereira',5500.00,'f'),
				(6,'altiva da costa',3000.00,'f'),
				(7,'carlos de souza',3250.00,'m')
;
                
                
