# ejercicio 1
library(lubridate)
hoy <-today()
hoy

inicio <-as_date("2000-01-01")
# inicio <-as_date("01-01-2000", format="%d-%m-%Y")
hoy - inicio

#ejercicio 2
fecha <-as_date("2000-01-01")
leap_year(fecha)
fecha + weeks(1:5)

#ejercicio 3
separarFecha <-as_date("2000-01-02")
month(separarFecha)
year(separarFecha)
wday(separarFecha, week_start = 1)
wday(separarFecha, week_start = 1, label=TRUE)

#ejercicio 4
seconds(today()-inicio)

