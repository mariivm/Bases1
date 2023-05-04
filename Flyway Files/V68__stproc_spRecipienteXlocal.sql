-- +FlywayNonRepeatable
CREATE PROCEDURE spRecipienteXlocal
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100)
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
exec spRecipienteXlocal;