## Definiendo variables.tf

En este ejemplo nuestras variables, solo hacen referencia al nombre que tendrán entre "" y el tipo, que en este caso son string (cadena)
Se asocia esta variable al valor que tienen en secrets.tfvars (sin tener que usar texto plano) y este nombre lo usaremos en el archivo main.tf de configuración.

variable "tenant_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "passwords" {
  type = map(string)
}
