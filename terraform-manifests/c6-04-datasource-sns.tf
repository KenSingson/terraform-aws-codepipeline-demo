# GET EXISTING SNS
data "aws_sns_topic" "ecs_sns_topic" {
  name = "ecs-sns-topic"
}