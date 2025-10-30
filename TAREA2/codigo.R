#####
##### 1. Cargar el archivo patients.csv y explorar su estructura con head(), str() y summary().
#####
ruta_archivo <- file.choose()
datos_pacientes <- read.csv(ruta_archivo)

# numero de registros (nrow)
print(paste("Archivo cargado con éxito. Total de observaciones:", nrow(datos_pacientes)))
  
# visualizar las primeras 6 filas (head)
print("Primeras 6 Filas:") 
head(datos_pacientes)
  
# resumen de la estructura (str)
print("Estructura del Data Frame:")
str(datos_pacientes)
  
# resumen estadístico (summary)
print("Resumen Estadístico:")
summary(datos_pacientes)
  
  
#####
#####  2. Seleccionar las columnas numéricas más relevantes.
#####

# definir un vector con los nombres de las columnas numéricas relevantes
columnas_numericas <- c("age", "bmi", "systolic_bp", "diastolic_bp", 
                          "glucose", "cholesterol", "steps_per_day")

# crear un nuevo data frame (df) con solo estas columnas
columnas_actuales <- columnas_numericas[columnas_numericas %in% names(datos_pacientes)]
print(columnas_actuales)
datos_numericos <- datos_pacientes[, columnas_actuales]
head(datos_numericos)


#####
#####  3. Cambiar todos los títulos al español 
#####

nombres_espanol <- c("edad", "imc", "tension_sistolica", "tension_diastolica",
                            "glucosa", "colesterol", "pasos_dia")

# Paso 3: Asignar el nuevo vector de nombres a colnames()
# Esto sobrescribe los nombres existentes.
colnames(columnas_actuales) <- nombres_espanol[1:length(columnas_actuales)]
print(names())















# ---
# 4. Crear columna categórica bmi_cat según rangos de IMC

# Verificar si la columna 'bmi' existe en datos_numericos
if ("bmi" %in% names(datos_numericos)) {
  
  # Crear la columna bmi_cat usando cut() o ifelse()
  datos_numericos$bmi_cat <- cut(
    datos_numericos$bmi,
    breaks = c(0, 18.5, 25, 30, Inf),
    labels = c("Bajo peso", "Normal", "Sobrepeso", "Obesidad"),
    include.lowest = TRUE
  )
  
  # Mostrar conteo por categoría
  cat("\n--- Distribución de Categorías de IMC ---\n")
  print(table(datos_numericos$bmi_cat))
  
} else {
  cat("\nAdvertencia: La columna 'bmi' no está disponible para crear la categoría.\n")
}

# 6.1 Histograma de glucosa
if ("glucose" %in% names(datos_pacientes)) {
  hist(datos_pacientes$glucose,
       main = "Distribución de Niveles de Glucosa",
       xlab = "Glucosa (mg/dL)",
       ylab = "Frecuencia",
       col = "lightblue",
       border = "black",
       breaks = 20,
       na.rm = TRUE)  # na.rm dentro de hist() no es necesario; se maneja con los datos
} else {
  cat("Advertencia: columna 'glucose' no encontrada.\n")
}

# 6.2 Diagrama de barras: frecuencia de diagnósticos
if ("diagnosis" %in% names(datos_pacientes)) {
  freq_diag <- table(datos_pacientes$diagnosis)
  
  barplot(freq_diag,
          main = "Frecuencia de Diagnósticos",
          xlab = "Diagnóstico",
          ylab = "Frecuencia",
          col = "lightcoral",
          las = 2,
          border = "black")
  
  # Añadir valores sobre las barras
  text(x = seq_along(freq_diag), 
       y = freq_diag + max(freq_diag) * 0.02,
       labels = freq_diag, 
       pos = 3, cex = 0.8)
} else {
  cat("Advertencia: columna 'diagnosis' no encontrada.\n")
}

# 6.3 Diagrama de barras: diagnósticos por sexo (barras agrupadas)
if (all(c("diagnosis", "sex") %in% names(datos_pacientes))) {
  tabla_sexo_diag <- table(datos_pacientes$diagnosis, datos_pacientes$sex)
  
  barplot(tabla_sexo_diag,
          main = "Diagnósticos por Sexo",
          xlab = "Diagnóstico",
          ylab = "Frecuencia",
          col = c("pink", "lightblue"),  # F = pink, M = lightblue
          beside = TRUE,
          las = 2)
  
  legend("topright",
         legend = c("Femenino", "Masculino"),
         fill = c("pink", "lightblue"),
         title = "Sexo")
} else {
  cat("Advertencia: faltan columnas 'diagnosis' o 'sex'.\n")
}

# 7. Guardar fumadores mayores de 50 años en un nuevo archivo CSV

# Filtrar los pacientes que son fumadores ("Yes") y tienen más de 50 años
fumadores_mayores50 <- datos_pacientes[datos_pacientes$smoker == "Yes" & datos_pacientes$age > 50, ]

# Ver cuántos se encontraron (opcional)
cat("Número de fumadores mayores de 50 años:", nrow(fumadores_mayores50), "\n")

# Guardar en un nuevo archivo CSV
write.csv(fumadores_mayores50, 
          file = "fumadores_mayores_50.csv", 
          row.names = FALSE)  # evita guardar el índice como columna

cat("Archivo 'fumadores_mayores_50.csv' guardado con éxito.\n")