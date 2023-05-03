-- +FlywayNonRepeatable
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
exec spLlenarEmpresas;