-- Script de creacion de base de datos y tabla
-- Proyecto: Analisis de Inventario con Power BI
-- Motor recomendado: MySQL 8.0 o superior

CREATE DATABASE IF NOT EXISTS db_inventario_portafolio
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_spanish_ci;

USE db_inventario_portafolio;

DROP TABLE IF EXISTS inventario;

CREATE TABLE inventario (
    id_registro INT NOT NULL,
    fecha DATE NOT NULL,
    producto VARCHAR(120) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    proveedor VARCHAR(120) NOT NULL,
    almacen VARCHAR(100) NOT NULL,
    stock_actual INT NOT NULL,
    stock_minimo INT NOT NULL,
    stock_maximo INT NOT NULL,
    unidades_vendidas INT NOT NULL,
    unidades_recibidas INT NOT NULL,
    costo_unitario DECIMAL(10, 2) NOT NULL,
    precio_venta DECIMAL(10, 2) NOT NULL,
    valor_stock DECIMAL(12, 2) NOT NULL,
    estado_stock VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_registro)
);

-- Como importar el CSV desde MySQL Workbench:
-- 1. Ejecutar este script para crear la base de datos y la tabla.
-- 2. En el panel de esquemas, seleccionar db_inventario_portafolio.
-- 3. Clic derecho sobre la tabla inventario.
-- 4. Seleccionar "Table Data Import Wizard".
-- 5. Elegir el archivo data/inventario.csv.
-- 6. Confirmar que el separador sea coma y que la primera fila contiene encabezados.
-- 7. Mapear cada columna del CSV con su columna correspondiente.
-- 8. Ejecutar la importacion.

-- Validaciones recomendadas despues de importar:
SELECT COUNT(*) AS registros_importados
FROM inventario;

SELECT *
FROM inventario
LIMIT 10;

-- Esta consulta debe devolver cero filas si valor_stock fue importado correctamente.
SELECT
    id_registro,
    stock_actual,
    costo_unitario,
    valor_stock,
    stock_actual * costo_unitario AS valor_calculado
FROM inventario
WHERE valor_stock <> stock_actual * costo_unitario;

-- Esta consulta ayuda a revisar si estado_stock es coherente.
SELECT *
FROM inventario
WHERE
    (stock_actual <= stock_minimo AND estado_stock <> 'Critico')
    OR (stock_actual > stock_minimo AND stock_actual <= stock_maximo AND estado_stock <> 'Normal')
    OR (stock_actual > stock_maximo AND estado_stock <> 'Sobrestock');
