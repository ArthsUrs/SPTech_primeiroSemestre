use Sprint2;

create table projeto (
	idProjeto int primary key not null auto_increment,
	nomeProjeto varchar(45),
    DescProjeto varchar(45)
);

create table aluno (
	ra int primary key not null auto_increment,
    nomeAluno varchar(45),
    telefone varchar(45),
    fkSuper int,
    fkProjeto int,
    constraint fkSuper foreign key (fkSuper) references aluno(ra),
	constraint fkProjeto foreign key (fkProjeto) references projeto(idProjeto)
);

create table acompanhante (
	fkAluno int,
    idAcomp int,
    primary key (idAcomp, fkAluno),
    nomeAcomp varchar(45),
    parentesco varchar(45),
    constraint fkAluno foreign key (fkAluno) references aluno(ra)
);

select * from acompanhante;
select * from projeto;
select * from aluno;

truncate table projeto;

insert into projeto (nomeProjeto) values 
('Reflorestamento da amazonia'), 
('Verticalização de cidades do Interior');

insert into acompanhante (fkAluno, idAcomp, nomeAcomp, parentesco) values 
(1232099, 1, 'Ronaldo', 'Pai'), 
(1232899, 1, 'Fernanda', 'Mãe'), 
(1232777, 1, 'Arthur', 'Primo');

SELECT * FROM aluno;

insert into aluno (ra, nomeAluno, fkProjeto, fkSuper) values 
(1232099, 'Guilherme', 1, null),
(1232899, 'Bianca', 1, null), 
(1232777, 'Rafael', 2, null);

update aluno set fkSuper = 1232899
	where ra = 1232099;

select * from acompanhante;
select * from projeto;
select * from aluno;


-- Exibir os dados dos alunos e dos projetos correspondentes
select * from aluno join projeto
	on idProjeto = fkProjeto;
    
-- Exibir os dados dos alunos e dos seus acompanhantes.
select * from acompanhante join aluno
	on fkAluno = ra;
    
-- - Exibir os dados dos reprentantes e dos seus alunos.
select * from aluno as aluno join aluno as Supervisor
	where aluno.ra = Supervisor.fkSuper;
    
-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta).
select * from aluno as a join projeto as p 
	on idProjeto = fkProjeto	
		where p.nomeProjeto = 'Reflorestamento da amazonia';
        
-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes.
select * from aluno as a join projeto as p
	on idProjeto = fkProjeto
		join acompanhante as acomp 
			on fkAluno = ra;
            
-- Teste para exibir todos os dados
select * from aluno as a left join aluno as s
	on s.ra = a.fkSuper
		join projeto as p
			on p.idProjeto = a.fkProjeto
				join acompanhante as acomp 
					on acomp.fkAluno = a.ra;
-- Exercicio 02

use Sprint2;

create table campanha (
	idCamp int primary key auto_increment,
    categDoa varchar(45),
    institDoa varchar(45),
    dtFinal varchar(45),
    fkOrg int,
    constraint fkOrg foreign key (fkOrg) references organizador(idOrg)
) auto_increment = 500;

create table organizador (
	idOrg INT primary key auto_increment,
    nomeOrg varchar(45),
    emailOrg varchar(45),
    bairroOrg varchar(45),
    ruaOrg varchar(45),
    fkExpert int,
    constraint fkExp foreign key (fkExpert) references organizador(idOrg)
);

desc campanha;
desc organizador;

insert into campanha (categDoa, institDoa, dtFinal) values 
("Mascaras",  "Instituto Ayrton Senna", "2021-03-14"), 
("produto Higienes", "AACD",  "2022-12-25"), 
("Alimentos", "Instituto Ayrton Senna", "2020-03-15");

select * from organizador;
select * from campanha;

insert into organizador(nomeOrg, emailOrg, bairroOrg, ruaOrg) values 
("João", "joao@organizador.com", "Vila Matilde", "Rua São Gonçalves"), 
("Guilherme", "Guilherme@organizador.com", "Jardim Suzano", "Rua Clóvis Barreto"), 
("Pedro", "Pedro", "Jardim Reinberg", "Rua Peixe Peixot de peixes");

update organizador set fkExpert = 6
	where idOrg = 4; 
    
update organizador set fkExpert = 6
	where idOrg = 5;
    
update campanha set fkOrg = 6
	where idCamp = 515;
    
update campanha set fkOrg = 6
	where idCamp = 516;
    
update campanha set fkOrg = 5
	where idCamp = 517;
    
    
-- Exibir os dados dos organizadores e os dados de suas respectivas campanhas
select * from organizador join campanha 
	on fkOrg = idOrg;
    
-- Exibir os dados de um determinado organizador (informar o nome do organizador na consulta) e os dados de suas respectivas campanhas

select * from organizador join campanha 
	on fkOrg = idOrg
		where nomeOrg = 'Guilherme';
        
-- Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores.
    
select * from organizador as E join organizador as O
	on O.idOrg = E.fkExpert;
    
-- Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores, porém somente de um determinado organizador
-- orientador (informar o nome do organizador orientador na consulta).

select * from organizador as E join organizador as O
	on O.fkExpert = E.idOrg 
		where E.nomeOrg = "Pedro";
        
-- Exibir os dados dos organizadores novatos, os dados das respectivas campanhas organizadas e os dados dos respectivos organizadores orientadores.

select * from organizador as o join campanha 
	on fkOrg = idOrg
		join organizador as e
			on e.fkExpert = o.idOrg;
            
-- Exibir os dados de um organizador novato (informar o seu nome na consulta),
-- os dados das respectivas campanhas emque trabalha e os dados do seu
-- organizador orientador.

select * from organizador as o join campanha 
	on fkOrg = idOrg
		join organizador as e
			on o.idOrg = e.fkExpert
				where e.nomeOrg = "Guilherme";
                


