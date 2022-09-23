# AWS EC2 Bastion Host
module "ec2_public_bastion" {
    depends_on = [ module.vpc ]
    source  = "terraform-aws-modules/ec2-instance/aws"
    version = "4.1.4"

    name = "${local.name}-BastionHost"

    ami                    = data.aws_ami.amz_linux2.id
    instance_type          = var.instance_type
    key_name               = var.instance_keypair
    subnet_id              = module.vpc.public_subnets[0]
    vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
    
    tags = local.common_tags
}