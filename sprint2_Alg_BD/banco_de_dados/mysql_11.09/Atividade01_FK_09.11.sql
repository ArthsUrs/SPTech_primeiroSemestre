CREATE DATABASE SSprint2;

USE SSprint2;

CREATE table Atleta (
	IdAtleta int primary key auto_increment,
    nome varchar(45),
    modalidade varchar(45),
    qtdMedalhas int
);

insert into Atleta values 
	(null, 'Arthur', 'futebol', 11),
    (null, 'Henrique', 'basquete', 02),
    (null, 'Maria Julia', 'volei', 23),
    (null, 'Totoro', 'volei', 07),
    (null, 'Felipe', 'futebol', 16),
    (null, 'Jorge', 'volei', 09);
    
select * from Atleta order by nome desc;

CREATE TABLE País (
	idPais int primary key auto_increment,
    nome varchar(45),
    capital varchar(45)
);

insert into País values 
	(null, 'Brasil', 'Brasilia'),
    (null, 'Canadá', 'Ottawa'),
    (null, 'Argentina', 'Buenos Aires'),
    (null, 'França', 'Paris');
    
    select * from País;
    
truncate table País;
-- dupliquei sem querer os values.

-- Criar a chave estrangeira na tabela correspondente conforme modelagem;
alter table Atleta add column fkPaís int;

DESCRIBE Atleta;

alter table Atleta add constraint fkpais 
	foreign key(fkPaís)
		references País(idPais);
        
select * from Atleta;

select * from Atleta join País
	on IdPais = fkPaís;
    
-- Atualizar o país de todos os atletas;
    
    SELECT * FROM Atleta;
update Atleta set fkPaís = 1
	where IdAtleta = 1;
    
update Atleta set fkpaís = 3
    where IdAtleta = 2;

update Atleta set fkPaís = 2
	where IdAtleta = 3;
    
update Atleta SET fkPaís = 1
	where IdAtleta = 4;
    
UPDATE Atleta SET fkPaís = 4
	where IdAtleta = 5;
    
UPDATE Atleta SET fkPaís = 2
	where IdAtleta = 6;
  
  
-- Exibir os atletas e seu respectivo país;

SELECT * from Atleta JOIN País
ON idPais = fkPaís;


-- Exibir apenas o nome do atleta e o nome do respectivo país;

SELECT a.nome, p.nome as NomePais from Atleta AS a JOIN País AS p
ON idPais = fkPaís;

-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital;

SELECT Atleta.*,
	País.nome,
	País.capital 
		FROM Atleta JOIN País
		ON idPais = fkPaís
where capital = 'Ottawa';

-- ------------------------------------------------------------------------------------------------------------------------------------------

-- Exercicio 2

CREATE TABLE musica (
	idMusica int primary key auto_increment,
    titulo varchar(45),
    artista varchar(40),
    genero varchar(40)
);

drop table musica;

INSERT INTO musica VALUES 
	(null, 'The lazy Song', 'Bruno Mars', 'pop'),
    (null, 'Sunflower', 'Post Malone', 'AmericanTrap'),
    (null, 'Thatś what i like', 'Bruno Mars', 'pop');
    
    truncate table musica;
    
CREATE TABLE album (
	idAlbum INT primary key auto_increment,
	nome VARCHAR(80),
    midia varchar(80),
    dtLancamento date
);

INSERT INTO album VALUES
	(null, '24K magic', 'digital', '2016-09-28'),
    (null, 'Queen II', 'fisico', '1987-10-15');
    
    
    SELECT * from musica;
    select * from album;
    
    alter table musica add column fkalbum int;
    
    alter table musica add constraint fkalbum 
	foreign key(fkalbum)
		references album(idalbum);
        
	describe musica;
    
    select * from musica join album
	on idalbum = fkalbum;
    
    SELECT * FROM musica;
update musica set fkalbum = 1
	where idMusica = 1;
    
    select * from musica;
update musica set fkalbum = 2
	where idMusica = 2;
    
    update musica set fkalbum = 1
		where idMusica = 3;
        
	select * from musica;
    
    SELECT * from musica JOIN album
		ON idalbum = fkalbum;
        
	select titulo, nome from musica join album 
		on idalbum = fkalbum;
        
	select * from musica join album 
		on idalbum = fkalbum
			where genero = 'pop'; 
			
    
    
    
    

    
	
    
    












