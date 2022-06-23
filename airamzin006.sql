create database aula1;

use aula1;

create table cidade(
id_cidade int not null primary key,
nome varchar(45),
uf char(2)
);

create table pessoa(
id_pessoa int not null primary key,
nome varchar(45) not null,
id_cidade1 int not null,
foreign key (id_cidade1) references cidade(id_cidade)
);