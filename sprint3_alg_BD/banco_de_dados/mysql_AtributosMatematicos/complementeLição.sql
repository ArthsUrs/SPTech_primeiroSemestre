-- aula 12
-- correção cliente x venda x produto
use revendedor;

create table cliente (
	idCliente int primary key auto_increment,
    nome varchar(45),
    email varchar(45),
    fkIndicador int,
    foreign key (fkIndicador) references cliente(idCliente)
);

insert into cliente values (null, 'beltrano', 'bletrano@gmail.com', null);

insert into cliente values (null, 'ciclano', 'ciclando@gmail.com', 1), 
(null, 'reafael', 'rafaela@gmail.com', 1);

select cliente.nome from cliente as cliente join cliente as indicador
	on indicador.fkIndicador = cliente.idCliente;
    
create table venda (
	idVenda int, 
    fkCliente int,
    primary key (idVenda, fkCliente),
    totalvenda decimal(10,2),
    tipoVenda varchar(45),
    check(tipoVenda in('Digital', 'Física')),
    foreign key (fkCliente) references cliente(idCliente)
);

insert into venda values
(1, 1, 100.99, 'Digital'),
(2, 1, 99.59, 'Digital'),
(3, 1, 599.29, 'Digital');

create table produto (
	idProduto int primary key auto_increment,
    nome varchar(45),
	validade date,
    preco double 
) auto_increment = 100;

insert into produto values 
(null, 'Perfume lili', null, 199.99), 
(null, 'Perfume 212', null, 9.99), 
(null, 'Perfume Malbec', null, 199.99);

create table carrinho (
	fkVenda int,
    fkClienteVenda int,
    fkProduto int,
    primary key (fkVenda, fkClienteVenda, fkProduto),
    desconto decimal(5,2),
    qtdProduto int,
    constraint fkVenda foreign key (fkVenda) references venda(idVenda),
    constraint fkClienteVenda foreign key (fkClienteVenda) references venda(fkCliente),
	constraint fkProduto foreign key (fkProduto) references produto(idProduto)
);

insert into carrinho values 
(1, 1, 100, null, 1),
(1, 1, 101, null, 2),
(1, 1, 102, null, 1);

-- Exibir o valor mínimo e o valor máximo dos preços dos produtos;
select min(preco) from produto;

select max(preco) from produto;

-- Exibir a soma e a média dos preços dos produtos;

select sum(preco) ,avg(preco) from produto;

-- Exibir a soma dos preços distintos dos produtos;

select sum(distinct preco) from produto;

--  Exibir a soma dos preços dos produtos agrupado por uma determinada venda;

select sum(preco) from carrinho join venda 
	on fkVenda = idVenda 
		join produto 
			on fkProduto = idProduto
				where idVenda = 1
					group by idVenda;
	