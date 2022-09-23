# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host

module "public_bastion_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.13.0"

    name = "${local.name}-bastion-sg"
    description = "Security Group w/ ssh port open; egress ports are all open"
    vpc_id = module.vpc.vpc_id

    # Ingress Rules & CIDR Blocks
    ingress_rules = ["ssh-tcp"]
    ingress_cidr_blocks = ["0.0.0.0/0"]

    # Egress Rules
    egress_rules = ["all-all"]

    tags = local.common_tags
}