# ejercicio 1
lista_ejemplo <- list("nombre" = "Javier", "cp" = 28019,
                      "soltero" = TRUE,
                      "notas" = data.frame("mates" = c(7.5, 8, 9),
                                           "lengua" = c(10, 5, 6)))
lista_ejemplo
length(lista_ejemplo)
lista_ejemplo[[4]]
class(lista_ejemplo[[4]])
lista_ejemplo[4]
class(lista_ejemplo[4])
# lista_ejemplo[2]
lista_ejemplo$cp

# ejercicio 2
  # lista_ejemplo[[1]]
  # lista_ejemplo[[4]]
lista_ejemplo[c(1,4)]
  # lista_ejemplo[c("nombre","notas")]

# ejercicio 3
info <- list("nombre"="Juan","apellido"="Darias","edad"=52,"soltero"=FALSE)
info

library(lubridate)
hoy <- Sys.Date() # Get today's date

# 1. Quitar el corchete '[' y usar 'round()'
resultado <- round((ymd("2020-10-23") - hoy) / 365) 

print(resultado)