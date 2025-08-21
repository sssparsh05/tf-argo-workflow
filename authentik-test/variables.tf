variable "authentik_url" {
  type        = string
  description = "Authentik server URL"
}

variable "authentik_token" {
  type        = string
  description = "Authentik API token"
  sensitive   = true
}

variable "users" {
  type = list(object({
    username = string
    name     = string
    email    = string
    password = string
  }))
  description = "List of users to create"
}