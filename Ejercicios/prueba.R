notas <- c(7.5, 8.2, 6.9, 9.1, 5.8, 8.0)

print("Notas mayores que 8 (usando bucle for):")

# 1. Definir un vector vacío para almacenar las notas filtradas (opcional, pero útil)
notas_filtradas <- c()

for (nota in notas) {
    if (nota >= 8) {
      print(nota)
    notas_filtradas <- c(notas_filtradas, nota)
  }
}

print("Vector de notas filtradas:")
print(notas_filtradas)
# [1] 8.2 9.1 8.0