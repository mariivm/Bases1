-- +FlywayNonRepeatable
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
exec spLlenarCoberturaXempresa;