Create database Sprint2;

use sprint2;


create table  Professor (
	idProfessor int primary key auto_increment,
    nome varchar(50),
    sobrenome varchar(30),
    especialidade1 varchar(40),
    especialidade2 varchar(40)
);

create table disciplinas (
	idDiscint int primary key auto_increment,
    nomeDisc varchar(45)
);

insert into Professor values
	(null, 'Vivian', 'Santos', 'Dados', 'Liderança'),
    (null, 'Jota', 'Pê', 'Programação', 'Programação de Jogos'),
    (null, 'Monica', 'Herreiro', 'Administração', 'Gestão de Projetos'),
    (null, 'Marise', 'Marise', 'Eletronica', 'Gestão de pessoas'),
    (null, 'Ferndanda', 'Caramico', 'Pedagogia', 'Liderança'),
    (null, 'Caio', 'Caio', 'Programação', 'Programação de Jogos');
    
insert into disciplinas values 
	(null, 'Algoritmo'),
    (null, 'Banco de dados'),
    (null, 'Arquitetura Computacional');
    
select * from disciplinas;
select * from Professor;

alter table Professor add column fkdisc int;

alter table Professor add foreign key (fkdisc)
		references disciplinas (idDiscint);
        
select * from Professor join disciplinas
	on idDiscint = fkdisc;
    
    update Professor set fkdisc = 1
		where idDiscint = 1;

-- Exercicio 2

use sprint2;

create table diretor (
	idDiretor int primary key auto_increment,
    nomeDiretor varchar(45),
    idadeDiretor varchar(45)
);

create table curso (
	idCurso INT primary key auto_increment,
    nomeCurso varchar(45) not null,
    fkDiretor int,
    foreign key (fkDiretor) references diretor(idDiretor)
) auto_increment = 1000;

insert into curso (nomeCurso) values (
"Programação"), (
"Administração"), (
"gastronomia");

insert into diretor (nomeDiretor, idadeDiretor) values (
"Gerson", "45"), (
"Rosana", "67"), (
"Guilherme", "34");

select * from curso;
select * from diretor;
        
update curso set fkDiretor = 1
	where idCurso = 1001;
    
update curso set fkDiretor = 3
	where idCurso = 1000;
    
update curso set fkDiretor = 2
	where idCurso = 1002;
    
select * from diretor
	join curso
		on  idDiretor = fkDiretor;
        
alter table diretor add constraint chkNomeDiretor
	check(nomeDiretor in ("Guilherme", "Gerson", "Rosana"));