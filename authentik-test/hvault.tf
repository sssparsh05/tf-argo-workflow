data "vault_kv_secret_v2" "authentik_token" {
  mount = "secret"
  name  = "authentik" # <-- update with your actual path
}