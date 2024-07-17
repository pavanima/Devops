provider "aws" {
    profile = "venkatesh"
  
}

locals {
  Name=var.tags
}

resource "aws_vpc" "count-vpc" {
    cidr_block = var.cidr_block_vpc
    tags = {
      Name="${local.Name}-Vpc"
    }
}

 
resource "aws_subnet" "public-subnet-1" {
   vpc_id =aws_vpc.count-vpc.id
   count = "${length(var.cidr_block_subnet-1)}"
   cidr_block = element(var.cidr_block_subnet-1,(count.index))
   availability_zone = element(var.availability_zone,(count.index))

   tags = {
     Name="${local.Name}-public-Subnet-1-${count.index+1}"
   }
}

resource "aws_subnet" "Privat-subnet-1" {
   vpc_id =aws_vpc.count-vpc.id
   count = "${length(var.cidr_block_Private_subnet-1)}"
   cidr_block = element(var.cidr_block_Private_subnet-1,(count.index))
   availability_zone = element(var.availability_zone,(count.index))

   tags = {
     Name="${local.Name}-Private-Subnet-1-${count.index+1}"
   }
}


# resource "aws_instance" "Count-Ec2" {
#   count = length(var.cidr_block_subnet-1)
#     ami = element(var.ami,(count.index))
#     instance_type = element(var.instance_type,(count.index))
#     availability_zone = element(var.availability_zone,(count.index))
#     subnet_id = element(var.cidr_block_subnet-1,(count.index))
    
    
#      tags = {
#        Name="${local.Name}-ec2-instance-${count.index}"
#      }
# }











