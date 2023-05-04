-- +FlywayNonRepeatable

CREATE PROCEDURE llenarRecepcionDesechos
 AS
 BEGIN
  DECLARE @contador int;
  SET @contador = 1;
  DECLARE @localid int;
  DECLARE @recipienteid int;
  DECLARE @recepcionid int;
  DECLARE @fecha datetime;
  declare @tipoRecepcion smallint;
  declare @productoId int;
  declare @pesoRecibido decimal(8,2);
  declare @empresaid int;
  declare @checksum varbinary(150);


  WHILE (@contador <= 10001)
  BEGIN
	
	    set @localid = FLOOR(RAND()*(10000-1+1)+1);
		set @recipienteid = FLOOR(RAND()*(10000-1+1)+1);
		set @fecha = GETDATE();
		set @tipoRecepcion = FLOOR(RAND()*(2-1+1)+1);
		set @recepcionId = @contador;
		set @productoId = FLOOR(RAND()*(15-1+1)+1);
		set @pesoRecibido = FLOOR(RAND()*(20-1+1)+1);
		set @empresaid = null;
		SET @checksum = 0x0102030405;

		INSERT INTO recepcionDesechos(localId, recipienteId, recepcionId, fecha, tipoRecepcion, productoId, pesoRecibido, empresaId, checksum)
		VALUES (@localid, @recipienteid,@recepcionid, @fecha, @tipoRecepcion, @productoId, @pesoRecibido, @empresaid, @checksum);
	
    SET @contador = @contador + 1;
  END
 END
 exec llenarRecepcionDesechos;
