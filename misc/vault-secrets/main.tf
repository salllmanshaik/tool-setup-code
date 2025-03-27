terraform {
  backend "s3" {
    bucket = "terraform-salman"
    key = "vault-secrets/state"
    region = "us-east-1"
  }
}



provider "vault" {
  address = "http://vault-internal.salman06.shop.online:8200"
  token = var.vault_token
}

variable "vault_token" {}

resource "vault_generic_secret" "ssh" {
  path = "infra/secrets"

  data_json = <<EOT
{
  "username":   "ec2-user",
  "password": "DevOps321"
}
EOT
}