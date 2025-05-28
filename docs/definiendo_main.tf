main.tf

#Creacion rg

resource "azurerm_resource_group" "frontend" {       #Indicamos con "azurerm_resource_group" que el recurso que vamos a crear es resource group al que llamaremos frontend
  provider = azurerm                                 #Indicamos qué "azurerm" es el provider que va a realizar la acción de dar de alta el recurso
  name     = "frontend"                              #Nombre del recurso en Azure
  location = "Spain Central"                         #Localización donde se va a crear

  tags = {                                           #Etiquetas que queramos añadir
    environment = "dev,frontend"                     #En este caso dos etiquetas: dev y frontend
  }
}

resource "azurerm_resource_group" "backend" {        #Mismo procedimiento que el anterior grupo de recursos modificando nombre y etiquetas
  provider = azurerm
  name     = "backend"
  location = "Spain Central"

  tags = {
    environment = "dev,backend"
  }
}

#Alta usuarios

resource "azuread_user" "users" {                                  #Indicamos con "azuread_user" que el objeto que vamos a crear es un usuario (en este caso un listado)
  for_each = { for user in local.users : user.email => user }      #Iteramos sobre un listado (se indica que esta en local y se llama users "local.users" y crea un objeto por email en la lista

  user_principal_name = each.value.email                           #Definimos el valor que va a tener "each.value(cada valor).email" del archivo json de locals.tf
  display_name        = each.value.name                            #Definimos el valor que va a tener "each.value(cada valor).nombre" del listado
  department          = each.value.departamento                    #Definimos el valor que va a tener "each.value(cada valor).departamento" dentro del listado
  job_title           = each.value.puesto                          #Definimos el valor que va a tener "each.value(cada valor).puesto" dentro del listado
  password            = var.password[each.value.email]
  force_password_change = true
}

#Asignacion roles

resource "azurerm_role_assignment" "usuarios" {
  for_each = { for usuario in local.users : usuario.email => usuario }

  principal_id         = azuread_user.usuarios[each.value.email].object_id
  scope                = each.value.departamento == "frontend" ? azurerm_resource_group.frontend.id : azurerm_resource_group.backend.id
  role_definition_name = each.value.puesto == "n1" ? "Reader" : "Contributor"
}
