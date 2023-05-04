-- +FlywayNonRepeatable 
 CREATE PROCEDURE llenarPrecioxProducto
 AS
 BEGIN
  DECLARE @contador int;
  SET @contador = 1;
  DECLARE @contador2 int;

  WHILE (@contador <= 101)
  BEGIN
	SET @contador2 = 1;
	WHILE (@contador2 <= 16)
	BEGIN
		DECLARE @productoid int;
		DECLARE @precio decimal(8,2);
		DECLARE @fechaInicial DATETIME;
		DECLARE @fechaFinal DATETIME;
		DECLARE @cantidad int;
		DECLARE @unidadMedida varchar(10);
		DECLARE @empresaid int;
		DECLARE @checksum varbinary(150);

		SET @productoid =@contador2;
		SET @precio =10.0;
		SET @fechaInicial = '2023-01-01';
		SET @fechaFinal  = '2999-01-01';
		SET @cantidad = 1;
		SET @unidadMedida = 'null';
		SET @empresaid =@contador;
		SET @checksum = 0x0102030405;

		INSERT INTO precioXproducto (productoId,precio, fechaInicial, fechaFinal,cantidad,unidadMedida, empresaId, checksum)
		VALUES (@productoid, @precio, @fechaInicial, @fechaFinal, @cantidad, @unidadMedida, @empresaid, @checksum);
		SET @contador2 = @contador2+1;
	END 
    SET @contador = @contador + 1;
  END
 END
 exec llenarPrecioxProducto;
 