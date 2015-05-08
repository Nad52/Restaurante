CREATE DATABASE restaurant;
use restaurant;

CREATE TABLE factura(
idFactura INT(11) NOT NULL AUTO_INCREMENT,
NombreCliente VARCHAR (45),
PRIMARY KEY(idFactura));

CREATE TABLE Mesero(
idMesero INT(11) NOT NULL AUTO_INCREMENT,
Nombre VARCHAR (45),
Edad int (11),
Sexo VARCHAR(10),
PRIMARY KEY(idMesero));

CREATE TABLE orden(
idOrden INT(11) NOT NULL AUTO_INCREMENT,
NumMesa int(10),
CostoTotal int(11),
PRIMARY KEY(idOrden));

CREATE TABLE bebida(
idBebida INT(11) NOT NULL AUTO_INCREMENT,
TipoBebida VARCHAR (43),
Costo int(11),
PRIMARY KEY(idBebida));

Insert into bebida (TipoBebida,Costo) values ('Refresco Cola',12);
Insert into bebida (TipoBebida,Costo) values ('Refresco Dieta',15);
Insert into bebida (TipoBebida,Costo) values ('Agua Fresca',12);
Insert into bebida (TipoBebida,Costo) values ('Cerveza',20);

Select * FROM bebida;

CREATE TABLE temperatura(
idTemperatura INT(11) NOT NULL AUTO_INCREMENT,
tempBebida VARCHAR (40),
PRIMARY KEY(idTemperatura));

Insert into temperatura (tempBebida) values ('Al tiempo');
Insert into temperatura (tempBebida) values ('Frío');
Insert into temperatura (tempBebida) values ('Con hielo');
Select * FROM temperatura;


CREATE TABLE carne(
idCarne INT(11) NOT NULL AUTO_INCREMENT,
termino VARCHAR (40),
precio int(11),
PRIMARY KEY(idCarne));

Insert into carne(termino,precio) values ('Muy cruda', 150);
Insert into carne(termino,precio) values ('Cruda', 150);
Insert into carne(termino,precio) values ('Medio', 150);
Insert into carne(termino,precio) values ('Tres cuartos', 150);
Insert into carne(termino,precio) values ('Bien cocida', 150);
Select * FROM carne;

CREATE TABLE pollo(
idPollo INT(11) NOT NULL AUTO_INCREMENT,
picante VARCHAR (40),
precio int(11),
PRIMARY KEY(idpollo));

Insert into pollo(picante,precio) values ('Sin picante', 100);
Insert into pollo(picante,precio) values ('Poco picante', 105);
Insert into pollo(picante,precio) values ('Muy picante', 110);
Select * FROM pollo;

CREATE TABLE postre(
idpostre INT(11) NOT NULL AUTO_INCREMENT,
tipoPostre VARCHAR (40),
precio int(11),
PRIMARY KEY(idpostre));

Insert into postre(tipoPostre,precio) values ('Flan Napolitano', 20);
Insert into postre(tipoPostre,precio) values ('Pastel tres leches', 20);
Insert into postre(tipoPostre,precio) values ('Copa Helado', 25);
Insert into postre(tipoPostre,precio) values ('Flan Fruta', 22);
Select * From postre;

CREATE TABLE acompanante(
idAcompanante INT(11) NOT NULL AUTO_INCREMENT,
tipoAcompanante VARCHAR (40),
precio int(11),
PRIMARY KEY(idAcompanante));

Insert into acompanante(tipoAcompanante,precio) values ('Arroz', 15);
Insert into acompanante(tipoAcompanante,precio) values ('Frijoles', 15);
Insert into acompanante(tipoAcompanante,precio) values ('Elotes', 15);
Insert into acompanante(tipoAcompanante,precio) values ('Verduras', 15);
Insert into acompanante(tipoAcompanante,precio) values ('Papas fritas', 15);
Select * From acompanante;


CREATE TABLE platoFuerte(
idPlatoFuerte INT(11) NOT NULL AUTO_INCREMENT,
Especialidad VARCHAR (40),
precio int(11),
PRIMARY KEY(idPlatoFuerte));


CREATE TABLE entrada(
idEntrada INT(11) NOT NULL AUTO_INCREMENT,
precio int(11),
PRIMARY KEY(idEntrada));

CREATE TABLE estado(
idEstado INT(11) NOT NULL AUTO_INCREMENT,
estado VARCHAR (40),
PRIMARY KEY(idEstado));

INSERT INTO estado(estado) VALUES ('Capturada');
INSERT INTO estado(estado) VALUES ('En preparación de entrada');
INSERT INTO estado(estado) VALUES ('Entrada lista');
INSERT INTO estado(estado) VALUES ('En preparación de plato fuerte');
INSERT INTO estado(estado) VALUES ('Plato fuerte listo');
INSERT INTO estado(estado) VALUES ('En preparación postre');
INSERT INTO estado(estado) VALUES ('Postre listo');
INSERT INTO estado(estado) VALUES ('Pagada');
Select * FROM estado;

ALTER TABLE orden ADD COLUMN NumPersonas INT(8) AFTER NumMesa;

CREATE TABLE ordenBebida(
idOrden INT (11),
idBebida INT (11));

ALTER TABLE ordenBebida 
ADD FOREIGN KEY (idOrden) 
REFERENCES orden(idOrden);

ALTER TABLE ordenBebida 
ADD FOREIGN KEY (idBebida) 
REFERENCES bebida(idBebida);

Alter table bebida add column idTemperatura int(11);
ALTER TABLE bebida
ADD FOREIGN KEY (idTemperatura)
REFERENCES temperatura(idTemperatura);

CREATE TABLE factura(
idFactura int(11) NOT NULL AUTO_INCREMENT,
NombreCliente VARCHAR(11),
idMesero int(11),
PRIMARY KEY (idFactura));


Alter table entrada add column idAcompanante int(11);
ALTER TABLE entrada
ADD FOREIGN KEY (idAcompanante)
REFERENCES acompanante(idAcompanante);

Alter table platoFuerte add column idAcompanante int(11);
ALTER TABLE platoFuerte
ADD FOREIGN KEY (idAcompanante)
REFERENCES acompanante(idAcompanante);

Alter table platoFuerte add column idCarne int(11);
ALTER TABLE platoFuerte
ADD FOREIGN KEY (idCarne)
REFERENCES carne(idCarne);

Alter table platoFuerte add column idPollo int(11);
ALTER TABLE platoFuerte
ADD FOREIGN KEY (idPollo)
REFERENCES pollo(idPollo);

Alter table orden add column idFactura int(11);
ALTER TABLE orden
ADD FOREIGN KEY (idFactura)
REFERENCES factura(idFactura);

Alter table orden add column idEstado int(11);
ALTER TABLE orden
ADD FOREIGN KEY (idEstado)
REFERENCES estado(idEstado);

Alter table orden add column idEntrada int(11);
ALTER TABLE orden
ADD FOREIGN KEY (idEntrada)
REFERENCES entrada(idEntrada);

Alter table orden add column idPlatoFuerte int(11);
ALTER TABLE orden
ADD FOREIGN KEY (idPlatoFuerte)
REFERENCES platoFuerte(idPlatoFuerte);

Alter table orden add column idPostre int(11);
ALTER TABLE orden
ADD FOREIGN KEY (idPostre)
REFERENCES postre(idPostre);

Alter table factura add column idOrden int(11);
ALTER TABLE factura
ADD FOREIGN KEY (idOrden)
REFERENCES orden(idOrden);

UPDATE `restaurant`.`bebida` SET `idTemperatura`=1 WHERE `idBebida`='1';
UPDATE `restaurant`.`bebida` SET `idTemperatura`=2 WHERE `idBebida`='2';
UPDATE `restaurant`.`bebida` SET `idTemperatura`=3 WHERE `idBebida`='3';
UPDATE `restaurant`.`bebida` SET `idTemperatura`=4 WHERE `idBebida`='4';

UPDATE `restaurant`.`entrada` SET `idAcompanante`=11 WHERE `idEntrada`='1';
UPDATE `restaurant`.`entrada` SET `idAcompanante`=11 WHERE `idEntrada`='2';
UPDATE `restaurant`.`entrada` SET `idAcompanante`=11 WHERE `idEntrada`='3';
UPDATE `restaurant`.`entrada` SET `idAcompanante`=11 WHERE `idEntrada`='4';
UPDATE `restaurant`.`entrada` SET `idAcompanante`=11 WHERE `idEntrada`='5';

INSERT INTO `restaurant`.`mesero` (`idMesero`, `Nombre`, `Edad`, `Sexo`) VALUES (1, 'Eduardo', 20, 'M');
INSERT INTO `restaurant`.`mesero` (`idMesero`, `Nombre`, `Edad`, `Sexo`) VALUES (2, 'Gabriela', 22, 'F');
INSERT INTO `restaurant`.`mesero` (`idMesero`, `Nombre`, `Edad`, `Sexo`) VALUES (3, 'Paulina', 22, 'F');
INSERT INTO `restaurant`.`mesero` (`idMesero`, `Nombre`, `Edad`, `Sexo`) VALUES (4, 'Luis', 21, 'M');

UPDATE `restaurant`.`acompanante` SET `tipoAcompanante`='Sin Acompañante' WHERE `idAcompanante`='11';

ALTER TABLE restaurant.platofuerte DROP COLUMN precio;

INSERT INTO `restaurant`.`platofuerte` (`idPlatoFuerte`, `Especialidad`, `idAcompanante`, `idCarne`, `idPollo`) VALUES (1, 'Pollo', 1, 2, 1);
INSERT INTO `restaurant`.`platofuerte` (`idPlatoFuerte`, `Especialidad`, `idAcompanante`, `idCarne`, `idPollo`) VALUES (2, 'Pollo', 2, 3, 2);
INSERT INTO `restaurant`.`platofuerte` (`idPlatoFuerte`, `Especialidad`, `idAcompanante`, `idCarne`, `idPollo`) VALUES (3, 'Carne', 3, 1, 3);
INSERT INTO `restaurant`.`platofuerte` (`idPlatoFuerte`, `Especialidad`, `idAcompanante`, `idCarne`, `idPollo`) VALUES (4, 'Carne', 4, 3, 3);


INSERT INTO `restaurant`.`orden` (`idOrden`, `NumMesa`, `NumPersonas`, `CostoTotal`, `idEstado`, `idEntrada`, `idPlatoFuerte`, `idPostre`) VALUES (1, 1, 1, 215, 1, 1, 1, 1);
INSERT INTO `restaurant`.`orden` (`idOrden`, `NumMesa`, `NumPersonas`, `idEstado`, `idEntrada`, `idPlatoFuerte`, `idPostre`) VALUES (2, 3, 2, 2, 2, 2, 2);

Create table acompanante2(
idAcompanante2 int(11),
TipoAcompanante VARCHAR(43),
PRIMARY KEY (idAcompanante2));

INSERT INTO `restaurant`.`acompanante2` (`idAcompanante2`, `TipoAcompanante`) VALUES (1, 'Arroz');
INSERT INTO `restaurant`.`acompanante2` (`idAcompanante2`, `TipoAcompanante`) VALUES (2, 'Frijol');
INSERT INTO `restaurant`.`acompanante2` (`idAcompanante2`, `TipoAcompanante`) VALUES (3, 'Elotes');
INSERT INTO `restaurant`.`acompanante2` (`idAcompanante2`, `TipoAcompanante`) VALUES (4, 'Verduras');
INSERT INTO `restaurant`.`acompanante2` (`idAcompanante2`, `TipoAcompanante`) VALUES (5, 'Papas Fritas');

Alter table platoFuerte add column idAcompanante2 int(11);
ALTER TABLE platoFuerte
ADD FOREIGN KEY (idAcompanante2)
REFERENCES acompanante2(idAcompanante2);


Select * FROM ordenBebida;
Select * FROM platoFuerte;



Select NumMesa,NumPersonas, Nombre 
FROM orden O 
INNER JOIN factura F ON O.idOrden=F.idOrden;

Select 




nombreCliente;
entrada;
especialidad;
tipoEspecialidad;
postre;