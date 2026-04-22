package main
import rego.v1
# Se deniega si se usa el tag latest
deny contains msg if {
  some i
  lower(input.dockerfile[0][i].Cmd) == "from"
  endswith(lower(input.dockerfile[0][i].Value), ":latest")
  msg := "No uses tag 'latest' en la instrucción FROM"
}
# Se deniega si el Dockerfile no expone ningun puerto
deny contains msg if {
  not any_expose
  msg := "Dockerfile no expone ningun puerto (EXPOSE)"
}
any_expose if {
  some i
  lower(input.dockerfile[0][i].Cmd) == "expose"
}
