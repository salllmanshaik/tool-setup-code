terraform {
  backend "s3" {
    bucket = "terraform-salman"
    key = "tools/state"
    region = "us-east-1"
  }
}

module "tool-infra" {
  source = "./module-infra"
  for_each = var.tools

  ami_id            = var.ami_id
  instance_type     = each.value["instance_type"]
  name              = each.key
  ports              = each.value["ports"]
  zone_id           = var.zone_id
  iam_policy        = each.value["iam_policy"]
  root_block_device = each.value["root_block_device"]
}