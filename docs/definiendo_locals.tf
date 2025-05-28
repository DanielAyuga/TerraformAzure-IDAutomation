locals.tf

En este archivo, estableceremos dónde tenemos el archivo en formato .json con la información de los usuarios a dar de alta en Azure.
En este caso, el archivo cuenta con los siguientes campos: nombre, email, departamento y puesto.
    -Ejemplo de usuario:
[
  { 
	"nombre": "Laura Fernández",
	"email": "laura.fernandez@danielayugachaconoutlook.onmicrosoft.com",
	"departamento": "frontend",
	"puesto": "n2"


locals {
  users = {                                                         #Definimos que "users" será el valor que pasaremos en el archivo variables.
    for user in jsondecode(file("${path.module}/users.json")) :     #Esto declara que: Iteramos sobre cada elemento del archivo json (despues de decodificarlo)
  }
}

[NOTA]
La sintaxis "file("${path.module}/users.json"" indica que el archivo se encuentra en la misma ruta que el módulo, en la misma carpeta que el proyecto.
