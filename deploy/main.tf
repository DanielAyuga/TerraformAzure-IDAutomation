#Creacion rg

resource "azurerm_resource_group" "frontend" {
  provider = azurerm
  name     = "frontend"
  location = "Spain Central"

  tags = {
    environment = "dev,frontend"
  }
}

resource "azurerm_resource_group" "backend" {
  provider = azurerm
  name     = "backend"
  location = "Spain Central"

  tags = {
    environment = "dev,backend"
  }
}

#Alta usuarios

resource "azuread_user" "users" {
  for_each = { for user in local.users : user.email => user }

  user_principal_name = each.value.email
  display_name        = each.value.nombre
  department          = each.value.departamento
  job_title           = each.value.puesto
  password            = var.passwords[each.value.email]
  force_password_change = true
}

#Asignacion roles

resource "azurerm_role_assignment" "usuarios" {
  for_each = { for usuario in local.users : usuario.email => usuario }

  principal_id         = azuread_user.users[each.value.email].object_id
  scope                = each.value.departamento == "frontend" ? azurerm_resource_group.frontend.id : azurerm_resource_group.backend.id
  role_definition_name = each.value.puesto == "n1" ? "Reader" : "Contributor"
}
