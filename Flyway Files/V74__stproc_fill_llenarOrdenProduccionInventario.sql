-- +FlywayNonRepeatable
CREATE PROCEDURE llenarOrdenProduccionInventario
 AS
 BEGIN
  DECLARE @contador int;
  SET @contador = 1;
  DECLARE @lote int;
  declare @recepcionid int;
  declare @productoid int;
  declare @cantidadInicial decimal(8,2)
  declare @productoResult int;
  declare @cantidadResult int;
  declare @costo int;
  declare @actorid int; --null
  declare @checksum varbinary(150);


  WHILE (@contador <= 1000)
  BEGIN
	    set @lote = @contador;
		set @recepcionid = FLOOR(RAND()*(10001-1+1)+1);
		set @productoid = FLOOR(RAND()*(15-1+1)+1);
		set @cantidadInicial = FLOOR(RAND()*(20-1+1)+1);
		set @productoResult = FLOOR(RAND()*(15-1+1)+1); 
		set @cantidadResult =  FLOOR(RAND()*(20-1+1)+1);
		set @costo = 5000;
		set @actorid = null;
		SET @checksum = 0x0102030405;

		INSERT INTO ordenProduccion(lote,recepcionId,productoId,cantidadInicial,productoResult,cantidadResult, costo,actorId)
		VALUES (@lote, @recepcionid, @productoid, @cantidadInicial, @productoResult, @cantidadResult, @costo, @actorid);

		insert into inventarioProductos(productoId, lote, cantidad, unidadMedida, costo, checksum) values
		(@productoResult, @lote, @cantidadResult, '-', @costo, @checksum)
	
    SET @contador = @contador + 1;
  END
 END
 exec llenarOrdenProduccionInventario;
