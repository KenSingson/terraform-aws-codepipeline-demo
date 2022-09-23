# Define Local Values in Terraform
locals {
  owners = var.business_division
  environment = var.environment
  name = "${local.owners}-seseri-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
  asg_tags = [{
    key = "Project"
    value = "Blue Beam"
    propagate_at_launch = true
  },{
    key = "Project"
    value = "Cardison Black"
    propagate_at_launch = true
  }]
}