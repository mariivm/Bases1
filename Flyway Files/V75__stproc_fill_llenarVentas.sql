-- +FlywayNonRepeatable
CREATE PROCEDURE llenarVentas
 AS
 BEGIN
  DECLARE @contador int;
  SET @contador = 1;
  declare @ventaid int;
  declare @clienteid int;
  declare @empresaId int;
  declare @productoId int;
  declare @fechaVenta datetime;
  declare @cantidadVenta decimal(8,2);
  declare @lote int;


  WHILE (@contador <= 10000)
  BEGIN
	    set @ventaid = @contador;
		set @clienteid = FLOOR(RAND()*(20-1+1)+1);
		set @empresaId = FLOOR(RAND()*(100-1+1)+1);
		set @lote = FLOOR(RAND()*(1000-1+1)+1);
		set @productoId = FLOOR(RAND()*(15-1+1)+1);
		set @fechaVenta = DATEADD(day, ABS(CHECKSUM(NEWID())) % 365, '2023-01-01');
		set @cantidadVenta =  FLOOR(RAND()*(5-1+1)+1); 

		INSERT INTO ventasProductos(ventaId, clienteId, empresaId, productoId, fechaVenta, cantidadVenta, lote)
		VALUES (@ventaid, @clienteid, @empresaId, @productoId, @fechaVenta, @cantidadVenta, @lote);

    SET @contador = @contador + 1;
  END
 END
 exec llenarVentas;
