create database if not exists show_pass;
use show_pass;

create table if not exists cliente(
id_cliente int primary key auto_increment,
nome_completo varchar(150) not null,
cpf varchar(14) unique not null,
email varchar(100) unique not null,
fone varchar(20) null,
data_cadastro datetime default current_timestamp
);

create table if not exists arena(
id_arena int primary key auto_increment,
nome varchar(100) not null,
endereco varchar(150) not null,
cidade varchar(50) not null,
estado char(2) not null,
capacidade_total int not null
);

create table if not exists setores(
id_setores int primary key auto_increment,
id_arena int not null,
nome_setor varchar(50) not null,
descricao varchar(100),
foreign key (id_arena) references arena (id_arena) 
);

create table if not exists assentos (
id_assentos int primary key auto_increment,
id_setores int not null,
codigo_assento varchar(10) not null,
fuleira varchar(5) not null,
numero int not null,
foreign key (id_setores) references setores (id_setores)
);

create table if not exists eventos (
id_evento int primary key auto_increment,
id_arena int not null,
nome_evento varchar(100) not null,
categoria varchar(50) not null,
data_hora datetime not null,
status varchar(20) not null default 'confirmado',
foreign key (id_arena) references arena (id_arena)
);

create table if not exists precos_setor (
id_preco INT AUTO_INCREMENT PRIMARY KEY,
id_evento INT NOT NULL,
id_setores INT NOT NULL,
valor DECIMAL(10,2) NOT NULL,
foreign key (id_evento) references eventos (id_evento),
foreign key (id_setores) references setores(id_setores)
);

create table if not exists vendas(
id_venda int primary key auto_increment,
id_cliente INT NOT NULL,
data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
valor_total DECIMAL(10,2) NOT NULL,
forma_pagamento VARCHAR(30) NOT NULL,
status_venda VARCHAR(20) NOT NULL DEFAULT 'Aprovada',
foreign key (id_cliente) references cliente (id_cliente)
);

create table if not exists ingressos(
id_ingresso int primary key auto_increment,
id_venda int not null,
id_evento int not null,
id_assentos int not null,
id_preco int not null,
codigo_qr varchar(100) not null unique,
status_ingresso varchar(20) not null default 'valido',
foreign key (id_venda) references vendas (id_venda),
foreign key (id_evento) references eventos (id_evento),
foreign key (id_assentos) references assentos (id_assentos),
foreign key (id_preco) references precos_setor (id_preco)
);
