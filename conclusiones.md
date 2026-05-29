# Conclusiones del analisis

Este documento resume los hallazgos esperados del proyecto de inventario. Las conclusiones estan planteadas para explicar el analisis en una entrevista o presentacion de portafolio.

## Productos criticos

Los productos con estado `Critico` representan una alerta operativa porque su `stock_actual` es menor o igual al `stock_minimo`. Estos productos deben revisarse con prioridad, especialmente si tambien presentan ventas altas.

Un producto critico con alta demanda puede generar quiebres de stock, perdida de ventas y demoras en la atencion al cliente.

## Sobrestock

Los productos con estado `Sobrestock` superan el `stock_maximo`. Este caso puede indicar compras excesivas, baja rotacion o una planificacion de demanda poco ajustada.

El sobrestock inmoviliza capital y puede generar costos adicionales de almacenamiento, especialmente en productos de alto costo unitario.

## Categorias

El analisis por categoria permite identificar donde se concentra el mayor valor del inventario. Categorias como Computo, Moviles o Almacenamiento pueden tener mayor valor economico debido a sus costos unitarios mas altos.

Comparar valor de inventario con unidades vendidas ayuda a distinguir categorias rentables de categorias con capital inmovilizado.

## Proveedores

El analisis por proveedor permite ver que empresas concentran mayor cantidad de productos registrados. Esto ayuda a evaluar dependencia de proveedores y priorizar coordinaciones para reposicion.

Si un proveedor concentra varios productos criticos, puede ser necesario revisar tiempos de entrega, frecuencia de compra o acuerdos comerciales.

## Almacenes

El analisis por almacen permite comparar el valor de stock y detectar diferencias entre sedes. Un almacen con alto valor de inventario y baja rotacion puede requerir redistribucion de productos.

Tambien permite identificar almacenes con mayor presencia de productos criticos y priorizar acciones logisticas.

## Oportunidades de mejora

- Definir politicas de reposicion por categoria y proveedor.
- Revisar periodicamente productos criticos con alta demanda.
- Reducir compras de productos con sobrestock y baja rotacion.
- Analizar tiempos de entrega de proveedores.
- Implementar alertas de stock minimo en Power BI.
- Comparar unidades vendidas contra unidades recibidas para detectar desbalances.

## Recomendaciones basicas de reposicion

- Reponer primero productos con estado `Critico` y alta cantidad de unidades vendidas.
- Priorizar productos cuyo stock actual este muy por debajo del stock minimo.
- Revisar productos en `Sobrestock` antes de generar nuevas ordenes de compra.
- Evaluar redistribucion entre almacenes antes de comprar mas unidades.
- Usar el stock maximo como referencia para calcular unidades sugeridas de reposicion.

## Conclusion final

El proyecto permite practicar un flujo completo de analisis de inventario: validacion de datos, consultas SQL, preparacion en Power Query, medidas DAX y diseno de dashboard. Aunque los datos son ficticios, la logica del analisis es aplicable a casos reales de operaciones, retail, control de gestion y mejora de procesos.
