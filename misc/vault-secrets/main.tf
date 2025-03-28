terraform {
  backend "s3" {
    bucket = "terraform-salman"
    key = "vault-secrets/state"
    region = "us-east-1"
  }
}



provider "vault" {
  address = "http://vault-internal.salman06.shop:8200"
  token = var.vault_token
}

variable "vault_token" {}


resource "vault_mount" "ssh" {
  path        = "infra"
  type        = "kv"
  options     = { version = "2" }
  description = "Infra secrets"
}

resource "vault_generic_secret" "ssh" {
  path = "${vault_mount.ssh.path}/ssh"

  data_json = <<EOT
{
  "username":   "ec2-user",
  "password": "DevOps321"
}
EOT
}

resource "vault_mount" "roboshop-dev" {
  path        = "roboshop-dev"
  type        = "kv"
  options     = { version = "2" }
  description = "Roboshop Dev secrets"
}

resource "vault_generic_secret" "roboshop-dev-cart" {
  path = "${vault_mount.roboshop-dev.path}/cart"

  data_json = <<EOT
{
  "REDIS_HOST":   "redis-dev.salman06.shop",
  "CATALOGUE_HOST": "catalogue-dev.salman06.shop",
  "CATALOGUE_PORT": "8080",
}
EOT
}