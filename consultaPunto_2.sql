--CONSULTAS PUNTO #2

SELECT actores.descripcion,localesXproductor.localId, Paises.nombre ,recipientes.recipienteId,(traducciones.textoTradu) as categoria
FROM actores
INNER JOIN localesXproductor ON actores.actorId = localesXproductor.actorId
INNER JOIN direcciones ON localesXproductor.direccionId = direcciones.direccionId
INNER JOIN paises ON direcciones.paisId = paises.paisId
INNER JOIN recipienteXlocal ON localesXproductor.localId = recipienteXlocal.localId
INNER JOIN recipientes ON recipienteXlocal.recipienteId = recipientes.recipienteId
INNER JOIN categoriaProducto ON recipientes.categoriaId = categoriaProducto.categoriaId
INNER JOIN traducciones ON categoriaProducto.descripcion = traducciones.traduccionId
ORDER BY actores.actorId ASC;

--consulta de vista indexada
IF OBJECT_ID('dbo.vista_indexada','view') IS NOT NULL
	DROP view dbo.vista_indexada;
GO

CREATE VIEW dbo.vista_indexada
WITH SCHEMABINDING
AS
SELECT COUNT_BIG(*) AS countbig,actor.descripcion,localesXproductor.localId, Paises.nombre ,recipientes.recipienteId,(traducciones.textoTradu) as categoria 
FROM dbo.actores actor 
INNER JOIN dbo.localesXproductor ON actor.actorId = localesXproductor.actorId 
INNER JOIN dbo.direcciones ON localesXproductor.direccionId = direcciones.direccionId 
INNER JOIN dbo.paises ON direcciones.paisId = paises.paisId 
INNER JOIN dbo.recipienteXlocal ON localesXproductor.localId = recipienteXlocal.localId 
INNER JOIN dbo.recipientes ON recipienteXlocal.recipienteId = recipientes.recipienteId 
INNER JOIN dbo.categoriaProducto ON recipientes.categoriaId = categoriaProducto.categoriaId 
INNER JOIN dbo.traducciones ON categoriaProducto.descripcion = traducciones.traduccionId 
GROUP BY actor.descripcion,localesXproductor.localId, Paises.nombre ,recipientes.recipienteId,traducciones.textoTradu 
GO

DROP INDEX vista_indexada_index on dbo.vista_indexada
GO

CREATE UNIQUE CLUSTERED INDEX vista_indexada_index 
	ON dbo.vista_indexada(descripcion,localId,nombre,recipienteId,categoria);
go

-- Consulta dinamica
DECLARE @sqlConsulta NVARCHAR(1000)
SET @sqlConsulta =
'SELECT actores.descripcion,localesXproductor.localId, Paises.nombre ,recipientes.recipienteId,(traducciones.textoTradu) as categoria
FROM actores
INNER JOIN localesXproductor ON actores.actorId = localesXproductor.actorId
INNER JOIN direcciones ON localesXproductor.direccionId = direcciones.direccionId
INNER JOIN paises ON direcciones.paisId = paises.paisId
INNER JOIN recipienteXlocal ON localesXproductor.localId = recipienteXlocal.localId
INNER JOIN recipientes ON recipienteXlocal.recipienteId = recipientes.recipienteId
INNER JOIN categoriaProducto ON recipientes.categoriaId = categoriaProducto.categoriaId
INNER JOIN traducciones ON categoriaProducto.descripcion = traducciones.traduccionId
ORDER BY actores.actorId ASC';

EXECUTE sp_executesql @sqlConsulta
 
SELECT * FROM dbo.vista_indexada;
SELECT * FROM actores;