create database sprint3;

use sprint3;

use Venda;

create table produto (
	idProduto int primary key auto_increment,
    nome varchar(45),
    descProd varchar(45),
    preco decimal(8,2)
);

create table cliente (
	idCliente int primary key auto_increment,
    nome varchar(45),
    email varchar(45),
    endereco varchar(45),
    fkRef int,
    constraint fkRef foreign key (fkRef) references cliente(idCliente)
);

select * from cliente;

create table venda (
	idVenda int primary key auto_increment,
    totVenda varchar(45),
    dtVenda varchar(45),
    fkCliente int,
    constraint fkCliente foreign key (fkCliente) references cliente(idCliente)
);

create table notaFiscal (
	fkVenda int, 
    fkProduto int,
    idVenda int,
    primary key (fkVenda, fkProduto, idVenda),
    descVenda varchar(45),
    qtdVenda int,
    desconto varchar(45),
    constraint fkVenda foreign key (fkVenda) references venda(idVenda),
    constraint fkProduto foreign key (fkProduto) references produto(idProduto)
);

insert into produto (nome, descProd, preco) values ('God of War', 'Jogo muito bom!', 300.00), 
('The legend of zelda', 'Esse jogo é muito bom', 375.00), 
('Five Nights at Freddys', 'Jogo forte', 150.00);

select * from produto;

insert into cliente (email, fkRef) values ('arthur@email.com', null),
('pedro@gmail.com', null), 
('Ricardo@gmail.com', null);

update cliente set fkRef = 1
	where idCliente = 2;
    
update cliente set fkRef = 1
	where idCliente = 3;

insert into venda (totVenda, dtVenda, fkCliente) values ('170,00', '23-01-2023', 1), 
('150,00', '15-05-2023', 1), 
('222,99', '04-12-2023', 2),
('315,00', '05-07-2023', 1),
('400,00', '24-12-2023', 3),
('99,99', '09-09-2023', 3);

insert into notaFiscal values (1, 1, 1, 'Compras do God Of War do Arthur', 1, null),
(2, 2, 2, 'Compras de The legend of Zelda de', 2, null), 
(3, 3, 3, 'Compras de Fnaf do Ricardo', 2, null),
(4, 3, 4, 'Compras de Fnaf do Ricardo', 2, null),
(5, 1, 5, 'Compras de Fnaf do Ricardo', 2, null),
(6, 1, 6, 'Compras de Fnaf do Ricardo', 2, null);


-- Exibir os dados dos clientes e os dados de suas respectivas vendas
 
select * from cliente join venda 
	on fkCliente = idCliente; 	
    
-- Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.
    
select * from cliente join venda 
	on idCliente = fkCliente   
		where cliente.email = 'arthur@email.com';
        
-- Exibir os dados dos clientes e de suas respectivas indicações de clientes.
select * from cliente as c join cliente as r
	on c.idCliente = r.fkRef;
    
-- Exibir os dados dos clientes indicados e os dados dos respectivos clientes
-- indicadores, porém somente de um determinado cliente indicador (informar o nome
-- do cliente que indicou na consulta).

select * from cliente as c join cliente as r
	on c.idCliente = r.fkRef
		where r.email = 'pedro@gmail.com';
        
-- Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os
-- dados das respectivas vendas e dos produtos.

select * from cliente as c join cliente as r 
		on c.idCliente = r.fkRef
			join venda on c.idCliente = fkCliente;
            
-- esta fiquei um pouco em duvida

-- Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.

select * from notaFiscal join produto
	on fkProduto = idProduto
		where produto.nome = 'God of War';
        
--  Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto

select * from notaFiscal join produto.qtdVenda
	on fkProduto = idProduto;
    
--  Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, e os clientes que não realizaram nenhuma venda.

	-- Estou em duvida com relação a criação de um cliente novo, esqueci como faz, imagino que não tenha que usar insert into, mas para seguir com o ex usarei ele

insert into cliente (email, fkRef) values ('Ana@gmail.com', 2);

select * from cliente left join venda 
	on idCliente = fkCliente  
		where cliente.email = 'Ana@gmail.com';