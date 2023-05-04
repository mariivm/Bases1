-- +FlywayNonRepeatable
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

exec spLlenarDirecciones;