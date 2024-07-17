output "vpc_id" {
    value = aws_vpc.count-vpc.id
  
}
output "vpc_id_cidr" {
    value = aws_vpc.count-vpc.cidr_block
  
}

