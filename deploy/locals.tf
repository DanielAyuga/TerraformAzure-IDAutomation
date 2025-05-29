locals {
  users = { for user in jsondecode(file("${path.module}/users.json")) :
    user.email => user
  }
}
