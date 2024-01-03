create database matematica;

use matematica;

create table professor(
	idProfessor int primary key auto_increment,
    nome varchar(45),
    disciplina varchar(45)
)auto_increment = 10;

create table grupo (
	idGrupo int primary key auto_increment,
    nome varchar(45),
    descProjeto varchar(45)
);

create table avaliacao(
	idAval int,
	fkProfessor int,
    fkGrupo int,
    primary key (idAval, fkProfessor, fkGrupo),
    dtAval datetime,
    nota decimal(4,2)
);

create table aluno (
	idAluno int auto_increment,
    fkGrupo int,
    primary key (idAluno, fkGrupo),
    nome varchar(45),
    email varchar(45),
    constraint fkGrupo foreign key (fkGrupo) references grupo(idGrupo)
);

insert into professor (nome, disciplina)values
('Caio', 'logica'), 
('JotaPê', 'algoritmos'), 
('Vivian', 'banco de dados');

insert into grupo (nome, descProjeto)values 
('data centers', 'monitoramento de temp em data centers'), 
('estrusoras', 'monitoramente de temperatura de extrusoras');

insert into avaliacao values 
(1, 10, 1, '2023-11-27 10:20:00', '10.00'), 
(2, 11, 3, '2023-11-28 10:20:08', '07.20'),
(1, 12, 2, '2023-1-27 11:10:00', '08.90');

insert into aluno (nome, email, fkGrupo)values 
('arthur', 'arthur@gmail.com', 1), 
('gustavo', 'gustavo@gmail.com', 1), 
('Enzo', 'enzo@gmail.com', 2), 
('Vitor', 'vitor@gmail.com', 2);

-- exercicios

select * from grupo;
select * from aluno;
select * from avaliacao;
select * from professor;

-- 5
select * from grupo join aluno 
	on fkGrupo = idGrupo;
    
-- 6 
select * from grupo join aluno 
	on fkgrupo = idGrupo
		where grupo.nome = 'data centers';
        
-- 7
select avg(nota) from avaliacao join grupo
	on fkGrupo = idGrupo;
    
-- 8
select min(nota) from avaliacao join grupo
	on idGrupo = fkgrupo;
    
select max(nota) from avaliacao join grupo
	on idGrupo = fkgrupo;

-- 9
select sum(nota) from avaliacao join grupo
	on fkGrupo = idGrupo;
    
-- 10 
select * from avaliacao join professor
	on fkProfessor = idProfessor
		join grupo 
			on idgrupo = fkGrupo;
    
-- 11
select * from avaliacao join professor
	on fkProfessor = idProfessor
		join grupo
			on fkGrupo = idGrupo
				where grupo.nome = 'data centers';
                
-- 12 
select * from avaliacao join grupo
	on fkGrupo = idGrupo
		join professor 
			on fkProfessor = idProfessor
				where professor.nome = 'Vivian';
                
-- 13 NAO FEITO
select * from avaliacao join grupo 
	on avaliacao.fkGrupo = idGrupo
		join aluno 
			on aluno.fkGrupo = idAluno
				join professor 
					on idProfessor = fkProfessor;
                    
-- 14
select distinct nota from avaliacao;

-- 15
select professor.idProfessor, professor.nome, avg(nota), sum(nota) from avaliacao join professor
	on fkProfessor = idProfessor
		group by professor.idProfessor;
        
-- 16 
select grupo.idGrupo, grupo.nome, avg(nota) from avaliacao join grupo
	on idGrupo = fkGrupo
		group by grupo.idGrupo;
        
-- 17
select professor.idProfessor, professor.nome, min(nota), max(nota) from avaliacao join professor 
	on fkProfessor = idProfessor
		group by professor.idProfessor;
        
-- 18
select grupo.idGrupo, grupo.nome, min(nota), max(nota) from avaliacao join grupo
	on fkGrupo = idGrupo
		group by grupo.idGrupo;
