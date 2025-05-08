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
      ports = {
         vault = 8200
      }
      root_block_device = 20
      iam_policy = {
        Action = []
        Resource = []
      }
    }

    github-runner ={
      instance_type = "t3.small"
      ports = {}
      root_block_device = 30
      iam_policy = {
        Action = ["*"]
        Resource = []
      }
    }

    elk-stack ={
      instance_type = "i3.large"
      ports = {
        elasticsearch = 9200
        kibana = 80
        logstash = 5044
      }
      root_block_device = 30
      iam_policy = {
        Action = ["*"]
        Resource = []
      }
    }

  }
}