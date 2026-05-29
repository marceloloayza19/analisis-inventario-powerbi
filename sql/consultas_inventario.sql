-- Consultas de analisis de inventario
-- Base de datos: db_inventario_portafolio
-- Tabla: inventario

USE db_inventario_portafolio;

-- 1. Stock total disponible
SELECT
    SUM(stock_actual) AS stock_total_disponible
FROM inventario;

-- 2. Valor total del inventario
SELECT
    SUM(valor_stock) AS valor_total_inventario
FROM inventario;

-- 3. Cantidad total de unidades vendidas
SELECT
    SUM(unidades_vendidas) AS unidades_vendidas_totales
FROM inventario;

-- 4. Productos con stock critico
SELECT
    fecha,
    producto,
    categoria,
    almacen,
    stock_actual,
    stock_minimo,
    estado_stock
FROM inventario
WHERE estado_stock = 'Critico'
ORDER BY stock_actual ASC;

-- 5. Productos con sobrestock
SELECT
    fecha,
    producto,
    categoria,
    almacen,
    stock_actual,
    stock_maximo,
    estado_stock
FROM inventario
WHERE estado_stock = 'Sobrestock'
ORDER BY stock_actual DESC;

-- 6. Productos mas vendidos
SELECT
    producto,
    categoria,
    SUM(unidades_vendidas) AS unidades_vendidas
FROM inventario
GROUP BY producto, categoria
ORDER BY unidades_vendidas DESC;

-- 7. Categorias con mayor valor de inventario
SELECT
    categoria,
    SUM(valor_stock) AS valor_inventario,
    SUM(stock_actual) AS stock_total
FROM inventario
GROUP BY categoria
ORDER BY valor_inventario DESC;

-- 8. Stock promedio por categoria
SELECT
    categoria,
    ROUND(AVG(stock_actual), 2) AS stock_promedio
FROM inventario
GROUP BY categoria
ORDER BY stock_promedio DESC;

-- 9. Ventas estimadas por producto
SELECT
    producto,
    categoria,
    SUM(unidades_vendidas * precio_venta) AS ventas_estimadas
FROM inventario
GROUP BY producto, categoria
ORDER BY ventas_estimadas DESC;

-- 10. Productos que requieren reposicion
-- Se consideran productos para reposicion cuando el stock actual esta en estado critico.
SELECT
    producto,
    categoria,
    proveedor,
    almacen,
    stock_actual,
    stock_minimo,
    stock_maximo,
    (stock_maximo - stock_actual) AS unidades_sugeridas_reposicion
FROM inventario
WHERE estado_stock = 'Critico'
ORDER BY unidades_sugeridas_reposicion DESC;

-- 11. Proveedores con mayor cantidad de productos registrados
SELECT
    proveedor,
    COUNT(DISTINCT producto) AS productos_distintos,
    COUNT(*) AS registros
FROM inventario
GROUP BY proveedor
ORDER BY productos_distintos DESC, registros DESC;

-- 12. Almacenes con mayor valor de stock
SELECT
    almacen,
    SUM(valor_stock) AS valor_stock_total,
    SUM(stock_actual) AS stock_total
FROM inventario
GROUP BY almacen
ORDER BY valor_stock_total DESC;

-- 13. Comparacion entre stock_actual, stock_minimo y stock_maximo
SELECT
    producto,
    categoria,
    almacen,
    stock_actual,
    stock_minimo,
    stock_maximo,
    estado_stock
FROM inventario
ORDER BY categoria, producto, fecha;

-- 14. Ranking de productos segun rotacion
-- La rotacion se aproxima como unidades vendidas / stock promedio.
SELECT
    producto,
    categoria,
    SUM(unidades_vendidas) AS unidades_vendidas,
    ROUND(AVG(stock_actual), 2) AS stock_promedio,
    ROUND(SUM(unidades_vendidas) / NULLIF(AVG(stock_actual), 0), 2) AS rotacion_estimada
FROM inventario
GROUP BY producto, categoria
ORDER BY rotacion_estimada DESC;

-- 15. Resumen ejecutivo del inventario
SELECT
    SUM(stock_actual) AS stock_total,
    SUM(valor_stock) AS valor_total_inventario,
    SUM(unidades_vendidas) AS unidades_vendidas,
    SUM(unidades_recibidas) AS unidades_recibidas,
    COUNT(DISTINCT producto) AS total_productos,
    COUNT(DISTINCT categoria) AS total_categorias,
    COUNT(DISTINCT proveedor) AS total_proveedores,
    COUNT(DISTINCT almacen) AS total_almacenes,
    SUM(CASE WHEN estado_stock = 'Critico' THEN 1 ELSE 0 END) AS productos_criticos,
    SUM(CASE WHEN estado_stock = 'Sobrestock' THEN 1 ELSE 0 END) AS productos_sobrestock
FROM inventario;
