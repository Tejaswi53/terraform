output "vpc-id" {
    value = aws_vpc.vpc1.id
}
output "public1-subnet-id" {
    value = aws_subnet.public1.id
}
output "public2-subnet-id" {
    value = aws_subnet.public2.id
}
output "internet-gateway-id" {
    value = aws_internet_gateway.vpc1gw.id
}
output "public1-routetable-id" {
    value = aws_route_table.public1rt.id
}
output "public2-routetable-id" {
    value = aws_route_table.public2rt.id
}
output "public1-rta-id" {
    value = aws_route_table_association.public1rta.id
}
output "public2-rta-id" {
    value = aws_route_table_association.public2rta.id
}