-- aula 12
-- correção cliente x venda x produto
create database revendedor;
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


select * from cliente join venda 
	on idCliente = fkCliente
		join carrinho 
			on idVenda = fkVenda and fkClienteVenda = fkCliente -- Como não colocamos um id em carrinho necessita fazer o acerto de ambas as foreign's keys
				join produto 
					on idProduto = fkProduto;

-- como dropar uma foreign key:
-- alter table venda drop constraint 'nome da constraint da foreign key';


-- FUNÇÕES MATEMATICAS DENTRO DO MYSQL

select preco from produto;

-- COUNT - QUANTIDADE de INSERTS se tem DENTRO de um CAMPO (INSERTS COM VALOR)
select count(preco) from produto;

-- DISTINCT -  mostra VALORES DIFERENTES 
select distinct preco from produto; -- O UNICO QUE NÃO USA PARENTESES

-- SOMA -- FUNÇÃO de SOMA (NECESSÁRIO SER NUMERO INT)
select sum(preco) FROM produto;

-- MEDIA 
select avg(preco) from produto;

-- ARREDONDAR 
select round(avg(preco), 2) from produto; -- ARREDONDOU o PREÇO com DUAS casas DECIMAIS

--  maior valor
select max(preco) from produto;

--  menor valor 
select min(preco) from produto;

update produto set validade = '2023-11-06' 
	where idProduto in (100,102);
    
update produto set validade = '2023-11-30'
	where idProduto = 101;

select * from produto;

-- AGRUPAMENTO 
select validade, sum(preco) from produto 
	group by validade;
    
-- limit
select * from produto order by idProduto desc limit 1;	

-- teste
select
case 
when preco <= 9.99 then 'BARATO'
else 'CARO' 
end as Campo from produto;