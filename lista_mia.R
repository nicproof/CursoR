# 1. Vectores para la Tabla Principal
codigos <- c(1, 2, 3, 4)
nombres_asignaturas <- c("Lengua", "Ingles", "Mates", "Historia")
aulas <- c(101, 202, 303, 404)

# 2. Vectores para el Contenido (Temario/Unidades)
lengua_contenido <- c("tema1L", "tema2L", "tema3L")
ingles_contenido <- c("ut1", "ut2", "ut3")
mates_contenido <- c("cal1", "cal2", "cal3")
historia_contenido <- c("h1", "h2", "h3")

# El vector con los nombres ya está creado en la sección anterior:
vector_nombres <- nombres_asignaturas
print(vector_nombres)

# 1. Unir todos los vectores de contenido en un solo vector largo
todos_contenidos <- c(lengua_contenido, ingles_contenido, mates_contenido, historia_contenido)

# 2. Crear la matriz (4 filas = asignaturas, 3 columnas = unidades)
matriz_contenidos <- matrix(
  todos_contenidos,
  nrow = 4,
  ncol = 3,
  byrow = TRUE  # Organizar por filas (cada fila es una asignatura)
)

# Asignar nombres a las filas y columnas para claridad
rownames(matriz_contenidos) <- nombres_asignaturas
colnames(matriz_contenidos) <- c("Unidad 1", "Unidad 2", "Unidad 3")

print(matriz_contenidos)


# Creamos data frame
df_asignaturas <- data.frame(
  Codigo = codigos,
  Nombre = nombres_asignaturas,
  Aula = aulas
)

print(df_asignaturas)


# Creamos lista
# Crear un vector de resumen simple para incluir en la lista
resumen_aulas <- c(max(aulas), min(aulas))
names(resumen_aulas) <- c("Aula_Mayor", "Aula_Menor")

# Crear la Lista que agrupa todos los elementos
lista_curso_completa <- list(
  # 1. El Data Frame de la tabla principal
  Tabla_Principal = df_asignaturas,
  
  # 2. La Matriz con el detalle del temario
  Matriz_Temario = matriz_contenidos,
  
  # 3. El Vector de nombres simple
  Nombres_Vector = vector_nombres,
  
  # 4. Un Vector de resumen
  Resumen_Aulas = resumen_aulas
)

print(lista_curso_completa)

