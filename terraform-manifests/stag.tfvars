# Environment
environment = "stag"

# VPC Variables
# Overwrites the values in c4-01-vpc-variables
vpc_name = "def-vpc"
vpc_cidr_block = "10.0.0.0/16"
vpc_availability_zones = [ "ap-southeast-1a","ap-southeast-1b" ]
vpc_public_subnets = [ "10.0.51.0/24","10.0.52.0/24" ]
vpc_private_subnets = [ "10.0.1.0/24","10.0.2.0/24" ]
vpc_database_subnets = [ "10.0.101.0/24","10.0.102.0/24" ]
vpc_create_database_subnet_group = true
vpc_create_database_subnet_route_table = true
vpc_enable_nat_gateway = true
vpc_single_nat_gateway = true

# EC2 Instance Variables
instance_type = "t3.micro"
instance_keypair = "udemy-terraform-kp"

# DNS Name
dns_name = "iacstagdemo.seseri.co"