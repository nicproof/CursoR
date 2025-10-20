# =======================================================
# 1. & 2. CREACIÓN DE LA LISTA ANIDADA 'curso'
# =======================================================

# 2. Definición de los Módulos (Sublistas)
modulo1 <- list(
  titulo = "Fundamentos de R",
  horas = 40,
  temario = c("Intro", "Vectores", "Matrices", "Data Frames")
)

modulo2 <- list(
  titulo = "Análisis Exploratorio de Datos",
  horas = 60,
  temario = c("Estadística Descriptiva", "Visualización", "Limpieza de Datos")
)

modulo3 <- list(
  titulo = "Modelos Predictivos",
  horas = 50,
  temario = c("Regresión Lineal", "Clasificación", "Validación Cruzada")
)

# 1. Creación de la Lista Principal 'curso'
curso <- list(
  nombre = "Data Science Aplicada",
  anio = 2025,
  modulos = list(modulo1, modulo2, modulo3)
)

print("--- 1. Lista 'curso' creada ---")
print(curso)


# =======================================================
# 3. ACCESO, 4. LONGITUD, Y 5. NOMBRES
# =======================================================

# 3. Acceder al título del segundo módulo usando [[ ]]
titulo_m2 <- curso[['modulos']][[2]][['titulo']]
print("--- 3. Título del Módulo 2 ---")
print(titulo_m2)

# 4. Mostrar el número total de módulos con length()
num_modulos <- length(curso[['modulos']])
print("--- 4. Número total de módulos ---")
print(num_modulos)

# 5. Mostrar los nombres de los elementos principales de la lista
nombres_elementos <- names(curso)
print("--- 5. Nombres de los elementos principales ---")
print(nombres_elementos)


# =======================================================
# 6. & 7. MODIFICACIÓN DE LA LISTA
# =======================================================

# 6. Añade un cuarto módulo a la lista
modulo4 <- list(
  titulo = "Despliegue y Mantenimiento",
  horas = 35,
  temario = c("APIs", "Contenedores", "Monitoreo")
)

curso[['modulos']][[4]] <- modulo4
print("--- 6. Módulo 4 añadido. Total de módulos ahora: ---")
print(length(curso[['modulos']]))


# 7. Incrementa las horas del primer módulo en +2
curso[['modulos']][[1]][['horas']] <- curso[['modulos']][[1]][['horas']] + 2
print("--- 7. Horas del Módulo 1 incrementadas ---")
print(curso[['modulos']][[1]][['horas']])


# =======================================================
# 8. & 9. CÁLCULO Y DATA FRAME RESUMEN
# =======================================================

# 8. Calcula un vector con las horas de cada módulo y el total.

# Extraer horas
horas_modulos <- sapply(curso[['modulos']], function(m) m[['horas']])
total_horas <- sum(horas_modulos)

vector_horas <- c(horas_modulos, Total = total_horas)
print("--- 8. Vector de Horas por Módulo y Total ---")
print(vector_horas)


# 9. Crea un data.frame resumen
df_resumen <- data.frame(
  modulo = paste0("M", 1:length(curso[['modulos']])),
  titulo = sapply(curso[['modulos']], function(m) m[['titulo']]),
  horas = horas_modulos,
  n_temas = sapply(curso[['modulos']], function(m) length(m[['temario']]))
)
print("--- 9. Data Frame Resumen ---")
print(df_resumen)


# =======================================================
# 10. & 11. ELIMINACIÓN Y ESTRUCTURA FINAL
# =======================================================

# 10. Elimina el módulo 3 de la lista (el módulo de "Modelos Predictivos")
# Nota: Ahora es el índice 3, aunque originalmente fuera el módulo 3.
curso[['modulos']][[3]] <- NULL
print("--- 10. Módulo 3 eliminado. La lista de módulos tiene esta estructura: ---")
print(curso[['modulos']])

# 11. Muestra la estructura final con str(curso)
print("--- 11. Estructura final de la lista 'curso' ---")
str(curso)