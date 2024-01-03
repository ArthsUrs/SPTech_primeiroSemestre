create database Exercicio11;

use Exercicio11;

create table Departamento (
	idDepto int primary key,
	nome varchar (10)
);

create table funcionario (
	idFunc int primary key,
	nomeFunc varchar(45),
	salario decimal(10,2),
	sexo varchar (10),
	constraint chkSexo check (sexo in('m','f')),
	fkSupervisor int,
	constraint fkSupervisor foreign key (fkSupervisor) references funcionario (idFunc),
	dtNasc date,
	fkDepto int,
	constraint fkDepto foreign key (fkDepto) references Departamento (idDepto)
);

select * from funcionario;

alter table Departamento add column fkGerente int;
ALTER table Departamento modify column nome varchar(20);

alter table Departamento add constraint fkGerente foreign key (fkGerente) references funcionario (idFunc);
alter table Departamento add column dtInicioGer date;

create table Projeto (
	idProj int primary key,
	nomeProj varchar (30), 
	localProj varchar(20),
	fkDeptoProj int,
	constraint fkDeptoProj foreign key (fkDeptoProj) references Departamento (idDepto)
);

create table FuncProj (
	fkFunc int,
	fkProj int,
	foreign key (fkFunc) references funcionario (idFunc),
	foreign key (fkProj) references Projeto (idProj),
	horas decimal (3,1)
);

insert into Departamento values
	(105, 'Pesquisa', NULL, '2008-05-22'),
	(104, 'Administração', NULL, '2015-01-01'),
	(101, 'Matriz', NULL, '2001-06-19');

update Departamento set fkGerente = 2 
	where idDepto = 105;
    
update Departamento set fkGerente = 7 
	where idDepto = 104;
    
update Departamento set fkGerente = 8 
	where idDepto = 101;

insert into funcionario values 
	(1, 'Joao Silva', 3500, 'm', NULL, '1985-01-09', 105),
	(2, 'Fernando Wong', 4500, 'm', NULL, '1975-12-08', 105),
	(3, 'Alice Sousa', 2500, 'f', NULL, '1988-01-19', 104),
	(4, 'Janice Morais', 4300, 'f', NULL, '1970-06-20', 104),
	(5, 'Ronaldo Lima', 3800, 'm', NULL, '1982-09-15', 105),
	(6, 'Joice Leite', 2500, 'f', NULL, '1992-07-31', 105),
	(7, 'Antonio Pereira', 2500, NULL, 4, '1989-03-29', 104),
	(8, 'Juliano Brito', 5500, 'm', NULL, '1957-11-10', 101);

update funcionario set fkSupervisor = '2' 
	where idFunc = 1;
update funcionario set fkSupervisor = '8' 
	where idFunc = 2;
update funcionario set fkSupervisor = '7' 
	where idFunc = 3;
update funcionario set fkSupervisor = '8' 
	where idFunc = 4;
update funcionario set fkSupervisor = '1' 
	where idFunc = 5;
update funcionario set fkSupervisor = '1' 
	where idFunc = 6;
update funcionario set fkSupervisor = '4' 
	where idFunc = 7;

insert into Projeto values
	(1, 'Produto X', 'Santo André', 105),
	(2, 'Produto Y', 'Itu', 105),
	(3, 'Produto Z', 'São Paulo', 105),
	(10, 'Informatização', 'Mauá', 104),
	(20, 'Reorganização', 'São Paulo', 101),
	(30, 'Benefícios', 'Mauá', 104);


insert into FuncProj (fkFunc, fkProj, horas) values 
	(1, 1, 32.5),
	(1, 2, 7.5),
	(5, 3, 40.0),
	(6, 1, 20.0),
	(6, 2, 20.0),
	(2, 2, 10.0),
	(2, 3, 10.0),
	(2, 10, 10.0),
	(2, 20, 10.0),
	(3, 30, 30.0),
	(3, 10, 10.0),
	(7, 10, 35.0),
	(7, 30, 5.0),
	(4, 30, 20.0),
	(4, 20, 15.0),
	(8, 20, NULL);

SELECT * FROM funcionario;
select * from departamento;
select * from projeto;
select * from FuncProj;

-- Não é possivel adicionar pois o idFUnc não pode ser nulo

-- Não consegui inserir pois esse idFunc ja existe para outro funcionario

-- Não é possivel inserir pois o departamento 107 mão existe

insert into funcionario (idFunc,nomeFunc,salario,sexo,fkSupervisor,dtNasc,fkDepto) values 
	(9,'Cecilia Ribeiro',2800,'f',null,'1980-04-05', 104);

delete from FuncProj where 
	fkFunc = 3 
		and fkProj = 10; 
			-- É possivel apagar pois estou apagando duas fks de uma tabela a parte, mas não conseguiria apagar os seus registro originarios


-- Excluir a tupla da tabela Funcionario, em que idFunc=4. Conseguiu excluir? Por que?
-- Não pois esse id esta como fk em outras tabelas, o que não me permite excluir diretamente em sua tabela original

-- Excluir a tupla da tabela Funcionário, em que idFunc=2. Conseguiu excluir? Por que?
-- Não pois esse id esta como fk em outras tabelas, o que não me permite excluir diretamente em sua tabela original

update funcionario 
	set salario = 2800 
		where idFunc = 3; 
			-- Sim, consegui pois é uma alteração valida ja que não possui nenhum impeditivo

update funcionario 
	set fkDepto = 101 
		where idFunc = 3; 
			-- Consegui pois é uma alteração valida visto que o idDepto 101 existe em outra tabela;

-- Não será possível alterar pois o idDepto 107 não existe

select dtNasc, salario from funcionario 
	where nomeFunc = 'João Silva';

select salario from funcionario;

select distinct(salario) from funcionario;

select * from funcionario 
	order by nomeFunc;

select * from funcionario 
	order by salario desc;

SELECT * FROM funcionario 
	WHERE salario BETWEEN 2000 AND 4000;

select nomeFunc,salario from funcionario 
	where nomeFunc like 'J%';

select nomeFunc,salario from funcionario 
	where nomeFunc like '%a';

select nomeFunc from funcionario 
	where nomeFunc like '__n%';

select nomeFunc,dtNasc from funcionario 
	where nomeFunc like '%S__';

select * from funcionario join Departamento 
	on fkDepto = idDepto 
		where Departamento.nome = 'Pesquisa';

select * from funcionario join Departamento 
	on fkDepto = idDepto 
		where Departamento.nome = 'Pesquisa' 
			and funcionario.salario > 3500;

select * from funcionario join Departamento 
	on fkDepto = idDepto 
		where Departamento.nome = 'Pesquisa' 
			and funcionario.nomeFunc like 'J%';

select f.idFunc as idFuncionario, f.nomeFunc as nomeFuncionario, s.idFunc as idSupervisor, s.nomeFunc as nomeSupervisor from funcionario as f 
	join funcionario as s on f.fkSupervisor = s.idFunc;

select p.idProj, p.fkDeptoProj, g.nomeFunc, g.dtNasc from Projeto as p join Departamento on fkDeptoProj = idDepto join funcionario as g
	on fkDepto = idDepto where p.localProj = 'São Paulo';

select f.idFunc, f.nomeFunc, p.idProj, p.nomeProj, fp.horas from funcionario as f join FuncProj as fp on fkFunc = f.idFunc join projeto as p 
	on fkProj = p.idProj;

select nomeFunc from funcionario where year(dtNasc) < 1980;

select count(distinct(salario)) from funcionario;

select count(distinct(localProj)) from Projeto;

select avg(salario) from funcionario;
select sum(salario) from funcionario;

select min(salario) from funcionario;
select max(salario) from funcionario;

select d.idDepto, avg(f.salario), sum(f.salario) from Departamento as d join funcionario as f on d.idDepto = f.fkDepto group by d.idDepto;
select d.idDepto, min(f.salario), max(f.salario) from Departamento as d join funcionario as f on d.idDepto = f.fkDepto group by d.idDepto;

insert into funcionario values
	(10,'José da Silva',1800,'m',3,'2000-10-12', null),
	(11,'Benedito Almeida',1200,'m',5,'2001-09-01', null);


insert into Departamento values
	(110,'RH',3,'2018-11-19');

-- describe para ajudar na modelagem

desc funcionario;
desc Departamento ;
desc FuncProj;
desc Projeto;



drop database Exercicio11;