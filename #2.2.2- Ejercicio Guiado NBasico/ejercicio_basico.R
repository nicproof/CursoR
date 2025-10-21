# ejercicio_basico.R
# ---------------------------------------
# Objetivo (versión básica):
# - Leer el archivo Excel existente: "ventas_ejercicio.xlsx"
# - Unir sus hojas (Enero, Febrero, Marzo) en una sola tabla
# - Limpiar nombres de columnas
# - Calcular ventas = unidades * precio
# - Crear:
#     1) Resumen por categoria (ventas_total, unidades_media)
#     2) Top 5 productos por ventas_total
# - Exportar un Excel simple "reporte_basico.xlsx" con dos hojas:
#     - "Resumen"
#     - "TopProductos"
#
# Dependencias: readxl, dplyr, janitor, writexl

suppressPackageStartupMessages({
  library(readxl)
  library(dplyr)
  library(janitor)
  library(writexl)
})

# 1) Verificar archivo de entrada
archivo <- "C:\\Users\\Alumno\\Curso_R\\#2.2.2- Ejercicio Guiado NBasico\\ventas_ejercicio.xlsx"
if (!file.exists(archivo)) {
  stop("No se encontró 'ventas_ejercicio.xlsx' en el directorio actual: ", getwd())
}

# 2) Leer y unir todas las hojas
hojas <- excel_sheets(archivo)

# lapply para mantenerlo sencillo (en lugar de purrr::map)
listas <- lapply(hojas, function(sh) read_excel(archivo, sheet = sh))
todas <- dplyr::bind_rows(listas, .id = ".indice_hoja")
# (opcional) agregar el nombre de la hoja real
todas$.hoja <- hojas[as.integer(todas$.indice_hoja)]

# 3) Limpiar nombres y calcular ventas
todas <- todas |>
  clean_names() |>
  mutate(
    fecha    = as.Date(fecha),
    unidades = as.numeric(unidades),
    precio   = as.numeric(precio),
    ventas   = unidades * precio
  )

# 4) Resumen por categoria
resumen <- todas |>
  group_by(categoria) |>
  summarise(
    ventas_total   = sum(ventas, na.rm = TRUE),
    unidades_media = mean(unidades, na.rm = TRUE),
    .groups = "drop"
  ) |>
  arrange(desc(ventas_total))

# 5) Top 5 productos por ventas
top_productos <- todas |>
  group_by(producto) |>
  summarise(ventas_total = sum(ventas, na.rm = TRUE), .groups = "drop") |>
  arrange(desc(ventas_total)) |>
  slice_head(n = 5)

# 6) Exportar un Excel MUY simple (sin estilos, sin gráficos)
#    writexl escribe una lista de data frames como múltiples hojas
salida <- "reporte_basico.xlsx"
writexl::write_xlsx(
  list(Resumen = resumen, TopProductos = top_productos),
  path = salida
)

message("Listo. Archivo generado: ", salida)
