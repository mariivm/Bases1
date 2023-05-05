-- Punto 3 Consulta que incluye todos los componentes
SELECT c.nombre AS nombre_cliente, p.fechaVenta, pr.nombre AS nombre_producto
FROM clientes c
LEFT JOIN ventasProductos p ON c.clienteId = p.clienteId
LEFT JOIN productos pr ON p.productoId = pr.productoId
WHERE len(pr.nombre)>= 10
AND EXISTS(
  SELECT 1
  FROM ventasProductos vp
  JOIN productos pro ON vp.productoId = pro.productoId
  WHERE vp.clienteId = c.clienteId
  AND vp.fechaVenta BETWEEN '2023-01-01' AND '2023-12-31'
)
GROUP BY c.nombre, p.fechaVenta, pr.nombre
HAVING COUNT(p.ventaId) > 1
ORDER BY pr.nombre DESC
FOR JSON AUTO;

