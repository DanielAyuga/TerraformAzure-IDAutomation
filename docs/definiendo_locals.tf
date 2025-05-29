## Definiendo locals.tf

-En este archivo, estableceremos dónde tenemos el archivo en formato .json con la información de los usuarios a dar de alta en Azure.
-Como vamos a referirnos a el en variables

En este caso, el archivo cuenta con los siguientes campos: nombre, email, departamento y puesto.
    -Ejemplo de usuario:
[
  { 
	"nombre": "Laura Fernández",
	"email": "laura.fernandez@ejemplo.onmicrosoft.com",
	"departamento": "frontend",
	"puesto": "n2"


locals {                                                                     #Definimos que "users" será el valor que pasaremos en el archivo variables.
  users = { for user in jsondecode(file("${path.module}/users.json")) :      #Esto declara que: Iteramos sobre cada elemento del archivo json (despues de decodificarlo)
    user.email => user                                                        donde cada usuario tendrá como clave el email.
  }
}

[NOTA]
La sintaxis "file("${path.module}/users.json"" indica que el archivo se encuentra en la misma ruta que el módulo, en la misma carpeta que el proyecto.
