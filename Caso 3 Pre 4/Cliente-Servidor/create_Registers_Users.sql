
-- Usuarios Registrados que pueden acceder a la base de datos 
create table RegisterUsers(
	id int primary key,
	usuario varchar(20),
	password varchar(20)

);

insert into RegisterUsers (id, usuario, password) values (1, 'default','12345678' )

