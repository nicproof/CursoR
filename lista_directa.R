lista_cursos <- list(
  # Curso 1: Análisis Exploratorio de Datos
  Curso_1 = list(
    nombre_curso = "Análisis Exploratorio de Datos",
    asignatura = "Estadística Avanzada",
    horas = 45,
    certificado = TRUE
  ),
  
  # Curso 2: Programación en Python
  Curso_2 = list(
    nombre_curso = "Introducción a Python",
    asignatura = "Programación",
    horas = 60,
    certificado = TRUE
  ),
  
  # Curso 3: Bases de Datos SQL
  Curso_3 = list(
    nombre_curso = "SQL para Data Science",
    asignatura = "Bases de Datos",
    horas = 30,
    certificado = FALSE
  )
)

# Mostrar la lista completa
print(lista_cursos)

# Acceder a un elemento específico: el nombre del Curso 2
nombre_curso_2 <- lista_cursos[['Curso_2']][['nombre_curso']]
print(paste("El nombre del segundo curso es:", nombre_curso_2))