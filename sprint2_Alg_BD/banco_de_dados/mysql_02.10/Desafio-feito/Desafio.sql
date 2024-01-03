use Sprint2;

create table pessoa (
	idPessoa int primary key auto_increment,
    nome varchar(45),
    cpf varchar(40),
    dtNasc date,
    fkMae int,
    foreign key (fkMae) references pessoa(idPessoa) -- Sempre lembrar que a foreign key é INT, caso esqueça, possívelmente dará erro.
);


alter table pessoa add constraint regra_mae_estrangeira foreign key (fkMae) references pessoa(Idpessoa);

desc pessoa;
drop table pessoa;

insert into pessoa (nome, cpf, dtNasc) values 
	('Arthur', '570.307.278-60', '2005-02-26'), 
	('Maria', '042.841.009-71', '1961-06-26');
    
select * from pessoa as M join pessoa as F
	on F.idPessoa = M.fkMae;
    
update pessoa set fkMae = 2
	where idPessoa = 1;
    
    select * from pessoa;