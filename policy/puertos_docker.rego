package main
import rego.v1
# Vamos a validar que los puertos expuestos sean correctos
deny contains msg if {
  some i
  lower(input.dockerfile[0][i].Cmd) == "expose"
  not puerto_valido(input.dockerfile[0][i].Value)
  msg := sprintf("Puerto %v no es válido, solo se permiten 8081 y 8082", [input.dockerfile[0][i].Value])
}
# Puesto válido = 8081
puerto_valido(p) if {
  p == "8081"
}
# Puesto válido = 8082
puerto_valido(p) if {
  p == "8082"
}
