use Sprint2;

create table tabelaA (
	idTabelaA int primary key,
    nome varchar(45)
);

create table tabelaB (
	idTabelaB int,
    fkTabelaA int,
    primary key (idTabelaB, fkTabelaA),
    nomeB varchar(45),
    fkBB int,
    constraint fkBB foreign key (fkBB) references tabelaB(idTabelaB),
    foreign key (fkTabelaA) references tabelaA (idTabelaA)
);

insert into tabelaA values 
(1, "Arthur silva");


insert into tabelaB (idTabelaB, fkTabelaA, nomeB, fkBB) values 
(1, 1, "Arthur Nobrega", null),
(2, 1, "Leonardo", null);

update tabelaB set fkbb = 2
	where idTabelaB = 1;


select * from tabelaA;
select * from tabelaB;

select * from tabelaB as b join tabelaA as a
	on a.idTabelaA = b.fkTabelaA
		join tabelaB as BB
			on b.idTabelaB = BB.fkBB;
    
