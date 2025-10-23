edad <- 32 # tipo numeric
nombre <- "Javier" # tipo caracter
edad
nombre


library(glue)
apellidos <- "Álvarez Liébana"
nombre_completo <- glue("{nombre} {apellidos}")
nombre_completo


a <- 1
b <- -2
a + b
class(a + b)


edad <- 32
glue("Hola, me llamo {nombre_completo} y tengo {edad} años")


library(stringr)
x <- "mi código postal es 28045"
y <- str_sub(x, 3, 17)
y


str_to_upper(str_trim(y, side = "left"))
z <- str_trim(y, side = "left")
str_to_upper(z)


str_sub(x, 4, 16) <- "cp"








