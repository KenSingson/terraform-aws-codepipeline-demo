# Input Variables for EC2
variable "instance_type" {
    description = "EC2 Instance Type"
    type = string
    default = "t2.micro"
}

variable "instance_keypair" {
    description = "AWS EC2 Key Pair that needs to be associated with EC2"
    type = string
    default = "udemy-terraform-kp"
}