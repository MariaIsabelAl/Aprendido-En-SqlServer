--3 - Crear una tabla (create table - sp_tables - sp_columns - drop table)
if OBJECT_ID('agenda') is not null
drop table agenda
Go
Create Table Agenda(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)
);
go
exec sp_tables @table_owner='dbo'
go 
exec sp_columns Agenda;
Drop table Agenda;
Drop table Agenda;

--4 - Insertar y recuperar registros de una tabla (insert into - select)
if OBJECT_ID ('Agenda') is not null
drop table Agenda;
Go
create Table Agenda(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)
);
go
exec sp_tables @table_owner='dbo'
go
exec sp_columns Agenda;
go
insert into agenda (apellido, nombre, domicilio, telefono) values ('Maria','Alberto','Cruce','451287');
insert into agenda (apellido,nombre, domicilio, telefono) values ('Nicol','Alberto','Cruce','654123');
go
select *from Agenda
go
drop table agenda;
drop table agenda;
Go
--5 - Tipos de datos básicos
 if object_id('peliculas')is not null
  drop table peliculas;
  Go
 create table peliculas(
  nombre varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );
 Go
 Exec sp_columns peliculas;
 insert into peliculas(nombre,actor, duracion, cantidad) values('Maria', 'Luis', 10, 4);
 
 select * from peliculas;
 go

 --6 - Recuperar algunos campos (select)
select nombre, actor from peliculas;
select nombre, duracion from peliculas;
go
--7 - Recuperar algunos registros (where)
select nombre, actor from peliculas
where nombre = 'juan';

go
--8 - Operadores relacionales
if object_id('articulos') is not null
  drop table articulos;
go
 create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
 );
 exec sp_columns articulos;
 go
 insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (4,'mouse','ingles HP',200,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (5,'monitor','español Biswal',100,50);
 go

 select * from articulos
  where nombre='impresora';

 select * from articulos
  where precio>=400;

 select codigo,nombre
  from articulos
  where cantidad<30;

 select nombre, descripcion
  from articulos
  where precio<>100;
  go

--9 - Borrar registros (delete)
 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );
 go
insert into agenda(apellido,nombre,domicilio,telefono) values('Alvarez','Alberto','Colon 123','4234567');
insert into agenda (apellido,nombre,domicilio,telefono) values('Juarez','Juan','Avellaneda 135','4458787');
insert into agenda (apellido,nombre,domicilio,telefono) values('Lopez','Maria','Urquiza 333','4545454');
Go
delete from agenda
where nombre = 'Juan';
select *from agenda
go
delete from agenda
 where telefono='4545454';
 select *from agenda
 go
 delete from agenda
 select *from agenda;

--10 - Actualizar registros (update)
 go
insert into agenda(apellido,nombre,domicilio,telefono) values('Alvarez','Alberto','Colon 123','4234567');
insert into agenda (apellido,nombre,domicilio,telefono) values('Juarez','Juan','Avellaneda 135','4458787');
insert into agenda (apellido,nombre,domicilio,telefono) values('Lopez','Maria','Urquiza 333','4545454');
go
select *from agenda;
update agenda set nombre = 'Juan Maria'
where nombre = 'Juan';
go
select *from agenda
go
update agenda set telefono = '3831662'
Where telefono = '4458787';
select *from agenda
go

--11 - Comentarios
/*Comentanto ejercicios*/

go

--12- Valores null (is null)
if object_id('medicamentos') is not null
   drop table medicamentos;
go
create table medicamentos(
  codigo integer not null,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer not null
);
go
exec sp_columns medicamentos
go
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(1,'Aceptaminophen',null,null,10); 
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(2,'Sertal compuesto',null,8.90,150);
go
insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Aspirinas','',0,150);
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(0,'','Bayer',15.60,0);
select *from medicamentos
go
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(null,'Amoxidal jarabe','Bayer',25,120);
go
select codigo, nombre from medicamentos
where precio is null
go
select codigo, laboratorio from medicamentos
where precio is null
go
select * from medicamentos
where laboratorio=''
go
select * from medicamentos
  where laboratorio<>'';
go
select * from medicamentos
where laboratorio is not null;
go
select * from medicamentos
where precio<>0;
go
select * from medicamentos
where precio is not null
go

--13 - Clave primaria
if object_id('libros') is not null
 drop table libros;
 Go
 create table libros(
  codigo int not null,
  titulo varchar(40) not null,
  autor varchar(20),
  editorial varchar(15),
  primary key(codigo)
);
 Go
 insert into libros (codigo,titulo,autor,editorial) values (1,'El coronel','Gabriel','La pequeña');
 insert into libros (codigo,titulo,autor,editorial) values (2,'La gaviota','Jose perdero','Planeta');
 Go
 insert into libros (codigo,titulo,autor,editorial) values (2,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
 Go
 insert into libros (codigo,titulo,autor,editorial) values (null,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
 Go
 update libros set codigo=1
  where titulo='El coronel';
select *from libros
Go

--14 - Campo con atributo Identity
if object_id('medicamentos') is not null
  drop table medicamentos;

 create table medicamentos(
  codigo int identity,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 );
 go
 exec sp_columns medicamentos;
 Go
 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200);
 Go
 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Amoxilina 500','Bayer',15.60,100);
 Go
 update medicamentos set codigo=5
  where nombre='Bayaspirina';
Go
delete from medicamentos
where codigo=3;
Go
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxilina 500','Bayer',15.60,100);
Go
select * from medicamentos;
Go

--15 - Otras características del atributo Identity
if object_id('medicamentos') is not null
  drop table medicamentos;

 create table medicamentos(
  codigo integer identity(10,1),
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 );
 Go
 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxicilina','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Aceptaminophen','Roche',4.10,200);
 Go
 select * from medicamentos;
 Go
 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Amoxilina 500','Bayer',15.60,100);
 Go
 set identity_insert medicamentos on;
 go
 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxilina 500','Bayer',15.60,100);
 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(10,'Amoxilina 500','Bayer',15.60,100);
Go
select IDENT_SEED('medicamentos');
select IDENT_INCR('medicamentos');
Go

--16 - Truncate table
if object_id('alumnos') is not null
drop table alumnos;

create table alumnos(
  legajo int identity,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30)
);
 Go
 insert into alumnos (documento,nombre,domicilio) values('20170305','Maria Mariana','Duarte 21');
 insert into alumnos (documento,nombre,domicilio) values('20159636','Morales Marcos','Cristo Rey');
 Go
 delete from alumnos
 Go
 insert into alumnos (documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234');
 insert into alumnos (documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348');
 Go
 select * from alumnos;
 Go
 truncate table alumnos;
insert into alumnos (documento,nombre,domicilio) values('20170305','Maria Mariana','Duarte 21');
insert into alumnos (documento,nombre,domicilio) values('20159636','Morales Marcos','Cristo Rey');
Go
select *from alumnos;
Go

--17 - Tipo de dato (texto)
 if object_id('autos') is not null
  drop table autos;

 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio float,
  primary key (patente)
 );
Go
insert into autos values('ACD123','Fiat 128','1970',15000);
insert into autos values('ACG234','Renault 11','1990',40000);
insert into autos values('BCD333','Peugeot 505','1990',80000);
Go
Select * from autos
Where modelo='1990';
Go

--18 - Tipo de dato (numérico)
 if object_id('cuentas') is not null
  drop table cuentas;
Go
 Create table cuentas(
  numero int not null,
  documento char(8),
  nombre varchar(30),
  saldo money,
  primary key (numero)
 );
 Go
insert into cuentas(numero,documento,nombre,saldo) values('1234','25666777','Pedro Perez',500000.60);
insert into cuentas(numero,documento,nombre,saldo) values('2234','27888999','Juan Lopez',-250000);
insert into cuentas(numero,documento,nombre,saldo) values('3344','27888999','Juan Lopez',4000.50);
insert into cuentas(numero,documento,nombre,saldo) values('3346','32111222','Susana Molina',1000);
Go
select * from cuentas
where saldo<4000;
Go
select numero,saldo from cuentas
where nombre='Juan Lopez';
Go
select * from cuentas
where saldo<0;
Go
select * from cuentas
where numero>=3000;
Go

--19 - Tipo de dato (fecha y hora)
if object_id('alumnos') is not null
  drop table alumnos;

 create table alumnos(
  apellido varchar(30),
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  fechanacimiento datetime
 );

 set dateformat 'dmy';

 insert into alumnos values('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972');
 insert into alumnos values('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972');
 Go

 select * from alumnos where fechaingreso<'1-1-91';
 select * from alumnos where fechanacimiento is null;
 insert into alumnos values('Rosas','Romina','28888888','Avellaneda 487','03151990',null);
 set dateformat 'mdy';
 insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);
 select *from alumnos;
 Go
 
 --20 - Ingresar algunos campos (insert into)
 if object_id('cuentas') is not null
  drop table cuentas;

create table cuentas(
  numero int identity,
  documento char(8) not null,
  nombre varchar(30),
  saldo money
 );
Go
insert into cuentas values ('25666777','Juan Perez',2500.50);
insert into cuentas values (1,'25666777','Juan Perez',2500.50);
insert into cuentas (documento,saldo) values ('28999777',-5500);
Go
select *from cuentas ;
Go

--21 - Valores por defecto (default)

 if object_id('visitantes') is not null
  drop table visitantes;

 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );
 Go
 exec sp_columns visitantes;
 Go
 insert into visitantes (nombre, domicilio, montocompra) values ('Susana Molina','Colon 123',59.80);
 insert into visitantes (nombre, edad, ciudad, mail) values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');
 Go
 select *from visitantes;
 Go
 insert into visitantes values ('Marcelo Morales',38,default,default,default,'4255232','marcelomorales@hotmail.com',default);
 insert into visitantes default values;
 Go
 select * from visitantes;
 Go
 
 --22 - Columnas calculadas (operadores aritméticos y de concatenación)
 if object_id ('articulos') is not null
 drop table articulos;

 create table articulos(
  codigo int identity,
  nombre varchar(20),
  descripcion varchar(30),
  precio smallmoney,
  cantidad tinyint default 0,
  primary key (codigo)
 );
 Go
 insert into articulos (nombre, descripcion, precio,cantidad) values ('impresora','Epson Stylus C45',400.80,20);
 insert into articulos (nombre, descripcion, precio) values ('impresora','Epson Stylus C85',500);
 Go
 update articulos set precio=precio+(precio*0.15);
 select * from articulos;
 select nombre+','+descripcion from articulos;
 update articulos set cantidad=cantidad-5
 where nombre='teclado';

 select * from articulos;
 Go

 --23 - Alias
 if object_id ('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
 );
 Go
 insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25);
 insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros (titulo,autor,editorial,precio,cantidad) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);
 Go
 select titulo, autor,editorial,precio,cantidad,precio*cantidad as 'monto total' from libros;
 select titulo,autor,precio, precio*0.1 as descuento, precio-(precio*0.1) as 'precio final' from libros
 where editorial='Emece';
 Go
select titulo+'-'+autor as "Título y autor" from libros;
Go

--27 - Funciones para el uso de fechas y horas

if object_id ('empleados') is not null
  drop table empleados;

create table empleados(
  nombre varchar(30) not null,
  apellido varchar(20) not null,
  documento char(8),
  fechanacimiento datetime,
  fechaingreso datetime,
  sueldo decimal(6,2),
  primary key(documento)
 );
 Go
 insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
 insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
 insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
 Go
 select nombre+space(1)+upper(apellido) as nombre,
 stuff(documento,1,0,'DNI N') as documento,
 stuff(sueldo,1,0,'$') as sueldo from empleados;

 select documento, stuff(ceiling(sueldo),1,0,'$ ') from empleados;

 select nombre,apellido from empleados
  where datename(month,fechanacimiento)='october';

 select nombre, apellido from empleados
 where DATEPART(year, fechaingreso) = 2000;
  Go
  
 --28 - Ordenar registros (order by)
 if object_id('visitas') is not null
  drop table visitas;

create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fecha datetime,
  primary key(numero)
);

insert into visitas (nombre,mail,pais,fecha) values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
insert into visitas (nombre,mail,pais,fecha) values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');

Go
select *from visitas
order by fecha desc;
Go
select nombre, pais, DATENAME(MONTH, fecha) from visitas
order by pais, Datename(month, fecha) desc;
Go

select nombre, pais,
DATENAME(hour, fecha) hora ,
dateName(month, fecha) mes,
DateName(day, fecha) dia
from visitas order by 1,2,3;
go
select mail, pais
from visitas
where datename(month,fecha)='October'
order by 2;
Go

--29 - Operadores lógicos ( and - or - not)
if object_id('medicamentos') is not null
  drop table medicamentos;
Go
create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
 );
Go
 insert into medicamentos values('Sertal','Roche',5.2,100);
 insert into medicamentos values('Buscapina','Roche',4.10,200);
 insert into medicamentos values('Amoxidal 500','Bayer',15.60,100);
Go
select codigo,nombre
  from medicamentos
  where laboratorio='Roche' and
  precio<5;
Go
 select * from medicamentos
  where laboratorio='Roche' or
  precio<5;
Go
 select * from medicamentos
  where not laboratorio='Bayer' and
  cantidad=100;
Go
 select * from medicamentos
  where laboratorio='Bayer' and
  not cantidad=100;
Go
 delete from medicamentos
  where laboratorio='Bayer' and
  precio>10;
Go
 update medicamentos set cantidad=200
  where laboratorio='Roche' and
  precio>5;
Go
 delete from medicamentos
  where laboratorio='Bayer' or
  precio<3;
Go

--30 - Otros operadores relacionales (is null)
if object_id('peliculas') is not null
  drop table peliculas;
Go
create table peliculas(
  codigo int identity,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion tinyint,
  primary key (codigo)
 );
 Go
 insert into peliculas values('Mision imposible','Tom Cruise',120);
 insert into peliculas values('Harry Potter y la piedra filosofal','Daniel R.',null);
 insert into peliculas values('Harry Potter y la camara secreta','Daniel R.',190);
Go
select * from peliculas
  where actor is null;
Go
 update peliculas set duracion=0
  where duracion is null;
Go
 delete from peliculas
  where actor is null and
  duracion=0;
Go
select * from peliculas;
Go

--31 - Otros operadores relacionales (between)
if object_id('visitas') is not null
  drop table visitas;
Go
 create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fechayhora datetime,
  primary key(numero)
);
Go
 insert into visitas (nombre,mail,pais,fechayhora) values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fechayhora) values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fechayhora) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 Go
 select * from visitas
 where fechayhora between '2006-09-12' and '2006-10-11';
Go
 select * from visitas
  where numero between 2 and 5;
  Go

--32 - Otros operadores relacionales (in)
select nombre,precio from medicamentos
  where laboratorio in ('Bayer','Bago');
Go
 select * from medicamentos
  where cantidad between 1 and 5;
Go
 select * from medicamentos
  where cantidad in (1,2,3,4,5);
Go
--33 - Búsqueda de patrones (like - not like)

 if object_id('empleados') is not null
  drop table empleados;
Go
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
 );
 Go
 insert into empleados values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
 insert into empleados values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
 insert into empleados  values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
 insert into empleados  values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
 Go

 select * from empleados
  where nombre like '%Perez%';
Go
 select * from empleados
  where domicilio like 'Co%8%';
Go
 select * from empleados
  where documento like '%[02468]';
Go
 select * from empleados
  where documento like '[^13]%' and
  nombre like '%ez';
Go
 select nombre from empleados
  where nombre like '%[yj]%';
Go
 select nombre,seccion from empleados
  where seccion like '[SG]_______';
Go
 select nombre,seccion from empleados
  where seccion not like '[SG]%';
Go
 select nombre,sueldo from empleados
  where sueldo not like '%.00';
Go
 select * from empleados
 where fechaingreso like '%1990%';

 Go
 --34 - Contar registros (count)
  select count(*) from medicamentos;
Go
select count(laboratorio) from medicamentos;
Go
 select count(precio) as 'Con precio',
  count(cantidad) as 'Con cantidad'
  from medicamentos;
Go
 select count(precio)
  from medicamentos
  where laboratorio like 'B%';
Go
 
 --35 - Contar registros (count_big)
select count_big(*)
  from medicamentos;

 select count_big(distinct laboratorio)
   from medicamentos;

 select count_big(precio) as 'Con precio',
  count_big(cantidad) as 'Con cantidad'
  from medicamentos;

--36 - Funciones de agrupamiento (count - sum - min - max - avg)
if object_id('empleados') is not null
  drop table empleados;
Go
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  primary key(documento)
 );
 Go
 insert into empleados values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
 insert into empleados values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
 insert into empleados values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
 insert into empleados values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
 Go
 select count(*)
  from empleados;
Go
 select count(sueldo)
  from empleados
  where seccion='Secretaria';
Go
select max(sueldo) as 'Mayor sueldo' from empleados
where seccion = 'Secretaria';
Go
 select max(cantidadhijos)
  from empleados
  where nombre like '%Perez%';
Go
 select avg(sueldo)
  from empleados;
Go
 select avg(sueldo)
  from empleados
  where seccion='Secretaria';
Go
 select avg(cantidadhijos)
  from empleados
  where seccion='Sistemas';
  Go

  --37 - Agrupar registros (group by)
 if object_id('visitantes') is not null
  drop table visitantes;
  Go
 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );
 Go
 insert into visitantes values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 Go

 select ciudad, count(*) from visitantes group by ciudad;
 Go
 select ciudad, count(telefono) from visitantes group by ciudad;
 Go
 select sexo, sum(montocompra) from visitantes group by sexo;
 Go
 select sexo,ciudad,
  max(montocompra) as mayor,
  min(montocompra) as menor
  from visitantes
  group by sexo,ciudad;

 select ciudad, avg(montocompra) as 'promedio de compras' from visitantes
  group by ciudad;

 select ciudad, count(*) as 'cantidad con mail' from visitantes
  where mail is not null and
  mail<>'no tiene'
  group by ciudad;

Go

--38 - Seleccionar grupos (having)
 if object_id('clientes') is not null
  drop table clientes;
Go
 create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  telefono varchar(11),
  primary key(codigo)
);
Go
 insert into clientes values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
 Go
 select ciudad, provincia,
  count(*) as cantidad
  from clientes
  group by ciudad,provincia;
Go
 select ciudad, provincia,
  count(*) as cantidad
  from clientes
  group by ciudad,provincia
  having count(*)>1;
Go
 select ciudad, count(*) from clientes
  where domicilio like '%San Martin%' 
  group by all ciudad
  having count(*)<2 and
  ciudad <> 'Cordoba';
Go

 --39.Registros duplicados (distinct)
select distinct provincia from clientes;
Go
 select count(distinct provincia) as cantidad from clientes;
Go
 select distinct ciudad from clientes; 
 Go
 select count(distinct ciudad) from clientes;
Go
 select distinct ciudad from clientes
  where provincia='Cordoba';
GO
 select provincia,count(distinct ciudad) from clientes
 group by provincia;
 Go

 --40. Cláusula top
if object_id('empleados') is not null
  drop table empleados;

 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  estadocivil char(1),
  seccion varchar(20)
 );
 Go
 insert into empleados values ('22222222','Alberto Lopez','c','Sistemas');
 insert into empleados values ('23333333','Beatriz Garcia','c','Administracion');
 insert into empleados values ('24444444','Carlos Fuentes','s','Administracion');
 Go
 select top 2 * from empleados;
 Go
 select top 4 nombre,seccion from empleados
 order by seccion;
 Go
 select top 4 with ties nombre,seccion from empleados
 order by seccion;
 Go
 select top 4 nombre,estadocivil,seccion from empleados
 order by estadocivil,seccion;
 Go
 select top 4 with ties nombre,estadocivil,seccion from empleados
 order by estadocivil,seccion;
 Go

 --40. Eliminar restricciones (alter table - drop)
  if object_id('vehiculos') is not null
  drop table vehiculos;
Go
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );
Go
 alter table vehiculos
 add constraint CK_vehiculos_tipo
 check (tipo in ('a','m'));
 Go
 alter table vehiculos
  add constraint DF_vehiculos_tipo
  default 'a'
  for tipo;
Go
 alter table vehiculos
  add constraint CK_vehiculos_patente_patron
  check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');
Go
 alter table vehiculos
  add constraint PK_vehiculos_patentellegada
  primary key(patente,horallegada);
Go
 insert into vehiculos values('SDR456','a','2005/10/10 10:10',null);
 insert into vehiculos values('SDR456','m','2005/10/10 10:10',null);
 insert into vehiculos values('SDR456','m','2005/10/10 12:10',null);
Go
 exec sp_helpconstraint vehiculos;
Go
 alter table vehiculos
  drop DF_vehiculos_tipo;
Go
 exec sp_helpconstraint vehiculos;
 Go
 alter table vehiculos
 drop PK_vehiculos_patentellegada, CK_vehiculos_tipo;
 Go
 exec sp_helpconstraint vehiculos;
 Go

 --41. Trabajar con varias tablas
 Go
 --42. Combinación interna (inner join)
 if (object_id('clientes')) is not null
   drop table clientes;
Go
  if (object_id('provincias')) is not null
   drop table provincias;
Go
 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );
 Go
 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );
 Go
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');
 Go
 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 Go
  select c.nombre,domicilio,ciudad,p.nombre
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo;
Go
 select c.nombre,domicilio,ciudad,p.nombre
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo
  order by p.nombre;
Go
 select c.nombre,domicilio,ciudad
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo
  where p.nombre='Santa Fe';
Go

--43. Combinación externa izquierda (left join)
if (object_id('clientes')) is not null
   drop table clientes;
Go
  if (object_id('provincias')) is not null
   drop table provincias;
Go
 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );
 Go
 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 Go
select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo;
Go
 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  left join clientes as c
  on codigoprovincia = p.codigo;
Go
 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.codigo is not null;
Go
 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.codigo is null
  order by c.nombre;
Go
 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.nombre='Cordoba';
Go

--44.Combinación externa derecha (right join)
 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo;
Go
 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo;
Go
 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo
  where p.codigo is not null;
Go
 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo
  where p.codigo is null
  order by ciudad;

--45.Combinación externa completa (full join)
if (object_id('deportes')) is not null
drop table deportes;
Go
 if (object_id('inscriptos')) is not null
drop table inscriptos;
Go
 create table deportes(
  codigo tinyint identity,
  nombre varchar(30),
  profesor varchar(30),
  primary key (codigo)
 );
 create table inscriptos(
  documento char(8),
  codigodeporte tinyint not null,
  matricula char(1) --'s'=paga 'n'=impaga
 );
Go
 insert into deportes values('tenis','Marcelo Roca');
 insert into deportes values('natacion','Marta Torres');
 insert into deportes values('basquet','Luis Garcia');
Go 
 insert into inscriptos values('22222222',3,'s');
 insert into inscriptos values('23333333',3,'s');
 insert into inscriptos values('24444444',3,'n');
 
Go
 select documento,d.nombre,matricula
  from inscriptos as i
  join deportes as d
  on codigodeporte=codigo;
Go
 select documento,d.nombre,matricula
  from inscriptos as i
  left join deportes as d
  on codigodeporte=codigo;
Go
 select documento,d.nombre,matricula
  from deportes as d
  right join inscriptos as i
  on codigodeporte=codigo;
Go
 select nombre
  from deportes as d
  left join inscriptos as i
  on codigodeporte=codigo
  where codigodeporte is null;
Go
 select documento
  from inscriptos as i
  left join deportes as d
  on codigodeporte=codigo
  where codigo is null;
Go
 select documento,nombre,profesor,matricula
  from inscriptos as i
  full join deportes as d
  on codigodeporte=codigo; 
Go

--46. Combinaciones cruzadas (cross join)
 if object_id('mujeres') is not null
  drop table mujeres;
GO
 if object_id('varones') is not null
  drop table varones;
Go
 create table mujeres(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );
Go
 create table varones(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );
GO
 insert into mujeres values('Maria Lopez','Colon 123',45);
 insert into mujeres values('Liliana Garcia','Sucre 456',35);
 insert into mujeres values('Susana Lopez','Avellaneda 98',41);
 Go
 insert into varones values('Juan Torres','Sarmiento 755',44);
 insert into varones values('Marcelo Oliva','San Martin 874',56);
 insert into varones values('Federico Pereyra','Colon 234',38);
 insert into varones values('Juan Garcia','Peru 333',50);
Go
 select m.nombre,m.edad,v.nombre,v.edad
  from mujeres as m
  cross join varones as v;
Go
 select m.nombre,m.edad,v.nombre,v.edad
  from mujeres as m
  cross join varones as v
  where m.edad>40 and
  v.edad>40;
Go
 select m.nombre,m.edad,v.nombre,v.edad
  from mujeres as m
  cross join varones as v
  where m.edad-v.edad between -10 and 10;
  Go

  --47. Combinación de más de dos tablas
 if object_id('socios') is not null
  drop table socios;
Go
 if object_id('deportes') is not null
  drop table deportes;
Go
 if object_id('inscriptos') is not null
  drop table inscriptos;
Go
 create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );
Go
 create table deportes(
  codigo tinyint identity,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 );
Go
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte tinyint not null,
  anio char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,anio)
 );
 Go

 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');

 insert into deportes values('basquet','Juan Juarez');
 insert into deportes values('futbol','Pedro Perez');
 insert into deportes values('natacion','Marina Morales');

 insert into inscriptos values ('22222222',3,'2006','s');
 insert into inscriptos values ('23333333',3,'2006','s');
 insert into inscriptos values ('24444444',3,'2006','n');

Go
 select s.nombre,d.nombre,anio
  from deportes as d
  right join inscriptos as i
  on codigodeporte=d.codigo
  left join socios as s
  on i.documento=s.documento;
Go
 select s.nombre,d.nombre,anio,matricula
  from deportes as d
  full join inscriptos as i
  on codigodeporte=d.codigo
  full join socios as s
  on s.documento=i.documento;
 Go
 select s.nombre,d.nombre,anio,matricula
  from deportes as d
  join inscriptos as i
  on codigodeporte=d.codigo
  join socios as s
  on s.documento=i.documento
  where s.documento='22222222';

  --48. Combinaciones con update y delete

  --49. Clave Foranea

  --50. Union
  if object_id('clientes') is not null
  drop table clientes;
Go
 if object_id('proveedores') is not null
  drop table proveedores;
Go
 if object_id('empleados') is not null
  drop table empleados;
Go
 create table proveedores(
  codigo int identity,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
 );
 Go
 create table clientes(
  codigo int identity,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
 );
Go
 create table empleados(
  documento char(8) not null,
  nombre varchar(20),
  apellido varchar(20),
  domicilio varchar(30),
  primary key(documento)
 );
 Go
 insert into proveedores values('Bebida cola','Colon 123');
 insert into proveedores values('Carnes Unica','Caseros 222');
 insert into proveedores values('Lacteos Blanca','San Martin 987');
 insert into clientes values('Supermercado Lopez','Avellaneda 34');
 insert into clientes values('Almacen Anita','Colon 987');
 insert into clientes values('Garcia Juan','Sucre 345');
 insert into empleados values('23333333','Federico','Lopez','Colon 987');
 insert into empleados values('28888888','Ana','Marquez','Sucre 333');
 insert into empleados values('30111111','Luis','Perez','Caseros 956');
Go
 select nombre, domicilio from proveedores
  union
  select nombre, domicilio from clientes
   union
   select (apellido+' '+nombre), domicilio from empleados;
Go
 select nombre, domicilio, 'proveedor' as categoria from proveedores
  union
  select nombre, domicilio, 'cliente' from clientes
   union
   select (apellido+' '+nombre), domicilio , 'empleado' from empleados
  order by categoria;

  -- 51. Agregar y eliminar campos ( alter table - add - drop)
  if OBJECT_ID ('empleados') is not null
  drop table empleados
  Go
 create table empleados(
	apellido varchar(20),
	nombre varchar(20),
	domicilio varchar(20),
	FechaIngreso date
);
Go
insert into empleados(apellido,nombre) values('Cordero', 'Ramon');
Go
alter table empleados
add sueldo decimal(5,2);
Go
select *from empleados
Go

alter table empleados
add codigo int identity;
Go

alter table empleados
add documento varchar(20) not null;
Go

alter table empleados
add documento varchar(20) not null default '00000';
Go

select *from empleados
Go

alter table empleados
drop column sueldo;
Go

exec sp_columns empleados;
Go

alter table empleados
drop column documento;
go

alter table empleados
drop column codigo,FechaIngreso;
Go

exec sp_columns empleados;
go

--52. Alterar campos (alter table - alter)
if OBJECT_ID('empleados') is not null
drop table empleados
go
create table empleados(
  legajo int not null,
  documento char(7) not null,
  nombre varchar(10),
  domicilio varchar(30),
  ciudad varchar(20) default 'Santo Domingo',
  sueldo decimal(6,2),
  cantidadhijos tinyint default 0,
  primary key(legajo)
);
Go
alter table empleados
alter column nombre varchar(30);
Go

exec sp_columns empleados;
Go

alter table empleados
alter column sueldo decimal(6,2) not null;
Go

alter table empleados
alter column documento varchar(8);
Go

alter table empleados
alter column legajo tinyint not null;
Go

insert into empleados values(1,'22222222','Juan Cordero','Cristo Rey','Cordoba',500,3);
insert into empleados values(2,'30000000',null,'Sucre 456','Cordoba',600,2);
Go

alter table empleados
alter column nombre varchar(30) not null;
Go

delete from empleados where nombre is null;
go

alter table empleados
alter column ciudad varchar(10);
Go

insert into empleados values(3,'33333333','Juan Cordero','Sarmiento 856',default,500,4);
Go

alter table empleados
alter column ciudad varchar(15);
Go

insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);
Go

--53. Campos calculados
if object_id('articulos') is not null
  drop table articulos;
Go
create table articulos(
  codigo int identity,
  descripcion varchar(30),
  precio decimal(5,2) not null,
  cantidad smallint not null default 0,
  montototal as precio *cantidad
);
Go
insert into articulos values('Jabones', 30, 2);
insert into articulos values('Toallas', 50, 4);
Go
select *from articulos;
Go

update articulos set precio = 30 where descripcion = 'Toallas';
select *from articulos;
Go

update articulos set cantidad = 6 where descripcion = 'Jabones';
select *from articulos;
Go

update articulos set montototal = 50 where descripcion = 'Jabones';
Go

--54. SubConsultas
if object_id('empleados') is not null
  drop table empleados;
go
 create table empleados(
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  fechaingreso datetime
 );
 insert into empleados(apellido,nombre) values ('Rodriguez','Pablo');
 go
 alter table empleados
  add sueldo decimal(5,2);
go
 exec sp_columns empleados;
go
 alter table empleados
  add codigo int identity;
go
 alter table empleados
  add documento char(8) not null;
Go

--55.Subconsultas como expresión
if object_id('alumnos') is not null
 drop table alumnos;
Go
 create table alumnos(
  documento char(8),
  nombre varchar(30),
  nota decimal(4,2),
  primary key(documento),
  constraint CK_alumnos_nota_valores check (nota>=0 and nota <=10),
 );
Go
 insert into alumnos values('30111111','Ana Algarbe',5.1);
 insert into alumnos values('30222222','Bernardo Bustamante',3.2);
 insert into alumnos values('40225588', 'Pedro Camilo', 4.5);
 Go

 select nota from alumnos
 where nota = (select max(nota) from alumnos);
 Go

 select nombre, nota from alumnos
 where nota =(select max(nota) from alumnos)
 Go

select alumnos.*,
 (select avg(nota) from alumnos)-nota as diferencia
  from alumnos
  where nota< (select avg(nota) from alumnos);
Go
update alumnos set nota = 4
where nota = (select MIN(nota) from alumnos)
Go

delete from alumnos
where nota < (select AVG(nota) from alumnos)
Go

--56. Subconsultas con in
  if (object_id('ciudades')) is not null
   drop table ciudades;
  if (object_id('clientes')) is not null
   drop table clientes;
Go
 create table ciudades(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );
Go
 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  codigociudad tinyint not null,
  primary key(codigo), constraint FK_clientes_ciudad
  foreign key (codigociudad)
  references ciudades(codigo)
  on update cascade,
 );

 Go

insert into ciudades (nombre) values('Cordoba');
insert into ciudades (nombre) values('Cruz del Eje');
insert into ciudades (nombre) values('Carlos Paz');
Go
insert into clientes values ('Lopez Marcos','Colon 111',1);
insert into clientes values ('Lopez Hector','San Martin 222',1);
insert into clientes values ('Perez Ana','San Martin 333',2);
Go

select nombre from ciudades
where codigo in (select codigociudad from clientes where domicilio like '%San Martin%');
Go
 select distinct ci.nombre from ciudades as ci
 join clientes as cl on codigociudad=ci.codigo where domicilio like 'San Martin%';
 Go

select nombre from ciudades
where codigo not in (select codigociudad from clientes where domicilio like 'G%');
Go

 select codigociudad from clientes
 where nombre like 'G%';
 Go

 --57. Subconsultas any - some - all
if object_id('inscriptos') is not null
drop table inscriptos;
if object_id('socios') is not null
drop table socios;

Go
create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
Go
create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas tinyint
  constraint CK_inscriptos_cuotas
  check (cuotas>=0 and cuotas<=10)
  constraint DF_inscriptos_cuotas default 0,
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
  foreign key (numerosocio)
  references socios(numero)
  on update cascade
  on delete cascade,
);
Go

insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
Go
insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
Go

select numero,nombre,deporte from socios as s join inscriptos as i on numerosocio=numero;
Go

select nombre from socios join inscriptos as i on numero=numerosocio
where deporte='natacion' and  numero= any (select numerosocio  from inscriptos as i  where deporte='tenis');
Go

select deporte from inscriptos 
as i  where numerosocio=1 and deporte= any (select deporte from inscriptos as i where numerosocio=2);
Go

select i1.deporte from inscriptos as i1
join inscriptos as i2
on i1.deporte=i2.deporte
where i1.numerosocio=1 and
i2.numerosocio=2;
Go

select deporte from inscriptos as i
where numerosocio=2 and cuotas>any (select cuotas from inscriptos where numerosocio=1);
Go

select deporte from inscriptos as i
where numerosocio=2 and cuotas>all (select cuotas from inscriptos where numerosocio=1);
Go

delete from inscriptos 
where numerosocio=any (select numerosocio from inscriptos where cuotas=0);
Go

--58. Subconsultas correlacionadas
select nombre, domicilio, (select COUNT(*) from inscriptos as i where s.numero = i.numerosocio)
from socios as s;
Go

select nombre, (select (count(*)*10) from inscriptos as i
where s.numero=i.numerosocio) as total, (select sum(i.cuotas) from inscriptos as i
where s.numero=i.numerosocio) as pagas from socios as s;
Go

select nombre, count(i.deporte)*10 as total, sum(i.cuotas) as pagas from socios as s join inscriptos as i
on numero=numerosocio group by nombre;
Go

--59. Exists y No Exists
select nombre from socios as s
where exists(select *from inscriptos as i
where s.numero = i.numerosocio and i.deporte = 'natacion');
Go

select nombre from socios as s
where not exists(select *from inscriptos as i
where s.numero = i.numerosocio and i.deporte = 'natacion');
Go

select s.* from socios as s
where exists (select *from inscriptos as i
where s.numero=i.numerosocio and i.cuotas=10);
Go

--60.  Subconsulta en lugar de una tabla
 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;
 if object_id('deportes') is not null
  drop table deportes;
Go

create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
);
Go

create table deportes(
  codigo tinyint identity,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
);
Go
create table inscriptos(
  documento char(8) not null, 
  codigodeporte tinyint not null,
  año char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,año),
  constraint FK_inscriptos_socio
   foreign key (documento)
   references socios(documento)
   on update cascade
   on delete cascade
);
Go
insert into socios values('22222222','Ana Acosta','Avellaneda 111');
insert into socios values('23333333','Betina Bustos','Bulnes 222');
 Go
insert into deportes values('basquet','Juan Juarez');
insert into deportes values('futbol','Pedro Perez');
Go
insert into inscriptos values ('22222222',3,'2006','s');
insert into inscriptos values ('23333333',3,'2006','s');
Go

select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor from deportes as d 
join inscriptos as i
 on d.codigo=i.codigodeporte;
Go

select s.nombre,td.deporte,td.profesor,td.año,td.matricula from socios as s
join (select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor from deportes as d
join inscriptos as i on d.codigo=i.codigodeporte) as td on td.documento=s.documento;
Go

-- 61. Subconsulta (update - delete)
if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;
Go
create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
Go
create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  matricula char(1),-- 'n' o 's'
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
  foreign key (numerosocio)
  references socios(numero)
);
Go
insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');

insert into inscriptos values(1,'tenis','s');
insert into inscriptos values(2,'basquet','s');
insert into inscriptos values(3,'natacion','s');
Go

update inscriptos set matricula='s' where numerosocio= (select numero from socios
where documento='25555555');
Go

delete from inscriptos where numerosocio in (select numero from socios as s join inscriptos
on numerosocio=numero
where matricula='n');
GO

--62.  Subconsulta (insert)
if object_id('facturas') is not null
  drop table facturas;
 if object_id('clientes') is not null
  drop table clientes;
Go
 create table clientes(
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  primary key(codigo)
);
Go
 create table facturas(
  numero int not null,
  fecha datetime,
  codigocliente int not null,
  total decimal(6,2),
  primary key(numero),
  constraint FK_facturas_cliente
   foreign key (codigocliente)
   references clientes(codigo)
   on update cascade
);
Go

insert into clientes values('Juan Lopez','Colon 123');
insert into clientes values('Luis Torres','Sucre 987');

insert into facturas values(1200,'2007-01-15',1,300);
insert into facturas values(1201,'2007-01-15',2,550);
insert into facturas values(1202,'2007-01-15',3,150);
Go

--63.Crear tabla a partir de otra (select - into) 
if object_id ('clientespref') is not null
drop table clientespref;
create table clientespref(
  nombre varchar(30),
  domicilio varchar(30)
);
Go
insert into clientespref select nombre,domicilio from clientes 
where codigo in (select codigocliente from clientes as c
join facturas as f on codigocliente=codigo
group by codigocliente having sum(total)>500);
Go
select * from clientespref;
Go

--64. Go
/*Es un signo de finalización de lote de sentencia*/
Go

--65. Vista información
/*para obtener informacion de los objetos se pueden utilizar sp_help, sp_helptext, sp_depends*/
Go

--66. Lenguaje de Control de flujo case
if object_id('empleados') is not null
  drop table empleados;
Go
 create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  sexo char(1),
  fechanacimiento datetime,
  fechaingreso datetime,
  cantidadhijos tinyint,
  sueldo decimal(5,2),
  primary key(documento)
);
Go

insert into empleados values ('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550);
insert into empleados values ('25444444','Susana Morales','f','1975-11-06','1990-04-06',0,650);
insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510);
insert into empleados values ('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700); 
GO

select sexo, count(*) as cantidad, obsequio= case  when sexo='f' then 'rosas'
else 'corbata' end from empleados
where datepart(month,fechanacimiento)=5 group by sexo;
Go

--67. Lenguaje de control de flujo (if)
--Use la misma tabla del 66 ya que posee los mismos campos
if exists(select * from empleados
where datepart(month,fechanacimiento)=5)--si hay empleados que cumplan en mayo
(select sexo,count(*) as cantidad  from empleados
where datepart(month,fechanacimiento)=5
group by sexo)
else select 'no hay empleados que cumplan en mayo';
Go

--68. Procedimientos almacenados
/*Un procedimiento almacenado es un conjunto de instrucciones a las que se les da un nombre,
 que se almacena en el servidor. Permiten encapsular tareas repetitivas.*/
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  sexo char(1),
  fechanacimiento datetime,
  fechaingreso datetime,
  cantidadhijos tinyint,
  sueldo decimal(5,2),
  primary key(documento)
);

 insert into empleados values ('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550);
 insert into empleados values ('25444444','Susana Morales','f','1975-11-06','1990-04-06',0,650);
 insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510);
 insert into empleados values ('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700);
 insert into empleados values ('20555444','Laura Torres','f','1965-12-22','2003-11-06',3,400);
 insert into empleados values ('30000234','Alberto Soto','m','1989-10-10','1999-11-06',2,420);
 insert into empleados values ('20125478','Ana Gomez','f','1976-09-21','1998-11-06',3,350);
 insert into empleados values ('24154269','Ofelia Garcia','f','1974-05-12','1990-11-06',0,390);
 insert into empleados values ('30415426','Oscar Torres','m','1978-05-02','1997-11-06',1,400);

 select sexo, count(*) as cantidad, obsequio=
  case 
   when sexo='f' then 'rosas'
   else 'corbata'
  end
  from empleados
  where datepart(month,fechanacimiento)=5
  group by sexo;

 select nombre,datepart(year,fechaingreso) as añoingreso,
  datepart(year,getdate())-datepart(year,fechaingreso) as AñosdeServicio, placa=
   case (datepart(year,getdate())-datepart(year,fechaingreso)) %10
     when 0 then 'Si'  --si la cantidad de años es divisible por 10
     else 'No'
   end
  from empleados
  where datepart(month,fechaingreso)=4;

 select nombre,sueldo,cantidadhijos,porhijo=
  case 
   when sueldo<=500 then 200
   else 100
  end,
 salariofamilar=
  case
   when sueldo<=500 then 200*cantidadhijos
   else 100*cantidadhijos
  end,
 sueldototal=
  case
   when sueldo<=500 then sueldo+(200*cantidadhijos)
   else sueldo+(100*cantidadhijos)
  end
  from empleados
  order by sueldototal;
 Go
 --69. Procedimientos almacenados (crear - ejecutar)
  if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  sexo char(1),
  fechanacimiento datetime,
  fechaingreso datetime,
  cantidadhijos tinyint,
  sueldo decimal(5,2),
  primary key(documento)
);

 insert into empleados values ('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550);
 insert into empleados values ('25444444','Susana Morales','f','1975-11-06','1990-04-06',0,650);
 insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510);
 insert into empleados values ('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700);
 insert into empleados values ('20555444','Laura Torres','f','1965-12-22','2003-11-06',3,400);
 insert into empleados values ('30000234','Alberto Soto','m','1989-10-10','1999-11-06',2,420);
 insert into empleados values ('20125478','Ana Gomez','f','1976-09-21','1998-11-06',3,350);
 insert into empleados values ('24154269','Ofelia Garcia','f','1974-05-12','1990-11-06',0,390);
 insert into empleados values ('30415426','Oscar Torres','m','1978-05-02','1997-11-06',1,400);

 select sexo, count(*) as cantidad, obsequio=
  case 
   when sexo='f' then 'rosas'
   else 'corbata'
  end
  from empleados
  where datepart(month,fechanacimiento)=5
  group by sexo;

 select nombre,datepart(year,fechaingreso) as añoingreso,
  datepart(year,getdate())-datepart(year,fechaingreso) as AñosdeServicio, placa=
   case (datepart(year,getdate())-datepart(year,fechaingreso)) %10
     when 0 then 'Si'  --si la cantidad de años es divisible por 10
     else 'No'
   end
  from empleados
  where datepart(month,fechaingreso)=4;

 select nombre,sueldo,cantidadhijos,porhijo=
  case 
   when sueldo<=500 then 200
   else 100
  end,
 salariofamilar=
  case
   when sueldo<=500 then 200*cantidadhijos
   else 100*cantidadhijos
  end,
 sueldototal=
  case
   when sueldo<=500 then sueldo+(200*cantidadhijos)
   else sueldo+(100*cantidadhijos)
  end
  from empleados
  order by sueldototal;
 Go
--70. Tablas temporales
/*Para crear tablas temporales locales se emplea la misma sintaxis 
que para crear cualquier tabla, excepto que se coloca un signo numeral (#) precediendo el nombre.
create table #NOMBRE()*/
create table #usuarios(
  nombre varchar(30),
  clave varchar(10)
  primary key(nombre)
);

insert into #usuarios (nombre, clave) values ('Mariano','payaso');
insert into #usuarios (clave, nombre) values ('River','Juan')
insert into #usuarios (nombre,clave) values ('Boca','Luis');

select * from #usuarios;

GO

--72. Funciones
/*Las funciones en sql server se pueden clasificar en deterministicas, no deterministicas.*/
 if object_id('dbo.f_fechacadena') is not null
  drop function dbo.f_fechacadena; 
Go

--73. Funciones escalares (crear y llamar)
 if object_id('consultas') is not null
  drop table consultas;
 if object_id('medicos') is not null
  drop table medicos;

 create table medicos (
  documento char(8) not null,
  nombre varchar(30),
  constraint PK_medicos 
   primary key clustered (documento)
 );
 go
 create table consultas(
  fecha datetime,
  medico char(8) not null,
  paciente varchar(30),
  constraint PK_consultas
   primary key (fecha,medico),
  constraint FK_consultas_medico
   foreign key (medico)
   references medicos(documento)
   on update cascade
   on delete cascade
 );
 go
 insert into medicos values('22222222','Alfredo Acosta');
 insert into medicos values('23333333','Pedro Perez');
 insert into medicos values('24444444','Marcela Morales');

 insert into consultas values('2007/03/26 8:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/26 8:00','23333333','Gaston Gomez');
 insert into consultas values('2007/03/26 8:30','22222222','Nora Norte');
 insert into consultas values('2007/03/28 9:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/29 8:00','24444444','Nora Norte');
 insert into consultas values('2007/03/24 8:30','22222222','Hector Huerta'); 
 insert into consultas values('2007/03/24 9:30','23333333','Hector Huerta');
 go
 if object_id('f_nombreDia') is not null
  drop function f_nombreDia;

 create function f_nombreDia
 (@fecha varchar(30))
  returns varchar(10)
  as
  begin
    declare @nombre varchar(10)
    set @nombre='Fecha inválida'   
    if (isdate(@fecha)=1)
    begin
      set @fecha=cast(@fecha as datetime)
      set @nombre=
      case datename(weekday,@fecha)
       when 'Monday' then 'lunes'
       when 'Tuesday' then 'martes'
       when 'Wednesday' then 'miércoles'
       when 'Thursday' then 'jueves'
       when 'Friday' then 'viernes'
       when 'Saturday' then 'sábado'
       when 'Sunday' then 'domingo'
      end--case
    end--si es una fecha válida
    return @nombre
 end;
 Go
--74. Funciones de tabla de varias instrucciones
if object_id('empleados') is not null
  drop table empleados;
go
 create table empleados(
  documento char(8) not null,
  apellido varchar(30) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(30),
  fechanacimiento datetime,
  constraint PK_empleados
   primary key(documento)
 );
 go
 insert into empleados values('22222222','Acosta','Ana','Avellaneda 123','Cordoba','1970/10/10');
 insert into empleados values('23333333','Bustos','Bernardo','Bulnes 234','Cordoba','1972/05/15');
 insert into empleados values('24444444','Caseros','Carlos','Colon 356','Carlos Paz','1980/02/25');
 insert into empleados values('25555555','Fuentes','Fabiola','Fragueiro 987','Jesus Maria','1984/06/12');
go
 if object_id('f_empleados') is not null
  drop function f_empleados;

 create function f_empleados
 (@opcion varchar(10)
 )
 returns @listado table
 (documento char(8),
 nombre varchar(60),
 domicilio varchar(60),
 nacimiento varchar(12))
 as 
 begin
  if @opcion not in ('total','parcial')
    set @opcion='parcial'
  if @opcion='total'
   insert @listado 
    select documento,
    (apellido+' '+nombre),
    (domicilio+' ('+ciudad+')'), 
    cast(fechanacimiento as varchar(12))
     from empleados
  else
   insert @listado
   select documento,apellido,ciudad,cast(datepart(year,fechanacimiento) as char(4))
   from empleados
  return
end;
Go

--75. Funciones con valores de tabla en línea
/*Una función con valores de tabla en línea retorna una tabla
 que es el resultado de una única instrucción "select"*/
  if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8) not null,
  apellido varchar(30) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(30),
  fechanacimiento datetime,
  constraint PK_empleados
   primary key(documento)
 );

 insert into empleados values('22222222','Acosta','Ana','Avellaneda 123','Cordoba','1970/10/10');
 insert into empleados values('23333333','Bustos','Bernardo','Bulnes 234','Cordoba','1972/05/15');
 insert into empleados values('24444444','Caseros','Carlos','Colon 356','Carlos Paz','1980/02/25');
 insert into empleados values('25555555','Fuentes','Fabiola','Fragueiro 987','Jesus Maria','1984/06/12');

 if object_id('f_empleados') is not null
  drop function f_empleados;

 create function f_empleados
 (@opcion varchar(10)
 )
 returns @listado table
 (documento char(8),
 nombre varchar(60),
 domicilio varchar(60),
 nacimiento varchar(12))
 as 
 begin
  if @opcion not in ('total','parcial')
    set @opcion='parcial'
  if @opcion='total'
   insert @listado 
    select documento,
    (apellido+' '+nombre),
    (domicilio+' ('+ciudad+')'), 
    cast(fechanacimiento as varchar(12))
     from empleados
  else
   insert @listado
   select documento,apellido,ciudad,cast(datepart(year,fechanacimiento) as char(4))
   from empleados
  return
end;

