use Sprint2;

create table cliente (
	idCliente int primary key auto_increment,
	nomeCLiente varchar(45),
    foneCelular varchar(45),
    foneFixo varchar(45),
    fkEndereco int,
    foreign key (fkEndereco) references endereco(idEndereco)
);

create table endereco (
	idEndereco int primary key auto_increment,
    cep varchar(45),
    ruaEndereco varchar(45),
    numCasa varchar(45),
    refCasa varchar(45)
);

create table pet (
	idPet int primary key auto_increment,
    nomePet varchar(45),
    tipoPet varchar(45),
    racaPet varchar(45),
    dtNasc date,
    fkPet int,
    foreign key (fkPet) references cliente(idCliente)
) auto_increment = 100;

update pet set fkPet = 1
	where idPet = 100;
    
update pet set fkPet = 2
	where idPet = 101;
    
update pet set fkPet = 1
	where idPet = 102;

insert into cliente (nomeCliente, foneCelular, foneFixo) values (
"Arthur Nobrega", "11-988764325", "11-76427807"), 
("Vitor Augusto", "11-976095192", "11-6732-0577"), 
("Ronaldo Nobrega", "11-944672130", "11-84446799");

select * from cliente;

insert into endereco (cep, ruaEndereco, numCasa, refCasa) values (
"06854-130", "Avenida Santos dummond", "70", "Prédio"), 
("09421-130", "Rua Sargento Melo", "7", "Casa Amarela"), 
("06778-888", "Rua Maça Verde da Silva", "1290", "Prédio");

select * from endereco;

insert into pet (nomePet, tipoPet, racaPet, dtNasc) values (
"Bobby", "Cachorro", "Schnauzer", "2010-09-12"),
("Lucy", "Gato", "Persa", "2000-09-20"),
("Zelda", "Gato", "Desconhecido", "2018-03-09");

select * from pet;

-- Exibir apenas os nomes e as datas de nascimento dos pets
Alter table cliente modify column nomeCliente Varchar(70);

desc cliente;

-- - Exibir apenas os nomes e as datas de nascimento dos pets.
select nomePet, dtNasc from pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
Select * from pet 
	order by nomePet;
    
-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.
select * from endereco 
	order by refCasa desc;
    
-- Exibir os dados dos pets cujo nome comece com uma determinada letra.
select * from pet 
	where nomePet like "B%";
    
-- Exibir os dados dos clientes que têm o mesmo sobrenome.
select * from cliente
	where nomeCliente like "%Nobrega%";
    
-- Alterar o telefone de um determinado cliente.
update cliente 
	set foneCelular = "11-944419281"
		where idCliente = 1;
        
select * from cliente 
	where idCliente = 1;
    
-- Exibir os dados de todos os pets que são de um determinado tipo
select * from pet
	where tipoPet = "Gato";
    
-- Exibir os dados dos pets e dos seus respectivos donos
select * from pet join cliente on fkPet;

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente.
select * from pet join cliente on fkPet
			where nomeCliente like "%Arthur%";
            
-- Excluir algum pet.
delete from pet 
	where idPet= 102;
    
-- Exibir os dados dos pets para verificar se excluiu.
	select * from pet;
    
-- Excluir as tabelas.
drop table cliente, endereco, pet;

		
	




