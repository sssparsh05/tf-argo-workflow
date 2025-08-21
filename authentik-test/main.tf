terraform {
  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = ">=2024.2.0"
    }
  }
}

locals {
  authentik_token = data.vault_kv_secret_v2.authentik_token.data["authentik_token"]
}

provider "authentik" {
  url      = var.authentik_url
  token    = local.authentik_token
  insecure = true
}

resource "authentik_user" "users" {
  for_each = { for user in var.users : user.username => user }
  username = each.value.username
  name     = each.value.name
  email    = each.value.email
  password = each.value.password
  is_active = true
}