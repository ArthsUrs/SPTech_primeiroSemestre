use Sprint2;

create table pessoa (
	idPessoa Int primary key auto_increment,
    nomePessoa varchar(45),
    dtNasc datetime,
    profissao varchar(45)
);

create table gasto (
	idGasto int primary key auto_increment,
    dtGasto date,
    valor float(6,2),
    descGasto varchar(45),
    fkPessoa int,
    constraint fkPess foreign key (fkPessoa) references pessoa (idPessoa)
);

insert into pessoa(nomePessoa, dtNasc,  profissao) values 
("Jorge", "1999-03-04", "Advogado"), 
("Arthur", "2003-05-22", "Dev"), 
("Guilherme", "1995-01-09", "Analista de Sistemas");

select * from pessoa;
select * from gasto;

insert into gasto (dtGasto, valor, descGasto, fkPessoa)values 
("2023-03-20", "188.90", "Compra mensal comida", 3),
("2023-09-22", "200.20", "Assinatura mensal", 1), 
("2023-05-29", "10.10", "Docinho", 2);

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissão, etc).
select * from pessoa join gasto 
	on fkPessoa = idPessoa
		where pessoa.Profissao = "Dev";
        
-- Exiba os dados das pessoas e dos seus gastos correspondentes.
select * from pessoa join gasto 
	on fkPessoa = idPessoa;
    
-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes.
select * from pessoa join gasto
	on fkPessoa = idPessoa
		where pessoa.nomePessoa = "Arthur";
        
-- Atualize valores já inseridos na tabela.
update gasto set fkPessoa = 1
	where idGasto = 3;
    
-- Atualize valores já inseridos na tabela.

delete from pessoa 
	where idPessoa = 2;
    
-- Exercicio 3

use Sprint2;

create table setor (
	idSetor int primary key auto_increment,
	nomeSetor varchar(10),
    numAndar int
);

create table funcionario (
	idFunc int primary key auto_increment,
    nomeFun varchar(45),
    fone varchar(45),
    salario int,
    fkSetor int,
    constraint fkSetor foreign key (fkSetor) references setor (idSetor)
) auto_increment = 10;

create table acompanhante (
	idAcomp int,
    fkFunc int,
    primary key (idAcomp, fkFunc),
	nome varchar(45),
    parentesco varchar(45),
    dtNasc date
);

insert into setor (nomeSetor, numAndar) values (
"SetAbaixo", 1), ("SetAcima", 10);

insert into funcionario (nomeFun, salario, fkSetor) values (
"Guilherme", 11000, 1), 
("Gustavo", 13500, 2), 
("Enzo", 10550, 2);

insert into acompanhante (idAcomp, fkFunc, nome, parentesco) values (
1, 10, "Arthur", "Primo"), 
(2, 12, "Souza", "Irmão"), 
(3, 11, "Vitor", "Amigo");

select * from setor;
select * from funcionario;
select * from acompanhante;

-- Exibir os dados dos setores e dos seus respectivos funcionários
select * from setor join funcionario
	on fkSetor= idSetor;
    
-- Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários
select * from setor join funcionario 
	on fkSetor = idSetor
		where idSetor = 2;
        
-- - Exibir os dados dos funcionários e de seus acompanhantes.
select * from funcionario as f join acompanhante as a
	on a.fkFunc = f.idFunc;
    
-- Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes.
select * from funcionario as f join acompanhante as a 
	on a.fkFunc = f.idFunc
		where f.nomeFun = "Enzo";
        
-- - Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes.
select * from funcionario as f join setor as s
	on f.fkSetor = s.idSetor
		join acompanhante as a
			on a.fkFunc = f.idFunc;
            
-- Exercico 04

use Sprint2;

create table treinador (
	idTrein int primary key auto_increment,
    nome varchar(45),
    telefone char(11),
    email varchar(45),
    fkExpert int,
    constraint fkExpert foreign key (fkExpert) references treinador(idTrein)
)auto_increment = 100;

create table nadador (
	idNad int primary key auto_increment,
    nome varchar(45),
	estadoOrig varchar(45),
    dtNasc date,
    fkTrein int,
    constraint fkTrein foreign key (fkTrein) references treinador(idTrein)	
);

desc treinador;
desc nadador;

insert into treinador(nome, email) values (
"Cleyton", "Cleyton@treinador.com"), 
("Roberto", "Roberto@treinador.com"), 
("Gustavo", "Gustavo@treinadoE.com");

insert into nadador(nome, estadoOrig, fkTrein) values (
"Arthur", "São Paulo", 102), 
("Ismael", "Minas Gerais", 101), 
("Melissa", "Rio de Janeiro", 101),
("Juliana", "São Paulo", 100);

update treinador set fkExpert = 102
	where idTrein = 100;
    
update treinador set fkExpert = 102
	where idTrein = 101;


select * from nadador;
select * from treinador;


--  Exibir os dados dos treinadores e os dados de seus respectivos nadadores.

select * from treinador join nadador
	on fkTrein = idTrein;
    
-- Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores.
select * from treinador as t join nadador
	on fkTrein =  idTrein
		where t.nome = "Cleyton";
        
-- Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores
select * from treinador as t join treinador as E
	on E.fkExpert = t.idTrein;
    
-- Exibir os dados dos treinadores e os dados dos respectivos treinadores
-- orientadores, porém somente de um determinado treinador orientador (informar o nome do treinador na consulta).

select * from treinador as t join treinador as e 
	on e.fkExpert = t.idTrein 
		where t.nome = "Gustavo";
        
-- Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados dos respectivos treinadores orientadores
select * from treinador as t join treinador as e 
	on e.fkExpert = t.idTrein 
		join nadador as n 
			on n.fkTrein = t.idTrein;
            
-- Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos respectivos nadadores e os dados do seu treinador orientador.
select * from treinador as t join treinador as e
	on e.fkExpert = t.idTrein
		join nadador as n
			on n.fkTrein = t.idTrein
				where t.nome = "Gustavo";