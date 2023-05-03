INSERT INTO idiomas (idiomaId, nombre, variacionCult) VALUES 
(1, 'Inglés', 'UK'),
(2, 'Inglés', 'US'),
(3, 'Español', 'ES'),
(4, 'Español', 'MX'),
(5, 'Francés', 'FR'),
(6, 'Francés', 'CA'),
(7, 'Portugués', 'PT');

insert into tipoActores (tipoActorId, descripcion) values
(1,'productor'),
(2,'recolector'),
(3,'gobierno local'),
(4,'gobierno general');

insert into paises(paisId,nombre) values
(1,'CRC'),
(2,'USA'),
(3,'ARG'),
(4,'BRA'),
(5,'CAN');

insert into idiomaXpaises (idiomaId, paisId) values
(4,1),
(2,2),
(4,3),
(7,4),
(2,5),
(6,5);

INSERT INTO actores (actorId, descripcion, tipoActorId) VALUES
(1, 'KFC', 1),
(2, 'McDonalds', 1),
(3, 'Sardimar', 1),
(4, 'Pollolandia', 1),
(5, 'Apple', 1),
(6, 'Walmart', 1),
(7, 'CLEAN', 2),
(8, 'WM', 2),
(9, 'EBI', 2),
(10, 'WasteTech', 2),
(11, 'RBA', 2),
(12, 'Ayuntamiento de Nueva York', 3),
(13, 'Ayuntamiento de São Paulo', 3),
(14, 'Municipalidad de San Jose', 3),
(15, 'Municipio de Azul', 3),
(16, 'Brampton Township', 3),
(17, 'Gobierno de Estados Unidos', 4),
(18, 'Gobierno de Brasil', 4),
(19, 'Gobierno de Argentina', 4),
(20, 'Gobierno de Costa Rica', 4),
(21, 'Gobierno de Canada', 4);

INSERT INTO contactType (contactTypeId, nombre)
VALUES
  (1, 'Teléfono'),
  (2, 'Correo electrónico'),
  (3, 'Fax'),
  (4, 'SMS'),
  (5, 'WhatsApp'),
  (6, 'Skype'),
  (7, 'Zoom'),
  (8, 'Telegram'),
  (9, 'LinkedIn');

INSERT INTO divisas (divisaId, nombre, abreviatura, simbolo)
VALUES 
(1, 'Dólar Canadiense', 'CAD', '$'),
(2, 'Colón Costarricense', 'CRC', '₡'),
(3, 'Real Brasileño', 'BRL', 'R$'),
(4, 'Peso Argentino', 'ARS', '$'),
(5, 'Euro', 'EUR', '€'),
(6, 'Yen Japonés', 'JPY', '¥'),
(7, 'Libra Esterlina', 'GBP', '£'),
(8, 'Dólar Australiano', 'AUD', '$'),
(9, 'Peso Mexicano', 'MXN', '$'),
(10,'Dólar Estadounidense','USA','$');

INSERT INTO divisasXpais (divisaId, paisId)
VALUES (1, 5), 
       (2, 1), 
       (3, 4), 
       (4, 3), 
       (10, 2);

insert into productos (productoid, tipo, nombre, unidadMedida, vendible, status) values
(1, 1, 'restos alimentos', 'kg', 0, 1),
(2, 1, 'hojas', 'kg', 0, 1),
(3, 1, 'carton', 'kg', 0, 1),
(4, 1, 'papel', 'kg', 0, 1),
(5, 1, 'periodico', 'kg', 0, 1),
(6, 1, 'botella', 'kg', 0, 1),
(7, 1, 'bolsa', 'kg', 0, 1),
(8, 1, 'botella', 'kg', 0, 1),
(9, 1, 'toallas', 'kg', 0, 1),
(10, 1, 'latas', 'kg', 0, 1),
(11, 1, 'papel envoltura', 'kg', 0, 1),
(12, 1, 'cajas', 'kg', 0, 1),
(13, 2, 'mesa', 'uni', 1, 1),
(14, 2, 'vaso', 'uni', 1, 1),
(15, 2, 'papel bond', 'uni', 1, 1);


insert into vehiculo (vehiculoId, capacidad,enabled) values
(1,1600,1),
(2,1600,1),
(3,1600,1),
(4,1600,1),
(5,1600,1),
(6,1600,1),
(7,1600,1),
(8,1600,1),
(9,1600,1),
(10,1600,1),
(11,1600,1),
(12,1600,1),
(13,1600,1),
(14,1600,1),
(15,1600,1),
(16,1600,1),
(17,1600,1),
(18,1600,1),
(19,1600,1),
(20,1600,1);

INSERT INTO estados (estadoId, nombre, paisId)
VALUES (1, 'San José', 1), 
       (2, 'Alajuela', 1), 
       (3, 'Cartago', 1),
       (4, 'Heredia', 1),
       (5, 'Limon', 1),
       (6, 'Puntarenas', 1),
       (7, 'California', 2), 
       (8, 'Texas', 2),
       (9, 'Florida', 2),
       (10, 'Nueva York', 2),
       (11, 'Buenos Aires', 3), 
       (12, 'Córdoba', 3),
       (13, 'Santa Fe', 3),
       (14, 'Mendoza', 3),
       (15, 'São Paulo', 4), 
       (16, 'Río de Janeiro', 4),
       (17, 'Minas Gerais', 4),
       (18, 'Bahía', 4),
       (19, 'Ontario', 5), 
       (20, 'Quebec', 5),
       (21, 'Alberta', 5),
       (22, 'British Columbia', 5);

INSERT INTO contactValues (contactValueId, contactTypeId, value, posttime, enabled)
VALUES (1, 1, '(+506) 2551 1158', GETDATE(), 1), 
       (2, 2, 'KFC@gmail.com', GETDATE(), 1),  
       (5, 5, '4031 5024', GETDATE(), 1), 
       (6, 6, 'walmart@gmail.com', GETDATE(), 1), 
       (7, 1, '(+506) 2201-6869', GETDATE(), 1), 
       (8, 2, '800–692–7753', GETDATE(), 1), 
       (9, 10, 'https://sardimar.com', GETDATE(), 1);
      
INSERT INTO contratosGenerales (contratoId, actorId, fechaInicial, fechaFinal)
VALUES 
  (1, 1, '2023-01-01', '2024-01-01'),
  (2, 2, '2023-01-01', '2024-01-01'),
  (3, 3, '2023-01-01', '2024-01-01'),
  (4, 4, '2023-01-01', '2024-01-01'),
  (5, 5, '2023-01-01', '2024-01-01'),
  (6, 6, '2023-01-01', '2024-01-01'),
  (7, 7, '2023-01-01', '2024-01-01'),
  (8, 8, '2023-01-01', '2024-01-01'),
  (9, 9, '2023-01-01', '2024-01-01'),
  (10, 10, '2023-01-01', '2024-01-01'),
  (11, 11, '2023-01-01', '2024-01-01'),
  (12, 12, '2023-01-01', '2024-01-01'),
  (13, 13, '2023-01-01', '2024-01-01'),
  (14, 14, '2023-01-01', '2024-01-01'),
  (15, 15, '2023-01-01', '2024-01-01'),
  (16, 16, '2023-01-01', '2024-01-01'),
  (17, 17, '2023-01-01', '2024-01-01'),
  (18, 18, '2023-01-01', '2024-01-01'),
  (19, 19, '2023-01-01', '2024-01-01'),
  (20, 20, '2023-01-01', '2024-01-01'),
  (21, 21, '2023-01-01', '2024-01-01');

insert into regiones (regionId, nombre, estadoId, paisId) values

(1,'Curridabat',1,1),
(2,'San Jose',1,1),
(3,'Grecia',2,1),
(4,'San Ramon',2,1),
(5,'Oreamuno',3,1),
(6,'Paraiso',3,1),
(7,'Barva',4,1),
(8,'San Rafael',4,1),
(9,'Pococi',5,1),
(10,'Siquirres',5,1),
(11,'Esparza',6,1),
(12,'Buenos Aires',6,1),
(13,'Los Angeles',7,2),
(14,'Sacramento',7,2),
(15,'Anderson',8,2),
(16,'Dalas',8,2),
(17,'Orlando',9,2),
(18,'Miami',9,2),
(19,'New York County',10,2),
(20,'Nassau County',10,2),
(21,'La Matanza',11,3),
(22,'Tigre',11,3),
(23,'Capital',12,3),
(24,'Punilla',12,3),
(25,'Rosario',13,3),
(26,'La Capital',13,3),
(27,'Capital',14,3),
(28,'Malargüe',14,3),
(29,'São Paulo',15,4),
(30,'Campinas',15,4),
(31,'Rio de Janeiro',16,4),
(32,'Niteroi',16,4),
(33,'Belo Horizonte',17,4),
(34,'Ouro Preto',17,4),
(35,'Salvador',18,4),
(36,'Porto Seguro',18,4),
(37,'Toronto',19,5),
(38,'Ottawa',19,5),
(39,'Montreal',20,5),
(40,'Quebec',20,5),
(41,'Calgary',21,5),
(42,'Edmonton',21,5),
(43,'Vancouver',22,5),
(44,'Victoria',22,5);

INSERT INTO calles (calleId, nombre, regionId, estadoId, paisId) VALUES
(1, '34', 1, 1, 1),
(2, '75', 2, 1, 1),
(3, '122', 3, 2, 1),
(4, '89', 4, 2, 1),
(5, '1', 5, 3, 1),
(6, '129', 6, 3, 1),
(7, '55', 7, 4, 1),
(8, '103', 8, 4, 1),
(9, '23', 9, 5, 1),
(10, '99', 10, 5, 1),
(11, '44', 11, 6, 1),
(12, '118', 12, 6, 1),
(13, '93', 13, 7, 2),
(14, '15', 14, 7, 2),
(15, '19', 15, 8, 2),
(16, '128', 16, 8, 2),
(17, '111', 17, 9, 2),
(18, '67', 18, 9, 2),
(19, '54', 19, 10, 2),
(20, '73', 20, 10, 3),
(21, '3', 21, 11, 3),
(22, '139', 22, 11, 3),
(23, '78', 23, 12, 3),
(24, '28', 24, 12, 3),
(25, '35', 25, 13, 3),
(26, '41', 26, 13, 3),
(27, '109', 27, 14, 3),
(28, '83', 28, 14, 3),
(29, '92', 29, 15, 4),
(30, '59', 30, 15, 4),
(31, '14', 31, 16, 4),
(32, '104', 32, 16, 4),
(33, '68', 33, 17, 4),
(34, '72', 34, 17, 4),
(35, '57', 35, 18, 4),
(36, '116', 36, 18, 4),
(37, '77', 37, 19, 5),
(38, '39', 38, 19, 5),
(39, '86', 39, 20, 5),
(40, '27', 40, 20, 5),
(41, '51', 41, 21, 5),
(42, '131', 42, 21, 5),
(43, '33', 43, 22, 5),
(44, '98', 44, 22, 5);

INSERT INTO direcciones (direccionId, calleId, regionId, estadoId, codigoPostal, paisId)
VALUES 
(1, 3, 6, 3, 30205 , 1),
(2, 18, 18, 9, 30124, 2),
(3, 27,27 , 14, 30214, 3),
(4, 29, 29, 15, 34124, 4),
(5, 37, 39, 20, 12541, 5),
(6, 2, 2, 1, 12432, 1),
(7,16 ,16, 8,12325, 2),
(8, 26, 26, 13, 30249, 3),
(9, 31, 31, 16, 30242, 4),
(10, 44, 44, 22, 30213, 5);

--Llenar direcciones

DROP PROCEDURE IF EXISTS spLlenarDirecciones;
CREATE PROCEDURE spLlenarDirecciones
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100)
  BEGIN
    DECLARE @direccionId int;
    DECLARE @calleId int;
    DECLARE @regionId int;
    DECLARE @estadoId int;
    DECLARE @codigoPostal int;
    DECLARE @paisId int;

    SET @direccionId =  @contador; 
    SET @calleId = CAST((RAND() * 44) + 1 AS int);
    SET @regionId = CAST((RAND() * 44) + 1 AS int); 
    SET @estadoId = CAST((RAND() * 22) + 1 AS int); 
    SET @codigoPostal = CAST((RAND() * 89999) + 10000 AS INT); 
    SET @paisId = CAST((RAND() * 5) + 1 AS int);

    INSERT INTO direcciones (direccionId, calleId, regionId, estadoId, codigoPostal, paisId)
    VALUES (@direccionId, @calleId, @regionId, @estadoId, @codigoPostal, @paisId);

    SET @contador = @contador + 1;
  END
 END

 --Llenar empresa

 DROP PROCEDURE IF EXISTS spLlenarEmpresas;
CREATE PROCEDURE spLlenarEmpresas
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100)
  BEGIN
    DECLARE @direccionId int;
	DECLARE @empresaId int;

    SET @direccionId =  CAST((RAND() * 100) + 1 AS int);; 
    SET @empresaId = @contador;

    INSERT INTO empresasEV (empresaId,direccionId)
    VALUES (@empresaId,@direccionId);

    SET @contador = @contador + 1;
  END
  end

  --Llenar locales

   DROP PROCEDURE IF EXISTS spLlenarLocales;
CREATE PROCEDURE spLlenarLocales
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100000)
  BEGIN
    DECLARE @direccionId int;
	DECLARE @actorId int;
	DECLARE @localId int;
	DECLARE @payId int;

    SET @direccionId =  CAST((RAND() * 100) + 1 AS int); 
	SET @actorId =  CAST((RAND() * 21) + 1 AS int);
	SET @payId =  CAST((RAND() * 2) + 1 AS int);
    SET @localId = @contador;

    INSERT INTO localesXproductor (localId,actorId,enabled,payId,direccionId)
    VALUES (@localId,@actorId,1,@payId,@direccionId);

    SET @contador = @contador + 1;
  END
 END

 DELETE FROM localesXproductor;
 delete from localesXproceso;
 delete from metricasXlocal;
 --Llenar coberturaXempresa

   DROP PROCEDURE IF EXISTS spLlenarCoberturaXempresa;
CREATE PROCEDURE spLlenarCoberturaXempresa
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100)
  BEGIN
    DECLARE @paisId int;
	DECLARE @empresaId int;
	DECLARE @posttime DATETIME;
	DECLARE @enabled int;

    SET @paisId =  CAST((RAND() * 5) + 1 AS int); 
	SET @empresaId =  CAST((RAND() * 100) + 1 AS int);
	SET @posttime =  GETDATE();
    SET @enabled = 1;

    INSERT INTO coberturaXempresas (paisId,empresaId,posttime,enabled)
    VALUES (@paisId,@empresaId,@posttime,@enabled);

    SET @contador = @contador + 1;
  END
 END

  --Llenar recipienteXlocal
  DELETE FROM recipienteXlocal;

  DROP PROCEDURE IF EXISTS spRecipienteXlocal;
CREATE PROCEDURE spRecipienteXlocal
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100000)
  BEGIN
    DECLARE @localId int;
	DECLARE @recipienteId int;
	DECLARE @posttime DATETIME;
	DECLARE @endtime DATETIME;

    SET @localId = @contador;
	SET @recipienteId =  @contador;
	SET @posttime =  GETDATE();
    SET @endtime = '01-01-2099 00:00:00';

    INSERT INTO recipienteXlocal (localId,recipienteId,fechaInicial,fechaFinal)
    VALUES (@localId,@recipienteId,@posttime,@endtime);

    SET @contador = @contador + 1;
  END
 END

 --Llenar Recipientes
  DROP PROCEDURE IF EXISTS spRecipientes;
CREATE PROCEDURE spRecipientes
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100000)
  BEGIN
    
	DECLARE @recipienteId int;
	DECLARE @productoId int;
	DECLARE @recipCapacidad int;
	DECLARE @recipPeso int;
	DECLARE @enable int;
	DECLARE @fechaCompra DATETIME;
	DECLARE @categoriaId int;
	DECLARE @actorId int;
	DECLARE @estado int;

	SET @recipienteId =  @contador;
    SET @productoId = CAST((RAND() * 15) + 1 AS int);
	SET @recipCapacidad = CAST((RAND() * 200) + 60 AS int);
	SET @recipPeso = CAST((RAND() * 8) + 5 AS int);
	SET @enable = 1;
	SET @fechaCompra = GETDATE();
	SET @categoriaId = CAST((RAND() * 26) + 1 AS int);
	SET @actorId = CAST((RAND() * 11) + 1 AS int);;
	SET @estado = 1;


    INSERT INTO recipientes (recipienteId, productoId, recipCapacidad, recipPeso, enable, fechaCompra, categoriaId,actorId,estado)
	VALUES(@recipienteId,@productoId,@recipCapacidad,@recipPeso,@enable,@fechaCompra,@categoriaId,@actorId,@estado);

    SET @contador = @contador + 1;
  END
 END

 --llenar localxproceso
   DROP PROCEDURE IF EXISTS splocalxproceso;
CREATE PROCEDURE splocalxproceso
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100000)
  BEGIN
    
	DECLARE @localId int;
	DECLARE @procesoRecoid int;
	

	SET @localId =  @contador;
    SET @procesoRecoid = CAST((RAND() * 3) + 1 AS int);

    insert into localesXproceso (localId, procesoRecoId) values
	(@localId,@procesoRecoid);

    SET @contador = @contador + 1;
  END
 END

 --llenar metricasxlocal

   DROP PROCEDURE IF EXISTS spmetricasxlocal;
CREATE PROCEDURE spmetricasxlocal
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100000)
  BEGIN
    
	DECLARE @localId int;
	DECLARE @indiceContaminacion int;
	DECLARE @indiceRecoleccion int;
	DECLARE @indiceTratamiento int;
	DECLARE @año DATETIME;

	SET @localId =  @contador;
    SET @indiceContaminacion = CAST((RAND() * 100) + 1 AS int);
	SET @indiceRecoleccion = CAST((RAND() * 100) + 60 AS int);
	SET @indiceTratamiento = CAST((RAND() * 100) + 5 AS int);
	SET @año = YEAR(GETDATE());


     insert into metricasXlocal (localId, indiceContaminacion, indiceRecoleccion,indiceTratamiento, año, checksum) values
	(@localId,@indiceContaminacion,@indiceRecoleccion,@indiceTratamiento,@año,'CHECHSUM');

    SET @contador = @contador + 1;
  END
 END

 --executes
DELETE from recipienteXlocal;
  exec spLlenarDirecciones;
  exec spLlenarEmpresas;
  exec spLlenarLocales;
  exec spLlenarCoberturaXempresa;
  exec spRecipienteXlocal;
  exec spRecipientes;
  exec splocalxproceso;
  exec spmetricasxlocal;

INSERT INTO empresasEV (empresaId, direccionId)
VALUES 
  (1, 5),
  (2, 10),
  (3, 2),
  (4, 8),
  (5, 1),
  (6, 6),
  (7, 9),
  (8, 3),
  (9, 7),
  (10, 4);

insert into tipoProcesoReco (procesoRecoid, descripcion) values
(1,3),
(2,4),
(3,5);

--precios

insert into precioXpunto (unidadBase, precio, fechaInicial, fechaFinal, paisId,
checksum) values
(1,1000, '2023-01-01', '9999-12-12', 1,'checksum'),
(1,5000, '2023-01-01', '9999-12-12', 2, 'checksum'),
(1,4000, '2023-01-01', '9999-12-12', 3,'checksum'),
(1,3000, '2023-01-01', '9999-12-12', 4, 'checksum'),
(1,6000, '2023-01-01', '9999-12-12', 5, 'checksum');

insert into precioXkm (unidadBase, precio, fechaInicial, fechaFinal, paisId, checksum)
values
(1,10000, '2023-01-01', '9999-12-12', 1,'checksum' ),
(1,9000, '2023-01-01', '9999-12-12', 2, 'checksum'),
(1,11000, '2023-01-01', '9999-12-12', 3, 'checksum' ),
(1,8000, '2023-01-01', '9999-12-12', 4, 'checksum' ),
(1,12000, '2023-01-01', '9999-12-12', 5,'checksum' );

insert into PayType (payId, descripcion) values
(1, 1),
(2, 2);INSERT INTO Traducciones(traduccionId, textOrg, textoTradu, idiomaId, enabled) VALUES
(1,'ejemplo1','example1',1,1),
(2,'ejemplo2','example2',2,1),
(3, 'Residuos plásticos', 'Plastic waste', 1, 1),
(4, 'Residuos plásticos', 'Déchets plastiques', 5, 1),
(5, 'Residuos plásticos', 'Resíduos plásticos', 4, 1),
(6, 'Residuos orgánicos', 'Organic waste', 1, 1),
(7, 'Residuos orgánicos', 'Déchets organiques', 5, 1),
(8, 'Residuos orgánicos', 'Resíduos orgânicos', 4, 1),
(9, 'Residuos electrónicos', 'Electronic waste', 1, 1),
(10, 'Residuos electrónicos', 'Déchets électroniques', 5, 1),
(11, 'Residuos electrónicos', 'Resíduos eletrônicos', 4, 1),
(12, 'Residuos peligrosos', 'Hazardous waste', 1, 1),
(13, 'Residuos peligrosos', 'Déchets dangereux', 5, 1),
(14, 'Residuos peligrosos', 'Resíduos perigosos', 4, 1),
(15, 'Residuos de papel', 'Paper waste', 1, 1),
(16, 'Residuos de papel', 'Déchets de papier', 5, 1),
(17, 'Residuos de papel', 'Resíduos de papel', 4, 1),
(18, 'Residuos de vidrio', 'Glass waste', 1, 1),
(19, 'Residuos de vidrio', 'Déchets en verre', 5, 1),
(20, 'Residuos de vidrio', 'Resíduos de vidro', 4, 1),
(21, 'Residuos de alimentos', 'Food waste', 1, 1),
(22, 'Residuos de alimentos', 'Déchets alimentaires', 5, 1),
(23, 'Residuos de alimentos', 'Resíduos de alimentos', 4, 1),
(24, 'Residuos de metales', 'Metal waste', 1, 1),
(25, 'Residuos de metales', 'Déchets métalliques', 5, 1),
(26, 'Residuos de metales', 'Resíduos de metais', 4, 1);

INSERT INTO categoriaProducto (categoriaId,descripcion) VALUES
(1, 13),
(2, 5),
(3, 20),
(4, 8),
(5, 6),
(6, 24),
(7, 19),
(8, 15),
(9, 10),
(10, 16),
(11, 18),
(12, 3),
(13, 2),
(14, 12),
(15, 4),
(16, 22),
(17, 26),
(18, 23),
(19, 9),
(20, 14),
(21, 25),
(22, 7),
(23, 1),
(24, 21),
(25, 11),
(26, 17);


SELECT * FROM paises;
SELECT * FROM estados ;
SELECT * FROM calles ;
SELECT * FROM regiones ;
SELECT * FROM idiomas;
SELECT * FROM localesXproductor;
SELECT * FROM productos;
SELECT * FROM actores;
SELECT * FROM payType;
SELECT * FROM contactType;
SELECT * FROM divisasXpais;
SELECT * FROM direcciones;
SELECT * FROM empresasEV;
SELECT * FROM coberturaXempresas;
SELECT * FROM metricasXlocal;
SELECT * FROM categoriaProducto;

DELETE FROM payType;
DELETE FROM localesXproceso;
DELETE FROM recipientes;

