/*output "instance"  {
    value = aws_instance.sg1-instance[*].id
}

output "available-zone" {
    value = data.aws_availability_zones.available[*].names
}*/

output "security-group-id" {
    value = aws_security_group.sg1-vpc1.id
}

output "instance-id" {
    value = aws_instance.sg1-instance.id
}

output "vpc-id" {
    value = module.own-vpc.vpc-id
}