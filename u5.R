# Crear tres vectores de 4 elementos cada uno
nombre <- c("Ana", "Luis", "Elena", "Carlos")  # Caracteres
edad <- c(28, 35, 22, 41)                       # Números
es_activo <- c(TRUE, TRUE, FALSE, TRUE)         # Valores Lógicos

# Combinar los vectores en un data frame
data_frame_2d <- data.frame(Nombre = nombre, 
                            Edad = edad, 
                            Activo = es_activo)