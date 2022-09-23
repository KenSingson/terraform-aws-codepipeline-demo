# AWS EC2 Security Group Terraform Module
# Security Group for Private Resources

module "loadbalancer_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.13.0"

    name = "${local.name}-loadbalancer-sg"
    description = "Security Group w/ HTTP open; egress ports are all open"
    vpc_id = module.vpc.vpc_id

    # Ingress Rules & CIDR Blocks
    ingress_rules = ["http-80-tcp", "https-443-tcp"]
    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_with_cidr_blocks = [
        {
            from_port   = 81
            to_port     = 81
            protocol    = 6
            description = "Allow port 81 from internet"
            cidr_blocks = "0.0.0.0/0"
        },
    ]

    # Egress Rules
    egress_rules = ["all-all"]

    tags = local.common_tags
}

