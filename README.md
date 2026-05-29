# Analisis de Inventario con Power BI

Proyecto de portafolio enfocado en Data Analytics, Business Intelligence, Sistemas, Control de Gestion, Operaciones y Mejora de Procesos. El objetivo es analizar informacion de inventario para identificar productos con stock critico, sobrestock, valor inmovilizado, rotacion y necesidades de reposicion.

## Descripcion general

Este repositorio contiene un dataset ficticio de inventario, scripts SQL compatibles con MySQL y documentacion para construir un dashboard en Power BI Desktop. El proyecto simula un caso comun en una empresa comercial o retail: controlar niveles de stock, revisar la demanda de productos y apoyar decisiones de reposicion.

El archivo `.pbix` no esta incluido porque debe construirse manualmente en Power BI Desktop.

## Objetivo del proyecto

Analizar el estado del inventario para responder preguntas como:

- Que productos tienen stock critico.
- Que productos presentan sobrestock.
- Que categorias concentran mayor valor de inventario.
- Que productos tienen mayor demanda.
- Que proveedores y almacenes concentran mas productos o valor de stock.
- Que productos requieren reposicion prioritaria.

## Herramientas utilizadas

- MySQL para modelado de tabla y consultas SQL.
- Power BI Desktop para construccion del dashboard.
- Power Query para limpieza y preparacion de datos.
- DAX para medidas e indicadores.
- CSV como fuente de datos.
- GitHub para documentar y presentar el proyecto.

## Estructura del repositorio

```text
analisis-inventario-powerbi/
├── README.md
├── conclusiones.md
├── data/
│   └── inventario.csv
├── sql/
│   ├── crear_tabla_inventario.sql
│   └── consultas_inventario.sql
├── powerbi/
│   ├── instrucciones_powerbi.md
│   ├── medidas_dax.md
│   ├── power_query_m.md
│   └── layout_dashboard.md
└── images/
    └── README.md
```

## Descripcion del dataset

El archivo `data/inventario.csv` contiene 120 registros ficticios de inventario durante el anio 2025.

Columnas principales:

- `id_registro`: identificador unico del registro.
- `fecha`: fecha del registro de inventario.
- `producto`: nombre del producto.
- `categoria`: categoria comercial.
- `proveedor`: proveedor asociado.
- `almacen`: almacen donde se encuentra el stock.
- `stock_actual`: unidades disponibles.
- `stock_minimo`: nivel minimo recomendado.
- `stock_maximo`: nivel maximo recomendado.
- `unidades_vendidas`: unidades vendidas en el periodo.
- `unidades_recibidas`: unidades recibidas o ingresadas.
- `costo_unitario`: costo de adquisicion.
- `precio_venta`: precio de venta estimado.
- `valor_stock`: valor economico del stock actual.
- `estado_stock`: clasificacion del inventario: Critico, Normal o Sobrestock.

## Analisis SQL incluido

La carpeta `sql/` contiene:

- `crear_tabla_inventario.sql`: crea la base de datos `db_inventario_portafolio`, la tabla `inventario` y explica como importar el CSV desde MySQL Workbench.
- `consultas_inventario.sql`: incluye consultas para analizar stock total, valor de inventario, productos criticos, sobrestock, productos mas vendidos, categorias, proveedores, almacenes, rotacion y resumen ejecutivo.

## Dashboard en Power BI

La carpeta `powerbi/` deja preparada la construccion manual del dashboard:

- `instrucciones_powerbi.md`: guia paso a paso para construir el `.pbix`.
- `medidas_dax.md`: medidas DAX listas para copiar y pegar.
- `power_query_m.md`: pasos de limpieza y transformacion en Power Query.
- `layout_dashboard.md`: propuesta de diseno y distribucion visual.

## Principales indicadores

- Stock Total.
- Valor Total de Inventario.
- Productos Criticos.
- Productos en Sobrestock.
- Unidades Vendidas.
- Unidades Recibidas.
- Rotacion de Inventario.
- Ventas Estimadas.
- Margen Unitario Promedio.

## Aprendizajes obtenidos

Este proyecto permite practicar:

- Generacion y validacion de datos consistentes.
- Creacion de tablas SQL para casos de inventario.
- Consultas de analisis operativo y comercial.
- Preparacion de datos con Power Query.
- Creacion de medidas DAX orientadas a gestion.
- Diseno de dashboards para toma de decisiones.
- Documentacion profesional para GitHub y entrevistas.

## Como ejecutar o revisar el proyecto

1. Revisar el dataset en `data/inventario.csv`.
2. Ejecutar `sql/crear_tabla_inventario.sql` en MySQL Workbench.
3. Importar el CSV a la tabla `inventario`.
4. Ejecutar `sql/consultas_inventario.sql` para explorar los datos.
5. Abrir Power BI Desktop.
6. Importar `data/inventario.csv`.
7. Seguir `powerbi/instrucciones_powerbi.md`.
8. Copiar las medidas desde `powerbi/medidas_dax.md`.
9. Construir el dashboard siguiendo `powerbi/layout_dashboard.md`.
10. Guardar el `.pbix` real dentro de `powerbi/`.
11. Agregar capturas reales en `images/`.

## Estado del proyecto

Proyecto preparado para analisis y construccion manual del dashboard. Incluye dataset, SQL, medidas DAX, guia de Power Query, propuesta de layout y documentacion completa.

Pendiente:

- Construir manualmente el archivo `.pbix` en Power BI Desktop.
- Agregar capturas reales del dashboard en la carpeta `images/`.

## Autor

Marcelo Loayza  
GitHub: [marceloloayza19](https://github.com/marceloloayza19)
