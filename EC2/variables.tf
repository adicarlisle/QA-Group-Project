variable "ami_id" {
    description = "This variable indicates which ami for the new EC2 instance"
    default = "ami-09a56048b08f94cdf"
}

variable "instance" {
    description = "This states the type of EC2 instance to use"
    default = "t2.micro"
}

variable "subnet_id" {
    description = "This is the subnet IDs for EC2"
}

variable "vpc_security_group_ids" {
    description = "The IDs for the VPC Security Groups"
}

variable "user_data" {
    description = "The script that runs when creating the instance"
    default = "data.template_file.init.rendered"
}

variable "enable_public_ip" {
    description = "To be enabled if the EC2 instance has a public IP"
    default = "True"
}

variable "name" {
    description = "The Name of the EC2 Instance"
    default = "Manager_Node"
}