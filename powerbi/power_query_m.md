# Preparacion de datos en Power Query

Esta guia muestra los pasos recomendados para limpiar y preparar `data/inventario.csv` antes de construir el dashboard en Power BI.

## 1. Verificar tipos de datos

Tipos recomendados:

- `id_registro`: numero entero.
- `fecha`: fecha.
- `producto`, `categoria`, `proveedor`, `almacen`, `estado_stock`: texto.
- `stock_actual`, `stock_minimo`, `stock_maximo`, `unidades_vendidas`, `unidades_recibidas`: numero entero.
- `costo_unitario`, `precio_venta`, `valor_stock`: numero decimal.

```powerquery
#"Tipo cambiado" = Table.TransformColumnTypes(
    Source,
    {
        {"id_registro", Int64.Type},
        {"fecha", type date},
        {"producto", type text},
        {"categoria", type text},
        {"proveedor", type text},
        {"almacen", type text},
        {"stock_actual", Int64.Type},
        {"stock_minimo", Int64.Type},
        {"stock_maximo", Int64.Type},
        {"unidades_vendidas", Int64.Type},
        {"unidades_recibidas", Int64.Type},
        {"costo_unitario", type number},
        {"precio_venta", type number},
        {"valor_stock", type number},
        {"estado_stock", type text}
    }
)
```

## 2. Convertir fecha a tipo fecha

Si `fecha` se importa como texto, cambiarla manualmente a tipo `Fecha`.

```powerquery
#"Fecha convertida" = Table.TransformColumnTypes(#"Tipo cambiado", {{"fecha", type date}})
```

## 3. Validar columnas numericas

Revisar que las columnas de stock, unidades y valores no tengan errores o textos mezclados.

## 4. Revisar valores nulos

Usar los filtros de Power Query para revisar valores vacios o `null`. Si aparecen, validar si corresponde reemplazarlos, corregirlos o excluirlos.

## 5. Quitar duplicados si existieran

```powerquery
#"Duplicados quitados" = Table.Distinct(#"Fecha convertida", {"id_registro"})
```

## 6. Crear columna de anio

```powerquery
#"Anio agregado" = Table.AddColumn(#"Duplicados quitados", "anio", each Date.Year([fecha]), Int64.Type)
```

## 7. Crear columna de mes

```powerquery
#"Mes agregado" = Table.AddColumn(#"Anio agregado", "mes", each Date.Month([fecha]), Int64.Type)
```

## 8. Crear columna nombre_mes

```powerquery
#"Nombre mes agregado" = Table.AddColumn(#"Mes agregado", "nombre_mes", each Date.MonthName([fecha], "es-ES"), type text)
```

## 9. Crear columna anio_mes

```powerquery
#"Anio mes agregado" = Table.AddColumn(
    #"Nombre mes agregado",
    "anio_mes",
    each Date.ToText([fecha], "yyyy-MM"),
    type text
)
```

## 10. Validar coherencia de estado_stock

Crear una columna auxiliar para comprobar si el estado coincide con los niveles de stock.

```powerquery
#"Estado validado" = Table.AddColumn(
    #"Anio mes agregado",
    "estado_validado",
    each
        if [stock_actual] <= [stock_minimo] then "Critico"
        else if [stock_actual] > [stock_maximo] then "Sobrestock"
        else "Normal",
    type text
)
```

Despues, comparar `estado_validado` con `estado_stock`.

## 11. Crear columna de margen unitario

```powerquery
#"Margen agregado" = Table.AddColumn(
    #"Estado validado",
    "margen_unitario",
    each [precio_venta] - [costo_unitario],
    type number
)
```

## 12. Crear columna de ventas estimadas

```powerquery
#"Ventas estimadas agregadas" = Table.AddColumn(
    #"Margen agregado",
    "ventas_estimadas",
    each [unidades_vendidas] * [precio_venta],
    type number
)
```

## 13. Aplicar cambios

Al terminar la preparacion, seleccionar `Cerrar y aplicar` para cargar el modelo en Power BI Desktop.
