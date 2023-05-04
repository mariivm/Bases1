-- +FlywayNonRepeatable
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
 go

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

 exec spLlenarLocales;
 exec spRecipientes;

