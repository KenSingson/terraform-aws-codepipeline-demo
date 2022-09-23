## Create Autoscaling Notification Resource
resource "aws_autoscaling_notification" "myasg_notifications" {
  group_names = [ module.autoscaling.autoscaling_group_name ]
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]
  topic_arn = data.aws_sns_topic.ecs_sns_topic.arn 
}