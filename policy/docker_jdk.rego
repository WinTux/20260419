package main
import rego.v1
deny contains msg if {
  some i
  lower(input.dockerfile[0][i].Cmd) == "from"
  contains(lower(input[0][i].Value), "jdk-8")
  msg := "No se permite usar JDK 8"
}
deny contains msg if {
  some i
  lower(input.dockerfile[0][i].Cmd) == "from"
  contains(lower(input[0][i].Value), "8-jdk")
  msg := "No se permite usar JDK 8"
}
deny contains msg if {
  some i
  lower(input.dockerfile[0][i].Cmd) == "from"
  contains(lower(input[0][i].Value), "jdk-11")
  msg := "No se permite usar JDK 11"
}
deny contains msg if {
  some i
  lower(input.dockerfile[0][i].Cmd) == "from"
  contains(lower(input[0][i].Value), "11-jdk")
  msg := "No se permite usar JDK 11"
}
deny contains msg if {
  some i
  lower(input.dockerfile[0][i].Cmd) == "from"
  contains(lower(input[0][i].Value), "jdk-17")
  msg := "No se permite usar JDK 17"
}
deny contains msg if {
  some i
  lower(input.dockerfile[0][i].Cmd) == "from"
  contains(lower(input[0][i].Value), "17-jdk")
  msg := "No se permite usar JDK 17"
}
deny contains msg if {
  some i
  lower(input.dockerfile[0][i].Cmd) == "from"
  contains(lower(input[0][i].Value), "jdk-21")
  msg := "No se permite usar JDK 21"
}
deny contains msg if {
  some i
  lower(input.dockerfile[0][i].Cmd) == "from"
  contains(lower(input[0][i].Value), "21-jdk")
  msg := "No se permite usar JDK 21"
}
