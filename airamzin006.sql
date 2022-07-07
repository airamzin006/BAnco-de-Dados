create database Henrique_CALVO;

use Henrique_CALVO;

create table cliente(
id_cliente int not null auto_increment primary key,
nome varchar(45) not null,
fone varchar(20) not null
);

create table valor(
id_valor int not null auto_increment primary key,
descricao varchar(45),
valor double not null
);

create table brasileiro(
id_cliente_fk int not null primary key,
cpf varchar(20) not null,
foreign key (id_cliente_fk) references cliente (id_cliente)
);

create table estrangeiro(
id_cliente_fk int not null primary key,
autorizacao varchar(30) not null,
foreign key (id_cliente_fk) references cliente (id_cliente)
);

create table cnh(
id_cnh int not null auto_increment primary key,
categoria varchar(45) not null,
data_vencimento date not null,
id_cliente_brasileiro int not null, 
foreign key (id_cliente_brasileiro) references brasileiro (id_cliente_fk)
);

create table carro(
id_carro int not null auto_increment primary key,
placa varchar(45) not null,
modelo varchar(45) not null,
nrpassagem int not null,
tipo varchar(45),
marca varchar(45),
vistoria varchar(45),
cor varchar(45),
valor_id_fk int not null,
foreign key (valor_id_fk) references valor(id_valor)
);

create table emprestimo(
id_emprestimo int not null auto_increment,
data_saida date not null,
hora_saida time not null,
data_volta date,
desconto varchar(45),
hora_volta time,
nrusuario int,
cliente_id_fk int not null,
carro_id_fk int not null,
primary key(id_emprestimo),
foreign key(cliente_id_fk) references cliente(id_cliente),
foreign key(carro_id_fk) references carro (id_carro)
);

create table seguro(
id_seguro int not null auto_increment primary key,
data_vencimento date not null,
seguradora varchar(45) not null,
carro_id_fk int not null,
foreign key(carro_id_fk) references carro(id_carro)
);