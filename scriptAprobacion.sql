drop database proyecto_aprobacion;
CREATE DATABASE  IF NOT EXISTS proyecto_aprobacion;
USE proyecto_aprobacion;

create table tb_solicitante
(
codSolicitante int primary key not null AUTO_INCREMENT,
nombreSoli varchar(40) not null,
apellidosSoli varchar(40) not null,
dniSoli int not null,
distrito varchar(20) not null,
direccion varchar(50) not null,
celular int not null,
sexo varchar(15) not null,
tipoContratacion varchar(15) not null

);

create table tb_oficio
(
codigoOficio int primary key NOT NULL AUTO_INCREMENT,
codOficio varchar(9) unique key default null ,
codSolicitante int not null,
fechaOficio date,
asuntoOficio varchar(50) not null,
nomSecretaria varchar(70) not null,
mensaje varchar(500) not null
-- vFOREIGN KEY (codSolicitante) REFERENCES tb_solicitante(codSolicitante)
);



create table tb_expediente
(
codigoExpediente int primary key NOT NULL AUTO_INCREMENT,
codExpediente varchar(9) unique key default null,
fechaExpe date DEFAULT NULL,
fechaExpeSalida date DEFAULT NULL,
nomSecretaria varchar(70) not null,
estadoExpe varchar(15) not null,
codOficio varchar(9) not null,
FOREIGN KEY (codOficio) REFERENCES tb_oficio(codOficio)
);


create table tb_memorando
(
codigoMemorando  int primary key NOT NULL AUTO_INCREMENT,
codMemo varchar(9) unique key default null,
fechaMemo date DEFAULT NULL,
asuntoMemo varchar(70) not null,
nomGerente varchar(70) not null,
codExpediente varchar(9) not null,
mensaje varchar(500) not null,
FOREIGN KEY (codExpediente) REFERENCES tb_expediente(codExpediente)
);

CREATE TABLE tb_usuario (
  codigoUsuario int primary key not null AUTO_INCREMENT,
  loginUsuario varchar(15) DEFAULT NULL,
  passUsuario varchar(15) DEFAULT NULL,
  nombreUsuario varchar(15) DEFAULT NULL,
  ApellidoUsuario varchar(15) DEFAULT NULL
);

CREATE TABLE tb_menu (
  codigoMenu int primary key not null AUTO_INCREMENT,
  des_men varchar(30) DEFAULT NULL,
  urlMenu varchar(400) DEFAULT NULL
);
CREATE TABLE tb_acceso (
  codigoMenu int  not null,
  codigoUsuario int  not null,
  PRIMARY KEY (codigoMenu,codigoUsuario),

  KEY codigoUsuario (codigoUsuario),
  FOREIGN KEY (codigoMenu) REFERENCES tb_menu (codigoMenu),
  FOREIGN KEY (codigoUsuario) REFERENCES tb_usuario (codigoUsuario)
);

INSERT INTO tb_solicitante VALUES 
(1,'Juan Carlos','Salas Rola',76589047,'Subtanjalla','Jr.Union 475', 978956789,'Masculino','Bienes'),
(2,'Maria','Sandoval Perla',77896787,'Ica','La portada', 900678456,'Femenino','Servicios'),
(3,'Luisa','Molina Fernandez',78896787,'Ica','Jr.Limas 768', 990678666,'Femenino','Obras');

INSERT INTO tb_oficio VALUES 
(1,'OF0001',1,'2022/01/01','Adjunto Oficio del Solicitante','Rosa Gutierrez Pelaes','jsjsjsjsj');

INSERT INTO tb_expediente VALUES 
(1,'EX0001','2022/01/01','2022/01/04','Milagros Luz Rios Arias','Conforme','OF0001');
INSERT INTO tb_memorando VALUES 
(1,'ME0001','2022/01/09','Contrato aprobado','Carlos Torres Sandoval','EX0001','jsjsjsjsjsjsjjs');

INSERT INTO tb_menu VALUES 
(1,'Generar Solicitante','ServletSolicitante?tipo=LISTAR'),
(2,'Generar Oficio','ServletOficio?tipo=LISTAR'),
(3,'Generar Expediente','ServletExpediente?tipo=LISTAR'),
(4,'Generar Memorando','ServletMemorando?tipo=LISTAR'),
(5,'Consulta de Expediente','ServletExpediente?tipo=LISTARCONSULTAR');
INSERT INTO tb_usuario VALUES 
(1,'rosa','rosa','Rosa Mercedes','Felipa Chavez'),
(2,'milagros','milagros','Milagros Luz','Rios Arias'),
(3,'gerente','gerente','Carlos','Torres Sandoval');
INSERT INTO tb_acceso VALUES (1,1),(2,1),(3,2),(4,3),(5,3);


