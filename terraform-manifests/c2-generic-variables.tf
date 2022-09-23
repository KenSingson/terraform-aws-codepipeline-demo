# AWS REGION
variable "aws_region" {
    description = "Region in which AWS Resources to be created"
    type = string
    default = "ap-southeast-1"
}

# Environment
variable "environment" {
    description = "Environment variable used as a prefix"
    type = string
    default = "dev"
}

# Business Division
variable "business_division" {
    description = "Business Division in the large organization"
    type = string
    default = "operations"
}

