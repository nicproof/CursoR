library(ggplot2)
library(dplyr) # Para usar la función pipe %>% y mutate

# 1. Preparación de datos y manejo de NA
# Creamos un nuevo dataframe sin valores NA en Ozone
data_limpia <- airquality %>%
  na.omit() 

# 2. Creación del histograma moderno con capa de densidad
ggplot(data = data_limpia, aes(x = Ozone)) +
  
  # a. Histograma: Color de relleno moderno y semitransparente
  geom_histogram(aes(y = after_stat(density)), # Normaliza la altura a densidad para la superposición
                 binwidth = 10,                 # Ancho de las barras
                 fill = "#00A693",             # Relleno color Teal moderno
                 color = "#005E54",             # Contorno color Dark Teal
                 alpha = 0.6) +                 # Transparencia
  
  # b. Curva de Densidad: Línea suave para la distribución
  geom_density(color = "red",              # Línea naranja brillante
               linewidth = 1) +                 # Grosor de línea
  
  # c. Personalización de Títulos y Ejes
  labs(
    title = "Distribución de los niveles de Ozono (Ozone)",
    subtitle = "Histograma con curva de densidad superpuesta (airquality)",
    x = "Niveles de Ozono (ppb)",
    y = "Densidad"
  ) +
  
  # d. Tema Moderno y Limpio
  theme_minimal() + 
  theme(
    plot.title = element_text(face = "bold", color = "#333333"),
    plot.subtitle = element_text(color = "#666666"),
    axis.title = element_text(face = "bold"),
    panel.grid.minor = element_blank() # Elimina líneas de rejilla menores
  )
