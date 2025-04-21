variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "zone_id" {
  default = "Z04349021DA1RQVNS1OQS"
}
variable "tools" {

  default = {
    vault ={
      instance_type = "t3.small"
      port = 8200
      iam_policy = {
        Actions = []
        Resource = []
      }
    }

    github-runner ={
      instance_type = "t3.small"
      port = 443 #dummy port
      iam_policy = {
        Action = []
        Resource = []
      }
    }

  }
}