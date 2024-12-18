/*data "aws_vpc" "existing-vpc1" {
    filter {
        name = "tag:Name"
        values = ["prod-vpc1"]
    }
}

data "aws_subnet" "existing-sn-pub1" {
    filter {
        name = "tag:Name"
        values = ["prod-public1-subnet"]
    }
}

data "aws_availability_zones" "available" {
    state = "available"
    #all_availability_zones = true
}

variable "instances" {
    type = any 
}*/


#importing module
module "own-vpc" {
    source = "D:/vpc"
    resource_region = var.resource_region
    vpc_cidr = var.vpc_cidr
    public1-subnet = var.public1-subnet

}


resource "aws_security_group" "sg1-vpc1" {
    name = "sg1-vpc1"
    description = "THis is for vpc1, Allow all inbound and outbound traffic"
    #vpc_id = data.aws_vpc.existing-vpc1.id
    vpc_id = module.own-vpc.vpc-id
    tags = {
        env = "dev"
    }
}

resource "aws_vpc_security_group_ingress_rule" "sg1-ingress-rule" {
    security_group_id = aws_security_group.sg1-vpc1.id
    #cidr_ipv4 = data.aws_vpc.existing-vpc1.cidr_block
    #cidr_ipv4 = module.own-vpc.vpc-id.vpc_cidr
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 443
    to_port = 443
    ip_protocol = "tcp" 
}

resource "aws_vpc_security_group_egress_rule" "sg1-egress-rule" {
    security_group_id = aws_security_group.sg1-vpc1.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
}

resource "aws_instance" "sg1-instance" {
    #count = length(data.aws_availability_zones.available.names)
    instance_type = "t2.micro"
    ami = "ami-01816d07b1128cd2d"
    vpc_security_group_ids = [aws_security_group.sg1-vpc1.id]
    #subnet_id = data.aws_subnet.existing-sn-pub1.id
    subnet_id = module.own-vpc.public1-subnet-id
    #availability_zone = data.aws_availability_zones.available.names
    depends_on = [
        aws_security_group.sg1-vpc1
    ]
    /*tags = {
        Name = "web-server ${count.index}"
    }*/
}



