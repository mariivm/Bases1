--CTE 
WITH cteVentas AS (
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
)
SELECT *
FROM cteVentas
ORDER BY 
    total_ventas DESC, 
    cantidad_ventas DESC;