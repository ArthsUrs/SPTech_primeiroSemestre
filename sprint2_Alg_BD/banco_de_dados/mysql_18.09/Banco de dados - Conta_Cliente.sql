CREATE DATABASE ProjetoPI;

USE ProjetoPI;

create table conta (
	idConta INT primary key auto_increment,
    saldo decimal(15,2)not null, 
    senha varchar(45) not null,
    saldoCredito decimal(13,2)
);

CREATE table cliente (
	idCliente INT primary key auto_increment,
    nome varchar(45) not null ,
    cpf char(11)not null unique,
    cep char(8)not null,
	nCasa char(9) not null,
    dtNasc DATE not null,
    telefone CHAR(11) not null
);

	insert into cliente values
		(null, 'José','28456982893', '03717037', '29', '1978-02-23', '11976392874'),
		(null, 'Arthur','57030727890','59014380', '4500', '2002-09-29', '11978192415'),
		(null, 'Tallyon','14225865460','64012071', '2702', '1999-12-25', '23913175839');

	insert into conta values
		(null, 10290.38, 'senhaDiferente', 1000.00),
		(null, 981.39, 'senhaIndiferente', 500.00),
		(null, -500.67, 'toDuro', 70.90);
        
	alter table cliente add column fkconta int;
    
    DESCRIBE cliente;
    select * from cliente;
    select * from conta;
    
    alter table cliente add foreign key (fkconta)
		references conta(idConta);
        
	 select * from cliente join conta
		on idConta = fkconta;
        
	update cliente set fkconta = 1
		where idCliente = 1;
    
    update cliente set fkconta = 2
		where idCliente = 2;
        
	update cliente set fkconta = 3
		where idCliente = 3;
        
	select * from cliente join conta 
		on fkconta = idConta;
        
	/* Grupo 4:
		- Arthur Silva;
        - Tallyon Lima;
        - Pedro Luis;
        - Pedro Ortiz;
        - João Pedro;
        - Guilherme Santhiago; */
        
	
    
    
    



