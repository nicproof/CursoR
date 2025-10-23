# ejercicio 1
vector_num <- c(1, 5, -7)
vector_num

# ejercicio 2
vector_num <- c(1, 10, -1, 2)
vector_num

# ejercicio 3
length(vector_num)
vector_char <- c("Hola","me","llamo","Javier","Álvarez","Liébana")
frase <- paste(vector_char, collapse=" ")
frase
glue("{frase} y tengo 30 años.")
    #paste0(frase, " y tengo 30 años.")
    #paste(frase, "y tengo 30 años.")

# ejercicio 5
seq (-1,32, by=2)
secuencia <- seq(-1,32, by=3)
secuencia
length(secuencia)

# ejercicio 6
secuencia <- seq(-1,32, l=12)
secuencia
length(secuencia)

# ejercicio 7
naturales <-seq(1,10,by=1)
naturales
fija <-rep(3,7)
fija

# ejercicio 8
patron<-rep(c(1,2,3),5)
patron
patronavanzado <-rep(c(1,2,3), each=5)
patronavanzado

#ejercicio 9
x <- c("oso pardo", "oso polar", "ballena", "grillo", "oso panda", "perro")
longitudes <- str_length(x)
longitudes

detectar_osos <-str_detect(str_to_lower(x),"oso")
detectar_osos



