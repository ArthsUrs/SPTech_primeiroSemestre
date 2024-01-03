CREATE database aulas;

use aulas;

create table paciente (
	idPaciente int primary key auto_increment,
    nome varchar(45)
);

insert into paciente (nome) values 
	('Bryan'), 
	('Toreto');
    
create table medico (
	idMedico int primary key auto_increment,
    nome varchar(45),
    salario decimal(10,2)
) auto_increment = 100;

insert into medico (nome, salario) values 
('Mia', 100.99), 
('Letty', 200.99), 
('Han', 99.99);


-- tabela associativa 
-- sempre sera fraca

create table consulta (
	idConsulta int,
    fkMedico int,
    fkPaciente int,
    primary key (idConsulta, fkMedico, fkPaciente),
    dtConsulta datetime,
    constraint fkMedico foreign key (fkMedico) references medico (idMedico),
    constraint fkPaciente foreign key (fkPaciente) references paciente (idPaciente) 
);

insert into consulta values (1,100,1, '2023-10-30 14:00:00'), 
(2,100,1, '2023-08-30 14:00:00'), 
(3,100,2, '2023-10-30 15:00:00');

select * from medico join consulta 
	on fkMedico = idMedico
		join paciente 
			on fkPaciente = idPaciente
				WHERE dtConsulta like '2023-10-30%';

