# Medidas DAX para Power BI

Estas medidas estan listas para copiar y pegar en Power BI Desktop. Se asume que la tabla importada se llama `inventario`.

## Stock Total

```DAX
Stock Total = SUM(inventario[stock_actual])
```

Mide la cantidad total de unidades disponibles en inventario.

## Valor Total de Inventario

```DAX
Valor Total de Inventario = SUM(inventario[valor_stock])
```

Calcula el valor economico total del stock disponible.

## Unidades Vendidas

```DAX
Unidades Vendidas = SUM(inventario[unidades_vendidas])
```

Muestra el total de unidades vendidas en el periodo analizado.

## Unidades Recibidas

```DAX
Unidades Recibidas = SUM(inventario[unidades_recibidas])
```

Indica cuantas unidades ingresaron al inventario.

## Productos Criticos

```DAX
Productos Criticos =
CALCULATE(
    COUNTROWS(inventario),
    inventario[estado_stock] = "Critico"
)
```

Cuenta los registros donde el stock esta en nivel critico.

## Productos en Sobrestock

```DAX
Productos en Sobrestock =
CALCULATE(
    COUNTROWS(inventario),
    inventario[estado_stock] = "Sobrestock"
)
```

Cuenta los registros con inventario por encima del stock maximo.

## Productos Normales

```DAX
Productos Normales =
CALCULATE(
    COUNTROWS(inventario),
    inventario[estado_stock] = "Normal"
)
```

Cuenta los registros con inventario dentro del rango esperado.

## Costo Promedio

```DAX
Costo Promedio = AVERAGE(inventario[costo_unitario])
```

Calcula el costo unitario promedio de los productos.

## Precio Promedio de Venta

```DAX
Precio Promedio de Venta = AVERAGE(inventario[precio_venta])
```

Calcula el precio de venta promedio.

## Margen Unitario Promedio

```DAX
Margen Unitario Promedio =
AVERAGEX(
    inventario,
    inventario[precio_venta] - inventario[costo_unitario]
)
```

Mide el margen promedio por unidad vendida.

## Rotacion de Inventario

```DAX
Rotacion de Inventario =
DIVIDE([Unidades Vendidas], AVERAGE(inventario[stock_actual]))
```

Estima la rotacion comparando unidades vendidas contra stock promedio.

## Porcentaje de Productos Criticos

```DAX
Porcentaje de Productos Criticos =
DIVIDE([Productos Criticos], COUNTROWS(inventario))
```

Indica que porcentaje de registros se encuentra en estado critico.

## Valor Promedio de Stock

```DAX
Valor Promedio de Stock = AVERAGE(inventario[valor_stock])
```

Calcula el valor promedio del stock por registro.

## Ventas Estimadas

```DAX
Ventas Estimadas =
SUMX(
    inventario,
    inventario[unidades_vendidas] * inventario[precio_venta]
)
```

Estima el ingreso generado por las unidades vendidas.

## Formato recomendado

- Valor Total de Inventario, Costo Promedio, Precio Promedio de Venta, Margen Unitario Promedio, Valor Promedio de Stock y Ventas Estimadas: moneda.
- Porcentaje de Productos Criticos: porcentaje.
- Stock Total, Unidades Vendidas, Unidades Recibidas y conteos: numero entero.
