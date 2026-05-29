# Layout recomendado del dashboard en Power BI

## Tamano de pagina

- Formato recomendado: `16:9`.
- Resolucion sugerida: `1280 x 720 px`.
- Una pagina principal tipo resumen operativo.

## Titulo del dashboard

`Dashboard de Inventario - Stock y Reposicion`

Ubicar el titulo en la parte superior izquierda, con una tipografia clara y profesional.

## Colores recomendados

- Azul principal: `#1F4E79`.
- Rojo para stock critico: `#C0392B`.
- Verde para stock normal: `#2E7D32`.
- Naranja para sobrestock: `#F28C28`.
- Gris claro para fondo: `#F3F6F8`.
- Gris oscuro para texto: `#2F2F2F`.

## Orden visual del dashboard

1. Titulo y segmentadores.
2. KPIs principales en la parte superior.
3. Alertas de stock critico y distribucion por estado.
4. Analisis por categoria, producto y almacen.
5. Tabla de detalle para revision operativa.

## Tarjetas KPI

Crear 4 tarjetas principales:

1. Stock Total: medida `Stock Total`.
2. Valor Total de Inventario: medida `Valor Total de Inventario`.
3. Productos Criticos: medida `Productos Criticos`.
4. Unidades Vendidas: medida `Unidades Vendidas`.

Ubicacion recomendada: fila superior, debajo del titulo.

## Grafico de barras: Productos con stock critico

Campos:

- Eje: `producto`.
- Valores: `stock_actual`.
- Filtro visual: `estado_stock = Critico`.
- Tooltip: `stock_minimo`, `stock_maximo`, `proveedor`, `almacen`.

Objetivo: identificar rapidamente productos que requieren reposicion.

## Grafico de columnas: Valor de inventario por categoria

Campos:

- Eje: `categoria`.
- Valores: `Valor Total de Inventario`.
- Tooltip: `Stock Total`, `Unidades Vendidas`.

Objetivo: conocer que categorias concentran mayor valor inmovilizado.

## Grafico de barras horizontal: Top 10 productos mas vendidos

Campos:

- Eje: `producto`.
- Valores: `Unidades Vendidas`.
- Filtro Top N: Top 10 por `Unidades Vendidas`.

Objetivo: detectar productos de alta demanda.

## Grafico de dona: Distribucion por estado_stock

Campos:

- Leyenda: `estado_stock`.
- Valores: conteo de `id_registro`.

Objetivo: visualizar la proporcion de productos en estado Critico, Normal y Sobrestock.

## Grafico por almacen: Valor de stock por almacen

Campos:

- Eje: `almacen`.
- Valores: `Valor Total de Inventario`.
- Tooltip: `Stock Total`, `Productos Criticos`, `Productos en Sobrestock`.

Objetivo: comparar el valor de inventario entre almacenes.

## Tabla o matriz de detalle

Campos:

- `producto`.
- `categoria`.
- `stock_actual`.
- `stock_minimo`.
- `stock_maximo`.
- `estado_stock`.

Orden recomendado: mostrar primero productos criticos y luego ordenar por menor `stock_actual`.

## Segmentadores

Agregar segmentadores para:

- `fecha`.
- `categoria`.
- `proveedor`.
- `almacen`.
- `estado_stock`.

## Recomendaciones de diseno

- Usar color rojo solo para alertas criticas.
- Mantener fondo claro y visualizaciones alineadas.
- Evitar exceso de texto dentro del dashboard.
- Usar titulos simples y orientados a decision.
- Validar que todos los segmentadores afecten a las visualizaciones correctas.
