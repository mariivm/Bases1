-- +FlywayNonRepeatable
CREATE PROCEDURE spLlenarLocales
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100)
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
exec spLlenarLocales;