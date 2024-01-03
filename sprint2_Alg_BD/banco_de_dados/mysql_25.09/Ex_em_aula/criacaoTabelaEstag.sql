use sptechb;

select user();

CREATE table supervisor (
	idSuper int primary key auto_increment,
    nome varchar(45)
);

insert into supervisor values
	(null, 'João'),
    (null, 'Maria');
    
create table estagiario (
	idEstagiario int primary key auto_increment,
    nome varchar(45) 
) auto_increment = 1000;

insert into estagiario values 
	(null, 'Pedro');

alter table estagiario add column fkSupervisor int;    
    
    
    
    
    


