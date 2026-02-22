resource "aws_vpc" "this" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "${var.identifier}-vpc"
    }

}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.public_subnet_cidr
    availability_zone = var.public_subnet_az
    tags = {
        Name = "${var.identifier}-public-subnet"
    }

    depends_on = [ aws_subnet.private1, aws_subnet.private2, aws_subnet.private3 ]

  
}

resource "aws_subnet" "private1" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.private_subnet_cidr1
    availability_zone = var.private_subnet_1_az
    tags = {
        Name = "${var.identifier}-private-subnet-1"
    }
  
}

resource "aws_subnet" "private2" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.private_subnet_cidr2
    availability_zone = var.private_subnet_2_az
    tags = {
        Name = "${var.identifier}-private-subnet-2"
    }
  
}

resource "aws_subnet" "private3" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.private_subnet_cidr3
    availability_zone = var.private_subnet_3_az
    tags = {
        Name = "${var.identifier}-private-subnet-3"
    }
  
}

resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.this.id
    tags = {
        Name = "${var.identifier}-public-rt"
    }
  
}

resource "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.this.id
    tags = {
        Name = "${var.identifier}-private-rt"
    }
  
}

resource "aws_route_table_association" "public-rt-association" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public-rt.id
  
}

resource "aws_route_table_association" "private-rt-assocaiation1" {
    subnet_id = aws_subnet.private1.id
    route_table_id = aws_route_table.private-rt.id

  
}

resource "aws_route_table_association" "private-rt-assocaiation2" {
    subnet_id = aws_subnet.private2.id
    route_table_id = aws_route_table.private-rt.id

  
}

resource "aws_route_table_association" "private-rt-assocaiation3" {
    subnet_id = aws_subnet.private3.id
    route_table_id = aws_route_table.private-rt.id

  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.this.id
    tags = {
        Name = "${var.identifier}-igw"
    }
}

resource "aws_route" "public_route" {
    route_table_id = aws_route_table.public-rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  
}

