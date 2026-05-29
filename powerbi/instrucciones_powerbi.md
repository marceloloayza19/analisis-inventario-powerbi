# Instrucciones para construir el dashboard en Power BI Desktop

Esta guia explica como construir manualmente el archivo `.pbix` usando el dataset del proyecto. El repositorio no incluye un `.pbix` falso.

## 1. Importar el CSV

1. Abrir Power BI Desktop.
2. Seleccionar `Obtener datos`.
3. Elegir `Texto/CSV`.
4. Seleccionar `data/inventario.csv`.
5. Revisar la vista previa.
6. Hacer clic en `Transformar datos`.

## 2. Revisar Power Query

En Power Query:

1. Verificar los tipos de datos.
2. Convertir `fecha` a tipo fecha.
3. Validar columnas numericas.
4. Revisar valores nulos.
5. Quitar duplicados usando `id_registro` si existieran.
6. Crear columnas de `anio`, `mes`, `nombre_mes` y `anio_mes`.
7. Validar la coherencia de `estado_stock`.
8. Crear `margen_unitario` y `ventas_estimadas` si se desea trabajar con columnas calculadas.
9. Seleccionar `Cerrar y aplicar`.

Usar como referencia el archivo `powerbi/power_query_m.md`.

## 3. Crear medidas DAX

1. Ir a la vista de datos o modelo.
2. Seleccionar la tabla `inventario`.
3. Crear nuevas medidas.
4. Copiar las formulas de `powerbi/medidas_dax.md`.
5. Formatear las medidas como moneda, numero entero o porcentaje segun corresponda.

## 4. Crear tarjetas KPI

Insertar 4 tarjetas:

- Stock Total.
- Valor Total de Inventario.
- Productos Criticos.
- Unidades Vendidas.

Ubicarlas en la parte superior del dashboard.

## 5. Crear grafico de productos criticos

1. Insertar grafico de barras.
2. Eje: `producto`.
3. Valores: `stock_actual`.
4. Filtro visual: `estado_stock = Critico`.
5. Ordenar por menor stock actual.

## 6. Crear grafico de valor por categoria

1. Insertar grafico de columnas.
2. Eje: `categoria`.
3. Valores: `Valor Total de Inventario`.
4. Ordenar de mayor a menor.

## 7. Crear top 10 productos mas vendidos

1. Insertar grafico de barras horizontal.
2. Eje: `producto`.
3. Valores: `Unidades Vendidas`.
4. Aplicar filtro Top N = 10 por `Unidades Vendidas`.

## 8. Crear grafico de dona por estado_stock

1. Insertar grafico de dona.
2. Leyenda: `estado_stock`.
3. Valores: conteo de `id_registro`.
4. Aplicar colores: rojo para Critico, verde para Normal y naranja para Sobrestock.

## 9. Crear grafico por almacen

1. Insertar grafico de barras o columnas.
2. Eje: `almacen`.
3. Valores: `Valor Total de Inventario`.
4. Ordenar de mayor a menor.

## 10. Crear tabla de detalle

Insertar una tabla o matriz con:

- Producto.
- Categoria.
- Stock actual.
- Stock minimo.
- Stock maximo.
- Estado stock.

Ordenar para que los productos criticos sean faciles de revisar.

## 11. Agregar segmentadores

Crear segmentadores para:

- `fecha`.
- `categoria`.
- `proveedor`.
- `almacen`.
- `estado_stock`.

## 12. Guardar el archivo .pbix

Guardar el archivo como:

`powerbi/analisis_inventario_powerbi.pbix`

Este archivo debe crearse manualmente desde Power BI Desktop.

## 13. Exportar capturas

Cuando el dashboard este terminado:

1. Tomar captura del dashboard general.
2. Tomar capturas de KPIs y graficos principales.
3. Guardarlas en la carpeta `images/`.
4. Actualizar el README principal si agregas imagenes reales.
