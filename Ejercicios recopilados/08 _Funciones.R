# ejercicio 1
funcion_suma <- function(x, y) {
  suma <- x + y
    return(suma)
}
funcion_suma(3, 7)

# ejercicio 2
funcion_producto <- function(x, y) {
  producto <- x*y
    return(producto)
}
funcion_producto(3, -7)

#ejercicio 3
funcion_producto <- function(x, y=x) {
  producto <- x*y
  return(producto)
}
funcion_producto(3, -7)
funcion_producto(3)

#ejercicio 4
igualdad_nombres <- function(nombre1,nombre2) {
  n_nombre1=toupper(nombre1)
  n_nombre2=toupper(nombre2)
  return(n_nombre1==n_nombre2)
}
igualdad_nombres("mario","Mario")

#ejercicio 5
pares <- function(a,b){
  resultado <- ((a+b) %% 2 == 0)
  return(resultado)
}
pares(2,2)
pares(3,2)


#ejercicio 6
data("airquality")
pasar_a_celcius <- function(tf){
  tc = (tf-32)*(5/9)
  return(round(tc,1))
}
airquality$Temp_celcius = pasar_a_celcius(airquality$Temp)
head(airquality)
