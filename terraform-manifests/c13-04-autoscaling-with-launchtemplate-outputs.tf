output "complete_launch_template_id" {
  description = "The ID of the launch template"
  value       = module.autoscaling.launch_template_id
}

output "complete_launch_template_arn" {
  description = "The ARN of the launch template"
  value       = module.autoscaling.launch_template_arn
}

output "complete_launch_template_name" {
  description = "The name of the launch template"
  value       = module.autoscaling.launch_template_name
}

output "complete_launch_template_latest_version" {
  description = "The latest version of the launch template"
  value       = module.autoscaling.launch_template_latest_version
}

output "complete_launch_template_default_version" {
  description = "The default version of the launch template"
  value       = module.autoscaling.launch_template_default_version
}

output "complete_autoscaling_group_id" {
  description = "The autoscaling group id"
  value       = module.autoscaling.autoscaling_group_id
}

output "complete_autoscaling_group_name" {
  description = "The autoscaling group name"
  value       = module.autoscaling.autoscaling_group_name
}

output "complete_autoscaling_group_arn" {
  description = "The ARN for this AutoScaling Group"
  value       = module.autoscaling.autoscaling_group_arn
}

output "complete_autoscaling_group_min_size" {
  description = "The minimum size of the autoscale group"
  value       = module.autoscaling.autoscaling_group_min_size
}

output "complete_autoscaling_group_max_size" {
  description = "The maximum size of the autoscale group"
  value       = module.autoscaling.autoscaling_group_max_size
}

output "complete_autoscaling_group_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value       = module.autoscaling.autoscaling_group_desired_capacity
}

output "complete_autoscaling_group_default_cooldown" {
  description = "Time between a scaling activity and the succeeding scaling activity"
  value       = module.autoscaling.autoscaling_group_default_cooldown
}

output "complete_autoscaling_group_health_check_grace_period" {
  description = "Time after instance comes into service before checking health"
  value       = module.autoscaling.autoscaling_group_health_check_grace_period
}

output "complete_autoscaling_group_health_check_type" {
  description = "EC2 or ELB. Controls how health checking is done"
  value       = module.autoscaling.autoscaling_group_health_check_type
}

output "complete_autoscaling_group_availability_zones" {
  description = "The availability zones of the autoscale group"
  value       = module.autoscaling.autoscaling_group_availability_zones
}

output "complete_autoscaling_group_vpc_zone_identifier" {
  description = "The VPC zone identifier"
  value       = module.autoscaling.autoscaling_group_vpc_zone_identifier
}

output "complete_autoscaling_group_load_balancers" {
  description = "The load balancer names associated with the autoscaling group"
  value       = module.autoscaling.autoscaling_group_load_balancers
}

output "complete_autoscaling_group_target_group_arns" {
  description = "List of Target Group ARNs that apply to this AutoScaling Group"
  value       = module.autoscaling.autoscaling_group_target_group_arns
}

output "complete_autoscaling_schedule_arns" {
  description = "ARNs of autoscaling group schedules"
  value       = module.autoscaling.autoscaling_schedule_arns
}

output "complete_autoscaling_policy_arns" {
  description = "ARNs of autoscaling policies"
  value       = module.autoscaling.autoscaling_policy_arns
}

output "complete_autoscaling_group_enabled_metrics" {
  description = "List of metrics enabled for collection"
  value       = module.autoscaling.autoscaling_group_enabled_metrics
}

output "complete_iam_role_name" {
  description = "The name of the IAM role"
  value       = module.autoscaling.iam_role_name
}

output "complete_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the IAM role"
  value       = module.autoscaling.iam_role_arn
}

output "complete_iam_role_unique_id" {
  description = "Stable and unique string identifying the IAM role"
  value       = module.autoscaling.iam_role_unique_id
}

output "complete_iam_instance_profile_arn" {
  description = "ARN assigned by AWS to the instance profile"
  value       = module.autoscaling.iam_instance_profile_arn
}

output "complete_iam_instance_profile_id" {
  description = "Instance profile's ID"
  value       = module.autoscaling.iam_instance_profile_id
}

output "complete_iam_instance_profile_unique" {
  description = "Stable and unique string identifying the IAM instance profile"
  value       = module.autoscaling.iam_instance_profile_unique
}