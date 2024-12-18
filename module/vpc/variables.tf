variable "resource_region" {
    description = "This is the region where resources will be created"
    type = string
    default = "us-east-1"
}
variable "vpc_cidr" {
    description = "This is for cidr_block value of vpc "
    type = any 
    default = "10.0.0.0/16"
}
variable "public1-subnet" {
    description = "This is for cidr_block value of public1 subnet"
    type = any
    default = "10.0.1.0/24"
}
variable "public2-subnet" {
    description = "This is for cidr_block value of public2 subnet"
    type = any
    default = "10.0.2.0/24"
}
variable "public1-rt" {
    description = "This is for cidr_block value of public1 route table"
    type = any
    default = "0.0.0.0/0"
}
variable "public2-rt" {
    description = "This is for cidr_block value of public2 route table"
    type = any
    default = "0.0.0.0/0"
}
variable "tag-of-vpc1" {
    description = "this a tag name of vpc"
    type = string
    default = "web-server-vpc"
}
variable "tag-of-public1-subnet" {
    description = "this a tag name of public1 subnet"
    type = string
    default = "web-public1-subnet"
}
variable "tag-of-public2-subnet" {
    description = "this a tag name of public2 subnet"
    type = string
    default = "web-public2-subnet"
}
variable "tag-of-internet-gateway" {
    description = "this a tag name of internet gateway"
    type = string
    default = "web-internet-gateway"
}
variable "tag-of-public1-rt" {
    description = "this a tag name of public1 route table"
    type = string
    default = "web-public1-rt"
}
variable "tag-of-public2-rt" {
    description = "this a tag name of public2 route table"
    type = string
    default = "web-public2-rt"
}
