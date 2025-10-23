# ejercicio 1
x <-c(1,10,-1,2)
suma <-sum(x)
suma

# ejercicio 2
y <-c(5,-7,8,-3)
sumatotal <-x+y
sumatotal

# ejercicio 3
mayoresde0 <-(sum(sumatotal>0))
mayoresde0

# ejercicio 4
ordenarx <-(sort(x))
ordenarx

# ejercicio 5
x <-c(1,10,-1,2)
maximo <-which.max(x)
minimo <-which.min(x)
maximo
minimo

# ejercicio 6
intervalo <-(x>1 & x<7)
intervalo
all(x>0)

# ejercicio 7
vector <-c(-1,0,4,5,-2)
raiz <-sqrt(vector)
raiz
is.nan(raiz)

# ejercicio 8
impares <-seq(1,21, by=2)
impares
impares[c(1,4,5,8)]
eliminamos2 <-impares[-2]
eliminamos2

# ejercicio 9
animales <- c("oso polar", "oso pardo", "perro oso", "buho", "lechuza", "oso malayo")
sum(str_count(animales, "oso"))
str_starts(animales, "oso")
str_ends(animales, "oso")
str_detect(animales, "oso")
sum(str_starts(animales, "oso"))
sum(str_ends(animales, "oso"))
sum(str_detect(animales, "oso"))
str_(animales, "oso")
str_length(animales)
str_replace_all(animales,"o","*")



