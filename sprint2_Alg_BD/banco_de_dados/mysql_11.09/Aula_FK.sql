CREATE DATABASE Sprint2;

USE Sprint2;

CREATE TABLE empresa (
	idEmpresa INT primary key auto_increment,
    nome varchar(45),
    responsavel varchar(45)
) auto_increment = 1000;

insert into empresa value 
	(null, 'C6Bank', 'Andresa'),
    (null, 'accenture', 'Rafael');
    
    
select * from empresa;

CREATE TABLE aluno (
	RA char(8) primary key,
    nome varchar(45),
    bairro varchar(45)
-- , fkEmpresa int
-- Constraitn fkEmp foreign key (fkEmpresa)
-- references empresa(idEmpresa)
);

insert into aluno values
	('01232999', 'Arthur', 'Moema');


-------------------------------------------------------

alter table aluno add column fkEmpresa int;
DESCRIBE aluno;

alter table aluno add constraint fkEmp
	foreign key (fkEmpresa)
		references empresa(idEmpresa);
--  Só usa o constraint para colocar um ID na foreign key
	


SELECT * FROM aluno;

UPDATE aluno SET fkEmpresa = 1000
	where ra = '01232999';
    
INSERT INTO aluno values
	('01232098', 'Luana', 'Paraíso', 1001),
    ('01232097', 'Sabrina', 'Paraíso', 1001);
    
-- PRIMEIRO JOIN

select * from aluno JOIN empresa
	ON idEmpresa = fkEmpresa;
    
-- JOIN = junta duas tabelas
-- ON = Liga a primary key de uma tabela a uma foreign key de outra tabela
    
-- Necessita ser a primary key da outra tabela em que se está ligando;

select aluno.nome as NomeAluno,
	empresa.nome as NomeEmpresa
		from aluno JOIN empresa
			on idEmpresa = fkEmpresa;






