# EC2 Outputs for Bastion and Private EC2
output "ec2_bastion_id" {
  description = "The ID of the instance"
  value       = module.ec2_public_bastion.id
}
output "ec2_bastion_public_dns" {
  description = "The public DNS name assigned to the instances"
  value       = module.ec2_public_bastion.public_dns
}

output "ec2_bastion_public_ip" {
  description = "The public IP address assigned to the instances"
  value       = module.ec2_public_bastion.public_ip
}