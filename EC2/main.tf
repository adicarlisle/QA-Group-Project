resource "aws_instance" "manager_node" {
    ami = var.ami_id
    instance_type = var.instance

    associate_public_ip_address = var.enable_public_ip
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.vpc_security_group_ids
    user_data = var.user_data
    tags= {
        Name = var.name
    }
}

