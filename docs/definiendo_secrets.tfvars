## Definiendo secrets.tfvars

[¡IMPORTANTE!]
    -NO poner nunca contraseñas como texto plano en la configuración
    -Usaremos secrets.tfvars para pasar estas credenciales

En secrets.tfvars establecemos todos los valores *sensibles* y que no se incluiran dentro de la configuración
En el archivo .gitignore indicaremos que este archivo no se suba a git y por lo tanto no se incluya la información en el control de versiones

tenant_id       = "XXXXXX-XXXX-XXXX-XXXX-XXXXXXX"      #Definimos en tenant_id el valor del tenant donde vayas a realizar modificaciones
subscription_id = "XXXXXX-XXXX-XXXX-XXXX-XXXXXXX"      #Definimos en suscription_id el valor de la suscripción donde vayas a realizar modificaciones

passwords = {
   "laura.fernandez@ejemplo.onmicrosoft.com" = "contraseñasegura1!"    #Contraseñas de todos los usarios asociados a su mail
   "roberto.lopez@ejemplo.onmicrosoft.com" = "contraseñasegura2!"
   "beatriz.martin@ejemplo.onmicrosoft.com" = "contraseñasegura3!"
   "miguel.torres@ejemplo.onmicrosoft.com" = "contraseñasegura4!"
}
