# PASO 1: CREACIÓN INICIAL DE LA LISTA
nombre_curso <- "Ciencia de datos"
anio_curso <- 2025
modulos_simples <- c("Fundamentos", "Analisis", "Modelos") 

curso <- list(
  nombre = nombre_curso,
  anio = anio_curso,
  modulos = modulos_simples
)
print(">>> LISTA DE MODULOS DEL CURSO")
print(curso)


# PASO 2: CREACIÓN DE LOS MÓDULOS COMO SUBLISTAS
# Módulo 1 (Sublista)
modulo1 <- list(
  titulo = "Fundamentos",
  horas = 40,
  temario = c("Intro", "Vectores", "Matrices", "Data Frames")
)
# Módulo 2 (Sublista)
modulo2 <- list(
  titulo = "Analisis",
  horas = 60,
  temario = c("Estadística Descriptiva", "Visualización", "Limpieza de Datos")
)
# Módulo 3 (Sublista)
modulo3 <- list(
  titulo = "Modelos",
  horas = 50,
  temario = c("Regresión Lineal", "Clasificación", "Validación Cruzada")
)

# Creamos la lista
curso[['modulos']] <- list(modulo1, modulo2, modulo3) 

print(">>> LISTA DE ASIGNATURAS POR MODULO")
print(curso)


# PASO 3: Acceso al segundo módulo (índice 2) y luego a su elemento 'titulo'
titulo_segundo_modulo <- curso[['modulos']][[2]][['titulo']]
prueba <- curso[['modulos']][[2]][[1]]
prueba1 <- curso$modulo[[2]]$titulo
prueba2 <- curso$modulo[[2]][[1]]
print(">>> TITULO DEL SEGUNDO MODULO")
print(titulo_segundo_modulo)
print(prueba)
print(prueba1)
print(prueba2)



# PASO 4: Muestra el número total de módulos con length()
numero_modulos <- length(curso[['modulos']])
print(">>> NÚMERO TOTAL DE MÓDULOS")
print(numero_modulos)


# PASO 5: Muestra los nombres de los elementos principales de la lista con names()
nombres_elementos <- names(curso)
print(">>> NOMBRES DE LOS ELEMENTOS PRINCIPALES DE LA LISTA 'curso'")
print(nombres_elementos)


# PASO 6: Añade un cuarto módulo a la lista.

# a) Crea el Módulo 4 (Sublista)
modulo4 <- list(
  titulo = "Tesis y Proyecto",
  horas = 70,
  temario = c("Definición de Problema", "Recolección de Datos", "Presentación Final")
)

# b) Agrega el nuevo módulo a la lista de módulos existente (curso[['modulos']])
# Opción 1: Usando c() para concatenar (recomendada)
curso[['modulos']] <- c(curso[['modulos']], list(modulo4))
#curso$modulos$modulo4 <- modulo4

# Opción 2: Asignando directamente a la siguiente posición
# curso[['modulos']][[4]] <- modulo4

print(">>> LISTA DE MODULOS DEL CURSO CON EL CUARTO MODULO")
print(curso)


# PASO 7: Incrementa las horas del primer módulo en +2.

# Accede a las horas del primer módulo (índice 1) y suma 2
curso[['modulos']][[1]][['horas']] <- curso[['modulos']][[1]][['horas']] + 2

# Muestra solo el primer módulo para verificar el cambio
print(">>> PRIMER MÓDULO CON HORAS ACTUALIZADAS")
print(curso[['modulos']][[1]])



# PASO 8: Calcula un vector con las horas de cada módulo y el total

# 1. Extraer las horas de cada módulo
# Usamos sapply para aplicar la función de extracción (['horas']) a cada elemento
# de la lista de módulos (curso[['modulos']]).
horas_modulos <- sapply(curso[['modulos']], "[[", "horas")

# 2. Calcular el total de horas
total_horas <- sum(horas_modulos)

# 3. Combinar ambos resultados en un solo vector
# Primero, nombramos las horas individuales para claridad
names(horas_modulos) <- sapply(curso[['modulos']], "[[", "titulo")

# Luego, creamos el vector final
vector_horas_final <- c(horas_modulos, Total = total_horas)

print(">>> VECTOR DE HORAS POR MÓDULO Y TOTAL")
print(vector_horas_final)




# PASO 9: Crea un data.frame resumen con las columnas: modulo, titulo, horas, n_temas.

# 1. Extracción de Títulos
titulos <- sapply(curso[['modulos']], "[[", "titulo")

# 2. Extracción de Horas
horas <- sapply(curso[['modulos']], "[[", "horas")

# 3. Cálculo del número de temas (n_temas)
# Aplicamos la función length() al vector 'temario' de cada módulo
n_temas <- sapply(curso[['modulos']], function(m) {
  length(m[['temario']])
})

# 4. Creación de la columna de índice
modulo_index <- 1:length(curso[['modulos']])

# 5. Combinar todo en un data.frame
resumen_curso <- data.frame(
  modulo = modulo_index,
  titulo = titulos,
  horas = horas,
  n_temas = n_temas
)

print(">>> DATA.FRAME RESUMEN DEL CURSO")
print(resumen_curso)



# PASO 10: Elimina el módulo 3 de la lista.

# Usamos el índice negativo [-3] para eliminar el tercer elemento
curso[['modulos']] <- curso[['modulos']][-3]

print(">>> LISTA DE MÓDULOS DESPUÉS DE LA ELIMINACIÓN")
print(curso[['modulos']])





# PASO 11: Muestra la estructura final con str(curso)
print(">>> ESTRUCTURA FINAL DE LA LISTA 'curso'")
str(curso)



