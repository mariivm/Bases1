-- Punto 3 Consulta que incluye todos los componentes

-- Consulta Original
SELECT
    p.nombre AS producto,
    c.nombre AS cliente,
    COUNT(v.ventaid) AS cantidad_ventas,
    SUM(v.cantidadVenta) AS total_ventas
FROM
    ventasProductos v
    INNER JOIN productos p ON v.productoid = p.productoid
    LEFT JOIN clientes c ON v.clienteid = c.clienteid
WHERE
    p.productoid NOT IN (2, 5)
    AND v.cantidadVenta >2
GROUP BY
    p.nombre,
    c.nombre
HAVING
    COUNT(v.ventaid) >= 2
EXCEPT
SELECT
    p.nombre AS producto,
    c.nombre AS cliente,
    COUNT(v.ventaid) AS cantidad_ventas,
    SUM(v.cantidadVenta) AS total_ventas
FROM
    ventasProductos v
    INNER JOIN productos p ON v.productoid = p.productoid
    LEFT JOIN clientes c ON v.clienteid = c.clienteid
WHERE
    p.productoid NOT IN (3, 6)
    AND v.cantidadVenta > 2
GROUP BY
    p.nombre,
    c.nombre
HAVING
    COUNT(v.ventaid) >= 2
ORDER BY
    total_ventas DESC
FOR JSON AUTO


-- Consulta Optimizada version 2
CREATE INDEX index_productoid ON productos (productoid);
CREATE INDEX index_monto ON ventasProductos (cantidadVenta);
CREATE INDEX index_clienteid ON clientes (clienteid);
CREATE INDEX index_ventas_productoid ON ventasProductos (productoid);
CREATE INDEX index_ventas_clienteid ON ventasProductos (clienteid);

SELECT
    p.nombre AS producto,
    c.nombre AS cliente,
    COUNT(v.ventaid) AS cantidad_ventas,
    SUM(v.cantidadVenta) AS total_ventas
FROM
    ventasProductos v
    INNER JOIN productos p ON v.productoid = p.productoid
    LEFT JOIN clientes c ON v.clienteid = c.clienteid
WHERE
    p.productoid NOT IN (2, 5)
    AND v.cantidadVenta >2
GROUP BY
    p.nombre,
    c.nombre
HAVING
    COUNT(v.ventaid) >= 2
EXCEPT
SELECT
    p.nombre AS producto,
    c.nombre AS cliente,
    COUNT(v.ventaid) AS cantidad_ventas,
    SUM(v.cantidadVenta) AS total_ventas
FROM
    ventasProductos v
    INNER JOIN productos p ON v.productoid = p.productoid
    LEFT JOIN clientes c ON v.clienteid = c.clienteid
WHERE
    p.productoid NOT IN (3, 6)
    AND v.cantidadVenta > 2
GROUP BY
    p.nombre,
    c.nombre
HAVING
    COUNT(v.ventaid) >= 2
ORDER BY
    total_ventas DESC
FOR JSON AUTO





--Consulta final Optimizada 
SELECT 
    p.nombre AS producto,
    c.nombre AS cliente,
    v.fechaVenta,
    COUNT(v.ventaid) AS cantidad_ventas,
    SUM(v.cantidadVenta) AS total_ventas
FROM 
    ventasProductos v
    INNER JOIN productos p ON v.productoid = p.productoid
    OUTER APPLY (
        SELECT TOP 1
            c1.clienteid,
            c1.nombre
        FROM 
            clientes c1
        WHERE 
            c1.clienteid = v.clienteid
    ) c
WHERE 
    p.productoid NOT IN (2, 5)
    AND v.cantidadVenta > 1
    AND c.clienteid IS NOT NULL
GROUP BY 
    p.nombre, 
    c.nombre, 
    v.fechaVenta
HAVING 
    COUNT(v.ventaid) >= 2
ORDER BY 
    total_ventas DESC, 
    cantidad_ventas DESC


