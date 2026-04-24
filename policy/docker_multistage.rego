package main
import rego.v1
# Asegurarnos que se use build multistage
deny contains msg if {
  not es_multistage
  msg := "Dockerfile no usa multistage build (se requiere más de un FROM)"
}
# Acá verifica que hay más de un FROM con stage
es_multistage if {
  count([1 |
    some i
    lower(input[0][i].Cmd) == "from"
  ]) > 1
}
