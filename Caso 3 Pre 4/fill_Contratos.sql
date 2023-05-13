-- llenado de los contratos 

--contratos Generales 

create procedure spLlenarContratosGen as begin
	declare @contador int;
	set @contador =1;
	declare @cant int;
	select @cant = count(*) from actores where tipoActorId = 1;


	while (@contador <= @cant) begin 
		insert into contratosGenerales (contratoId, actorId, fechaInicial, fechaFinal) values
		(@contador, @contador, '2023-01-01', '2024-01-01');

		set @contador = @contador +1;
	end 
end 
go
--Contratos
--ContratoId,empresaId, fechaInicial, fechaFinal, status, cicloid, localid, enabled

create procedure spContratosfill as begin
	declare @contador int;
	set @contador =1;
	declare @actorid int;
	declare @contratoid int;
	declare @cicloid int;


	while (@contador <= 100) begin 
		select @actorid = actorid from localesXproductor where localId = @contador;
		select @contratoid = contratoid from contratosGenerales where actorId = @actorid;
		select @cicloid = cicloid from cicloRecoleccion where localId = @contador;

		insert into contratos (contratoId, empresaId, fechaInicial, fechaFinal,status, cicloId, localId, enabled ) values
		(@contratoid, @contador, '2023-01-01', '2024-01-01',1, @cicloid, @contador, 1)

		set @contador = @contador +1;
	end 
end 
go

--Actores x contrato x producto
-- contratoid, actorid,productoid,porcentaje,fechaInicio, fechaFinal,checksum

create procedure spFillContratoxAxP as begin
	declare @contador int;
	set @contador = 1;
	declare @actoridR int;
	declare @cont2 int;
	declare @cant int;
	
	
	while (@contador <= 6) begin 
		set @cant = FLOOR(RAND()*(12-1+1)+1);
		set @cont2 =1
		set @actoridR = FLOOR(RAND()*(11-7+1)+7);
		while (@cont2 <=  @cant) begin 
			insert into actoresXcontratoXproducto (contratoId, actorid, productoId, porcentaje, fechaInicio, fechaFinal, checksum) values
			(@contador, @contador,@cont2, 70, '2023-01-01', '2024-01-01', 0x0102030405)
			insert into actoresXcontratoXproducto (contratoId, actorid, productoId, porcentaje, fechaInicio, fechaFinal, checksum) values
			(@contador, @actoridR,@cont2, 30, '2023-01-01', '2024-01-01', 0x0102030405)
			set @cont2 = @cont2 +1;
		end 
		set @contador = @contador +1;
	end 
end

