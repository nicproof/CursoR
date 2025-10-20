library(plot3D) # Necesitas el paquete plot3D para la función hist3D()
library(dplyr)

# 1. Preparación de datos (limpiando NA)
data_limpia <- airquality %>% na.omit() 

# 2. Definir los intervalos (bins) y contar las frecuencias conjuntas
# Se crean 10 cortes para cada variable para formar la "malla"
x_cuts <- cut(data_limpia$Ozone, breaks = 10)
y_cuts <- cut(data_limpia$Temp, breaks = 10)

# La matriz Z contiene las frecuencias (la altura de las barras)
Z <- table(x_cuts, y_cuts)

# 3. Obtener las coordenadas X e Y (centros de los bins)
# Necesitamos los puntos medios de los intervalos para plot3D
get_midpoints <- function(cuts) {
  sapply(strsplit(gsub("[()]|\\[|\\]", "", cuts), ","), 
         function(x) mean(as.numeric(x)))
}

# Usar los centros de los bins como coordenadas X e Y
x <- unique(get_midpoints(levels(x_cuts)))
y <- unique(get_midpoints(levels(y_cuts)))


# 4. Generar el Histograma 3D
hist3D(
  x = x,
  y = y,
  z = Z,
  # Personalización
  col = jet.col(length(Z)), # Paleta de colores atractiva
  border = "black",
  xlab = "Ozono (ppb)",
  ylab = "Temperatura (°F)",
  zlab = "Frecuencia (Conteo)",
  main = "Histograma 3D: Ozono vs. Temperatura",
  phi = 20, # Ángulo vertical
  theta = 40, # Ángulo horizontal
  ticktype = "detailed"
)

