#CONSULTAS
	#CONSULTA 1
SELECT ORDEN.id_cliente,CLIENTE.Nombre,CLIENTE.Apellido,PAIS.nombrePais,SUM(ORDEN.cantidad*PRODUCTO.Precio) as MontoTotal
FROM ORDEN 
INNER JOIN CLIENTE ON ORDEN.id_cliente = CLIENTE.id_cliente
INNER JOIN PAIS ON PAIS.id_pais =  CLIENTE.id_pais
INNER JOIN PRODUCTO ON ORDEN.id_producto = PRODUCTO.id_producto
GROUP BY id_cliente
ORDER BY SUM(cantidad) DESC
LIMIT 1;

	#CONSULTA 2
(SELECT PRODUCTO.id_producto, PRODUCTO.nombreProducto, CATEGORIA.nombreCategoria, sum(ORDEN.cantidad) AS Unidades, sum(ORDEN.cantidad * PRODUCTO.precio) AS Monto
FROM Producto 
INNER JOIN CATEGORIA ON CATEGORIA.id_categoria = PRODUCTO.id_categoria
INNER JOIN ORDEN ON ORDEN.id_producto = PRODUCTO.id_producto
GROUP BY  ORDEN.id_producto
ORDER BY sum(cantidad) DESC
LIMIT 1)
UNION
(SELECT PRODUCTO.id_producto, PRODUCTO.nombreProducto, CATEGORIA.nombreCategoria, sum(ORDEN.cantidad) AS Unidades, sum(ORDEN.cantidad * PRODUCTO.precio) AS Monto
FROM Producto 
INNER JOIN CATEGORIA ON CATEGORIA.id_categoria = PRODUCTO.id_categoria
INNER JOIN ORDEN ON ORDEN.id_producto = PRODUCTO.id_producto
GROUP BY  ORDEN.id_producto
ORDER BY sum(cantidad) ASC
LIMIT 1);
	#CONSULTA 3
SELECT VENDEDOR.id_vendedor,VENDEDOR.nombreVendedor, SUM(ORDEN.cantidad * PRODUCTO.Precio) as Monto
FROM ORDEN 
INNER JOIN PRODUCTO ON ORDEN.id_producto = PRODUCTO.id_producto
INNER JOIN VENDEDOR ON VENDEDOR.id_vendedor = ORDEN.id_vendedor
GROUP BY ORDEN.id_vendedor
ORDER BY SUM(cantidad) DESC
LIMIT 1;
	#CONSULTA 4
(SELECT PAIS.nombrePais,  SUM(ORDEN.cantidad * PRODUCTO.precio) as Monto
from ORDEN 
INNER JOIN PRODUCTO  ON ORDEN.id_producto = PRODUCTO.id_producto 
INNER JOIN VENDEDOR  ON ORDEN.id_vendedor = VENDEDOR.id_vendedor
INNER JOIN PAIS  ON PAIS.id_pais=VENDEDOR.id_paisV
GROUP BY  VENDEDOR.id_paisV
order by SUM(cantidad) desc
limit 1)
union
(select PAIS.nombrePais,  SUM(ORDEN.cantidad * PRODUCTO.precio) as monto
from ORDEN 
INNER JOIN PRODUCTO  ON ORDEN.id_producto = PRODUCTO.id_producto 
INNER JOIN VENDEDOR  ON ORDEN.id_vendedor = VENDEDOR.id_vendedor
INNER JOIN PAIS  ON PAIS.id_pais=VENDEDOR.id_paisV
GROUP BY  VENDEDOR.id_paisV
order by SUM(cantidad) asc
limit 1);
    #CONSULTA 5
SELECT PAIS.id_pais, PAIS.nombrePais,  SUM(ORDEN.cantidad * PRODUCTO.precio) AS monto
FROM ORDEN 
INNER JOIN PRODUCTO  ON ORDEN.id_producto = PRODUCTO.id_producto 
INNER JOIN CLIENTE ON ORDEN.id_cliente = CLIENTE.id_cliente
INNER JOIN PAIS  ON PAIS.id_pais=CLIENTE.id_pais
GROUP BY   PAIS.id_pais
ORDER BY SUM(cantidad) ASC
LIMIT 6,11;
    #CONSULTA 6
(SELECT CATEGORIA.nombreCategoria, SUM(ORDEN.cantidad) as CantidadUnidades
FROM CATEGORIA
INNER JOIN PRODUCTO ON CATEGORIA.id_categoria = PRODUCTO.id_categoria
INNER JOIN ORDEN ON PRODUCTO.id_producto	=	ORDEN.id_producto
GROUP BY PRODUCTO.id_categoria
ORDER BY CantidadUnidades DESC
LIMIT 1)
UNION
(SELECT CATEGORIA.nombreCategoria, SUM(ORDEN.cantidad) as CantidadUnidades
FROM CATEGORIA
INNER JOIN PRODUCTO ON CATEGORIA.id_categoria = PRODUCTO.id_categoria
INNER JOIN ORDEN ON PRODUCTO.id_producto	=	ORDEN.id_producto
GROUP BY PRODUCTO.id_categoria
ORDER BY CantidadUnidades ASC
LIMIT 1);
    #CONSULTA 7
    #CONSULTA 8 
SELECT MONTH(ORDEN.fecha_orden), SUM(ORDEN.cantidad * PRODUCTO.Precio) AS Monto
FROM ORDEN
INNER JOIN PRODUCTO ON ORDEN.id_producto = PRODUCTO.id_producto
INNER JOIN VENDEDOR ON VENDEDOR.id_vendedor = ORDEN.id_vendedor
INNER JOIN PAIS ON (VENDEDOR.id_paisv = PAIS.id_pais AND PAIS.id_pais = 10)
GROUP BY MONTH(ORDEN.fecha_orden)
ORDER BY MONTH(ORDEN.fecha_orden);
    #CONSULTA 9
(SELECT MONTH(ORDEN.fecha_orden) AS MES, SUM(ORDEN.cantidad * PRODUCTO.precio) AS MONTO
FROM ORDEN 
INNER JOIN PRODUCTO  ON ORDEN.id_producto = PRODUCTO.id_producto 
GROUP BY  MONTH(ORDEN.fecha_orden) 
ORDER BY MONTO DESC
LIMIT 1)
union
(SELECT MONTH(ORDEN.fecha_orden) AS mes, SUM(ORDEN.cantidad * PRODUCTO.precio) AS MONTO
FROM ORDEN 
INNER JOIN PRODUCTO  ON ORDEN.id_producto = PRODUCTO.id_producto 
GROUP BY  MONTH(ORDEN.fecha_orden) 
ORDER BY MONTO ASC
LIMIT 1);
    #CONSULTA 10
SELECT PRODUCTO.id_Producto, PRODUCTO.nombreProducto, SUM(ORDEN.cantidad * PRODUCTO.Precio) AS Monto
FROM ORDEN 
INNER JOIN PRODUCTO  ON ORDEN.id_Producto = PRODUCTO.id_Producto
INNER JOIN CATEGORIA  ON CATEGORIA.id_categoria = PRODUCTO.id_categoria AND PRODUCTO.id_categoria = 15
group by PRODUCTO.id_Producto
LIMIT 20;