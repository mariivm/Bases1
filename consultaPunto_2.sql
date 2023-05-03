--CONSULTAS PUNTO #2

SELECT actores.descripcion,localesXproductor.localId, Paises.nombre ,recipientes.recipienteId,(traducciones.textoTradu) as categoria from actores inner join
localesXproductor ON actores.actorId = localesXproductor.actorId inner JOIN
direcciones ON localesXproductor.direccionId = direcciones.direccionId inner JOIN
paises on direcciones.paisId = paises.paisId inner join
recipienteXlocal ON localesXproductor.localId = recipienteXlocal.localId inner join
recipientes ON recipienteXlocal.recipienteId = recipientes.recipienteId inner JOIN 
categoriaProducto on recipientes.categoriaId = categoriaProducto.categoriaId inner join
traducciones ON categoriaProducto.descripcion = traducciones.traduccionId
ORDER BY actores.actorId ASC;

SELECT actores.descripcion, localesXproductor.localId, Paises.nombre, traducciones.textoTradu 
FROM actores 
INNER JOIN localesXproductor ON actores.actorId = localesXproductor.actorId 
INNER JOIN direcciones ON localesXproductor.direccionId = direcciones.direccionId 
INNER JOIN Paises ON direcciones.paisId = Paises.paisId 
LEFT JOIN recipientes ON actores.actorId = recipientes.actorId 
LEFT JOIN categoriaProducto ON recipientes.categoriaId = categoriaProducto.categoriaId 
LEFT JOIN traducciones ON categoriaProducto.descripcion = traducciones.traduccionId 
ORDER BY actores.actorId ASC;

--consulta de vista indexada
drop view dbo.vista_indexada;
CREATE VIEW dbo.vista_indexada
WITH SCHEMABINDING
AS
SELECT actores.descripcion,localesXproductor.localId, Paises.nombre ,recipientes.recipienteId,(traducciones.textoTradu) as categoria 
FROM dbo.actores 
INNER JOIN dbo.localesXproductor ON actores.actorId = localesXproductor.actorId 
INNER JOIN dbo.direcciones ON localesXproductor.direccionId = direcciones.direccionId 
INNER JOIN dbo.paises ON direcciones.paisId = paises.paisId 
INNER JOIN dbo.recipienteXlocal ON localesXproductor.localId = recipienteXlocal.localId 
INNER JOIN dbo.recipientes ON recipienteXlocal.recipienteId = recipientes.recipienteId 
INNER JOIN dbo.categoriaProducto ON recipientes.categoriaId = categoriaProducto.categoriaId 
INNER JOIN dbo.traducciones ON categoriaProducto.descripcion = traducciones.traduccionId;
GO

CREATE UNIQUE CLUSTERED INDEX vista_indexada_index ON dbo.vista_indexada (recipienteId);

-- Consulta dinamica

 
SELECT * FROM dbo.vista_indexada;
SELECT * FROM actores;