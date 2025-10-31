#####
##### 1. Cargar el archivo patients.csv 
#####
  ruta_archivo <- file.choose()
  datos_pacientes <- read.csv(ruta_archivo)

  
  
  
#####
#####  3. Cambiar todos los títulos al español 
#####
  
  # crear un vector con los nombres en español
  nombres_spa <- c("id_paciente", "sexo", "edad", "indice_masa_corporal", "fumador", "diagnostico", 
                   "tension_sistolica", "tension_diastolica","glucosa", "colesterol", "pasos_por_dia",
                   "fecha_visita")

  # asignar el nuevo vector de nombres a colnames()
  colnames(datos_pacientes) <- nombres_spa

 
   
  
#####
#####  1. Explorar su estructura con head(), str() y summary().
#####

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
  columnas_numericas <- c("edad", "indice_masa_corporal", "tension_sistolica", "tension_diastolica", 
                          "glucosa", "colesterol", "pasos_por_dia")

  # crear un nuevo data frame (df) con solo estas columnas
  columnas_actuales <- columnas_numericas[columnas_numericas %in% names(datos_pacientes)]
  print(columnas_actuales)
  datos_numericos <- datos_pacientes[, columnas_actuales]
  head(datos_numericos)


  
  
#####
#####  3. crear columna categórica bmi_cat según rangos del indice_masa_corporal
#####

  media_indice_masa_corporal <- mean(datos_pacientes$indice_masa_corporal, na.rm = TRUE)
  cat("Media del indice de la masa corporal de los pacientes:", media_indice_masa_corporal, "\n")
  
  # ¡CLAVE!: Añadir la columna bmi_cat al data frame principal (datos_pacientes)
  datos_pacientes$bmi_cat <- cut(
    datos_pacientes$indice_masa_corporal, # Usamos la columna del df principal
    breaks = c(0, 18.5, 25, 30, Inf),
    labels = c("Bajo peso", "Normal", "Sobrepeso", "Obesidad"),
    include.lowest = TRUE
  )
  
  # mostrar cantidad de pacientes por categoría
  print("Distribución de Categorías de IMC")
  # Usamos la tabla del df principal
  print(table(datos_pacientes$bmi_cat)) 
  
  # mostrar grafico de barras
  barplot(
    table(datos_pacientes$bmi_cat), # Usamos la tabla del df principal
    main = "Categorías Indice de Masa Corporal",
    xlab = "Categorías",
    ylab = "Frecuencias",
    col = "darkorange",
  )
  
  
  
  
#####
#####  4. Filtrar los pacientes fumadores mayores de 50 años y guardar el 
#####     resultado en fum_mayores50.
#####
  
  # filtrar los pacientes que son fumadores ("Yes") y tienen más de 50 años
  fumadores_mayores50 <- datos_pacientes[datos_pacientes$fumador == "Yes" & 
                           datos_pacientes$edad > 50, ]
  
  # ver cuántos se encontraron (opcional)
  cat("Número de fumadores mayores de 50 años:", nrow(fumadores_mayores50), "\n")

  

#####
#####  5. Calcular media de glucose y cholesterol.
#####

  # media y histograma de glucosa
  cat("Media de la glucosa de los pacientes:", mean(datos_pacientes$glucosa))
  hist(datos_pacientes$glucosa,
       main = "Distribución de Niveles de Glucosa",
       xlab = "Glucosa (mg/dL)",
       ylab = "Frecuencia",
       col = "darkorange",
       border = "black",
       breaks = 20,
       na.rm = TRUE) 

  # media y histograma de colesterol
  cat("Media de la glucosa de los pacientes:", mean(datos_pacientes$colesterol))
  hist(datos_pacientes$colesterol,
       main = "Distribución de Niveles de Colesterol",
       xlab = "Colesterol (mg/dL)",
       ylab = "Frecuencia",
       col = "darkorange",
       border = "black",
       breaks = 20,
       na.rm = TRUE)   
 
   
  
#####
#####  6. Representar gráficamente:
#####
  
  ###
  ### gráfico de frecuencia de diagnósticos
  ###
  
  # ajustar los márgenes del gráfico
  par(mar = c(8, 4, 4, 2) + 0.1)
  
  # crear el gráfico de barras
  freq_diag <- table(datos_pacientes$diagnostico)
  barra_pos <- barplot(
    freq_diag,
    main = "Frecuencia de Diagnósticos",
    xlab = "", # Dejamos el xlab vacío si lo vas a poner en la parte inferior
    ylab = "Frecuencia",
    col = "darkorange",
    border = "black",
    xaxt = "n" 
  )
  
  # agregar las etiquetas del eje X con ángulo, para una mejor visualización
  text(
    x = barra_pos,
    y = -0.5,
    labels = names(freq_diag),
    xpd = TRUE,
    srt = 30,
    adj = 1 
  )
  
  # restaurar los márgenes por defecto
  par(mar = c(5, 4, 4, 2) + 0.1)
  
  
  ###
  ### gráfico diagnósticos por sexo
  ###
  
  # crear un nuevo data frame temporal que solo contenga las dos variables
  datos_temp <- data.frame(
    diagnostico = datos_pacientes$diagnostico,
    sexo = datos_pacientes$sexo
  )
  
  # garantizar tener columnas de igual longitud.
  datos_limpios <- na.omit(datos_temp)
  
  
  # crear la tabla y el gráfico
  tabla_sexo_diag <- table(datos_limpios$diagnostico, datos_limpios$sexo)
  
  # ajustar los márgenes del gráfico
  par(mar = c(8, 4, 4, 2) + 0.1)
  
  # crear el gráfico de barras agrupado
  barplot(tabla_sexo_diag,
          main = "Frecuencia de Diagnósticos por Sexo",
          xlab = "Diagnóstico",
          ylab = "Frecuencia",
          col = c("pink", "lightblue"),
          beside = TRUE,
          las = 2)
  
  # agregar la leyenda
  legend("topright",
         legend = colnames(tabla_sexo_diag), # Usar los nombres de las columnas de la tabla (sexo)
         fill = c("pink", "lightblue"),
         title = "Sexo")
  
  # restaurar los márgenes por defecto
  par(mar = c(5, 4, 4, 2) + 0.1)

  

#####
#####  7. Guardar los fumadores mayores de 50 años en un nuevo archivo CSV.
#####

  # Guardar en un nuevo archivo CSV
  write.csv(fumadores_mayores50, 
          file = "! JCDA_Fumadores_mayores_50.csv", 
          row.names = FALSE)  # evita guardar el índice como columna

  cat("Archivo 'fumadores_mayores_50.csv' guardado con éxito.\n")

  
  
    
#####
#####  EXTRA. exportar todos los gráficos a PNG 
#####

  # preparación Gráfico 01: Distribución IMC
  data_plot01 <- table(datos_pacientes$bmi_cat) 
  
  # Imprimir la tabla para diagnóstico
  print("Contenido de data_plot01 antes de graficar:")
  print(data_plot01)
  
  # gráfico 01: distribución IMC
  png("! JCDA_01_Distribucion_IMC.png", width = 800, height = 600, res = 100)
  barplot(
    data_plot01, 
    main = "Categorías Indice de Masa Corporal",
    xlab = "Categorías",
    ylab = "Frecuencias",
    col = "darkorange",
  )
    dev.off()
    cat("Gráfico '01_Distribucion_IMC.png' guardado con éxito.\n")
  
  
  # gráfico 02: histograma glucosa
  png("! JCDA_02_Distribucion_Glucosa.png", width = 800, height = 600, res = 100)
  hist(datos_pacientes$glucosa,
       main = "Distribución de Niveles de Glucosa",
       xlab = "Glucosa (mg/dL)",
       ylab = "Frecuencia",
       col = "darkorange",
       border = "black",
       breaks = 20,
       na.rm = TRUE) 
  dev.off()
  cat("Gráfico '02_Distribucion_Glucosa.png' guardado con éxito.\n")
  
  
  # gráfico 03: histograma colesterol
  png("! JCDA_03_Distribucion_Colesterol.png", width = 800, height = 600, res = 100)
  hist(datos_pacientes$colesterol,
       main = "Distribución de Niveles de Colesterol",
       xlab = "Colesterol (mg/dL)",
       ylab = "Frecuencia",
       col = "darkorange",
       border = "black",
       breaks = 20,
       na.rm = TRUE) 
  dev.off()
  cat("Gráfico '03_Distribucion_Colesterol.png' guardado con éxito.\n")
  
  
  # gráfico 04: frecuencia de diagnósticos
  png("! JCDA_04_Frecuencia_Diagnosticos.png", width = 800, height = 600, res = 100)
    
    # Ajustar los márgenes
    par(mar = c(8, 4, 4, 2) + 0.1)
    barra_pos <- barplot(
      freq_diag,
      main = "Frecuencia de Diagnósticos",
      xlab = "", 
      ylab = "Frecuencia",
      col = "darkorange",
      border = "black",
      xaxt = "n" 
    )
    
    # Agregar las etiquetas del eje X con ángulo de 30º
    text(
      x = barra_pos,
      y = -0.5,
      labels = names(freq_diag),
      xpd = TRUE,
      srt = 30, 
      adj = 1
    )
    
    # Restaurar los márgenes del dispositivo después de dibujar
    par(mar = c(5, 4, 4, 2) + 0.1)
    
    dev.off()
    cat("Gráfico '04_Frecuencia_Diagnosticos.png' guardado con éxito.\n")
  
  
  # gráfico 05: diagnósticos por Sexo (Agrupado)
  png("! JCDA_05_Diagnosticos_por_Sexo.png", width = 800, height = 600, res = 100)
    
    # Ajustar los márgenes DE ESTE GRÁFICO ESPECÍFICO
    par(mar = c(8, 4, 4, 2) + 0.1)
    
    # crear el gráfico de barras agrupado
    barplot(tabla_sexo_diag,
            main = "Frecuencia de Diagnósticos por Sexo",
            xlab = "Diagnóstico",
            ylab = "Frecuencia",
            col = c("pink", "lightblue"),
            beside = TRUE,
            las = 2) # Etiquetas a 90 grados
    
    # agregar la leyenda
    legend("topright",
           legend = colnames(tabla_sexo_diag), # Los nombres de las columnas son F y M
           fill = c("pink", "lightblue"),
           title = "Sexo")
    
    # Restaurar los márgenes del dispositivo después de dibujar
    par(mar = c(5, 4, 4, 2) + 0.1)
    
    dev.off()
    cat("Gráfico '05_Diagnosticos_por_Sexo.png' guardado con éxito.\n")
  