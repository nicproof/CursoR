
### Variables
#############

nombre <- "Monica"
edad <- 30
horas_curso <- 120

# 1. Muestra en pantalla una frase combinando las tres variables: “El curso de R de Mónica
# tiene una duración de 120 horas.”

    # frase_combinada <- paste0("El curso de R de ", nombre, " tiene una 
    #                                  duración de ", horas_curso, " horas.")
    # print(frase_combinada)

frase_combinada_sprintf <- sprintf("El curso de R de %s tiene una 
                                   duración de %d horas.", nombre, horas_curso)
print(frase_combinada_sprintf)

# 2. Incrementa horas_curso en 10 y vuelve a mostrar el valor.

# 2. Incrementa horas_curso en 10
horas_curso <- horas_curso + 10

# Muestra el nuevo valor
print(">>> Nuevo valor de horas_curso:")
print(horas_curso)





### vectores
############
notas <- c(7.5,8.2,6.9,9.1,5.8,8.0)

# 1. Calcula la nota media.
media_notas <- mean(notas)
media_notas

# 2. Muestra solo las notas mayores o iguales que 8.
notas_mayores_8 <- notas[notas>8]
notas_mayores_8

# 3. Añade una nueva nota (7.3) al final del vector.
notas_actualizadas <- c(notas,7.3)
notas_actualizadas





### dataframe
#############

alumnos <- data.frame(
  Nombre = c("Ana", "Luis", "Marta"),
  Edad = c(21, 23, 20),
  Nota = c(8.4, 6.9, 9.1)
)
# 1. Muestra la edad media de los alumnos.
edad_media <- mean(alumnos$Edad)
edad_media

# 2. Filtra los alumnos con nota superior a 8.
alumnos_mayor_8 <- alumnos[alumnos$Nota>8]
alumnos_mayor_8

# 3. Añade una nueva columna llamada Curso <- "R básico".
alumnos$Curso <- "R básico"
print("Data frame con la nueva columna 'Curso':")
print(alumnos)





### listas
##########

curso <- list(
    nombre = "Programación en R",
    horas = 40,
    modulos = c("Fundamentos", "Estructuras de datos", "Visualización"),
    activo = TRUE
  )

# 1. Accede al segundo módulo de la lista.
segundo_modulo <- curso[["modulos"]][2]
print("Segundo módulo:")
print(segundo_modulo)

# 2. Cambia el valor de horas a 45.
curso$horas <- 45
print("Lista con 'horas' actualizado:")
print(curso)


# 3. Añade un nuevo elemento nivel <- "Inicial"
curso$nivel <- "Inicial"
print("Lista con el nuevo elemento 'nivel':")
print(curso)






### matrices
############

m <- matrix(1:9, nrow = 3, ncol = 3)
print("Matriz m:")
print(m)

# 1. Muestra la suma de cada fila y de cada columna.
suma_filas <- rowSums(m)
print("Suma de cada fila:")
print(suma_filas)
suma_columnas <- colSums(m)
print("Suma de cada columna:")
print(suma_columnas)

# 2. Accede al elemento de la fila 2, columna 3.
elemento <- m[2, 3]
print("Elemento en la fila 2, columna 3:")
print(elemento)

# 3. Multiplica todos los elementos por 2.
m_doble <- m * 2
print("Matriz multiplicada por 2:")
print(m_doble)


