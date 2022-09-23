# AWS EC2 Security Group Terraform Module
# Security Group for Private Resources

module "private_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.13.0"

    name = "${local.name}-private-sg"
    description = "Security Group w/ HTTP and ssh port open; egress ports are all open"
    vpc_id = module.vpc.vpc_id

    # Ingress Rules & CIDR Blocks
    ingress_rules = ["ssh-tcp", "http-80-tcp"]
    ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

    # Egress Rules
    egress_rules = ["all-all"]

    tags = local.common_tags
}

