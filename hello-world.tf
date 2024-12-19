terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

provider "local" {
}

variable "file_content" {
  default = "Hello, World from Terraform!"
  type = string
  sensitive = true
}

resource "local_file" "init_file" {
  content  = var.file_content
  filename = "${path.module}/hello_world.txt"
}

output "file_information" {
  value = jsonencode({
    filename = local_file.init_file.filename
    content  = local_file.init_file.content
  }) 
  sensitive = true
}