# 1. Importar y Preparar el Dataset
# NOTA: Ejecuta esta línea para abrir la ventana de selección de archivos
bebidas_wide <- read.csv(file.choose(), header = TRUE) 

# Renombrar la columna del grupo de edad para facilitar el uso
colnames(bebidas_wide)[1] <- "GrupoEdad"

# Convertir el data frame de preferencias (quitando la columna GrupoEdad) a una matriz 
# (formato requerido por barplot para barras agrupadas/apiladas)
preferencias_matriz <- as.matrix(bebidas_wide[, -1])

# Asignar los nombres de las columnas (Bebida) y las filas (GrupoEdad)
rownames(preferencias_matriz) <- bebidas_wide$GrupoEdad
colnames(preferencias_matriz) <- c("Café", "Té", "Refresco")


# 2. Calcular la Matriz de Proporciones para el Gráfico Apilado
# Se divide cada preferencia por el total de su respectiva fila (GrupoEdad)
totales_por_grupo <- rowSums(preferencias_matriz)
proporciones_matriz <- sweep(preferencias_matriz, 1, totales_por_grupo, FUN = "/")

# -------------------------------------------------------------------------
## 3. Configuración Gráfica y Dibujo de Gráficos Lado a Lado
# -------------------------------------------------------------------------

# Colores consistentes: Café, Té, Refresco
colores_bebidas <- c("#6F4E37", "#38761D", "#FF7F00")

# 3a. Configurar la ventana gráfica (1 fila, 2 columnas)
# Esto asegura que ambos gráficos salgan en la misma pantalla.
par(mfrow = c(1, 2), mar = c(7, 4, 4, 2) + 0.1) # Mar: ajusta márgenes para etiquetas X largas

# --- GRÁFICO 1: BARRAS AGRUPADAS (Lado a Lado) ---

barras_agrupadas <- barplot(preferencias_matriz, 
                            beside = TRUE, # ¡Clave para barras agrupadas!
                            col = colores_bebidas,
                            main = "1. Preferencias por Grupo de Edad (Agrupadas)",
                            ylab = "Número de Personas (Preferencia)",
                            xlab = "", # Se usa 'names.arg' para la etiqueta del eje X
                            ylim = c(0, max(preferencias_matriz) + 5),
                            border = NA)

# Leyenda (se coloca en la esquina superior derecha, pero fuera del gráfico)
legend("topright", 
       legend = rownames(preferencias_matriz), 
       fill = grey.colors(nrow(preferencias_matriz)), 
       title = "Grupo de Edad", 
       bty = "n", 
       cex = 0.8)

# Leyenda para las bebidas (dentro del gráfico, abajo a la derecha)
legend("topleft", 
       legend = colnames(preferencias_matriz), 
       fill = colores_bebidas, 
       title = "Bebida", 
       bty = "n", 
       cex = 0.8)

# Etiquetas del eje X (GrupoEdad)
axis(side = 1, 
     at = colMeans(barras_agrupadas), # Centra la etiqueta en cada grupo
     labels = rownames(preferencias_matriz), 
     las = 2, # Rotar etiquetas
     cex.axis = 0.8) 

# --- GRÁFICO 2: BARRAS APILADAS PROPORCIONALES ---

barplot(proporciones_matriz,
        col = colores_bebidas,
        main = "2. Distribución de Bebidas (Apiladas Proporcionales)",
        ylab = "Proporción (0.0 a 1.0)",
        xlab = "Grupo de Edad",
        ylim = c(0, 1.05),
        border = NA,
        names.arg = rownames(proporciones_matriz)) # Etiquetas X directas

# Leyenda (Se usa la misma leyenda de bebidas, pero se coloca a la derecha del segundo gráfico)
legend("topright", 
       legend = colnames(proporciones_matriz), 
       fill = colores_bebidas, 
       title = "Bebida", 
       bty = "n", 
       cex = 0.8)

# 4. Restaurar la configuración gráfica original
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2) + 0.1)