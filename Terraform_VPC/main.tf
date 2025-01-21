resource "aws_vpc" "terra-vpc"{
    cidr_block = var.vpc-cidr
    tags = {
        Name = var.vpc-name
    }
}

resource "aws_internet_gateway" "terra-IGW"{
    vpc_id = aws_vpc.terra-vpc.id
    tags = {
        Name = "terra-IGW"
    }
}

resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "terra-NAT"{
    subnet_id = aws_subnet.terra-public-subnet.id
    allocation_id = aws_eip.nat.id
    tags = {
        Name = "terra-NAT-gateway"
    }
}

resource "aws_subnet" "terra-public-subnet"{
    vpc_id = aws_vpc.terra-vpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "public-subnet"
    }
}

resource "aws_subnet" "terra-private-subnet"{
    vpc_id = aws_vpc.terra-vpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "private-subnet"
    }
}

resource "aws_route_table" "terra-public-route-table"{
    vpc_id = aws_vpc.terra-vpc.id
    tags =  {
        Name = "public-route-table"
    }
}

resource "aws_route" "terra-public-route"{
    route_table_id = aws_route_table.terra-public-route-table.id
    gateway_id = aws_internet_gateway.terra-IGW.id
    destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table" "terra-private-route-table"{
    vpc_id = aws_vpc.terra-vpc.id
    tags = {
        Name  = "private-route-table"
    }
}

resource "aws_route" "terra-private-route"{
    route_table_id = aws_route_table.terra-private-route-table.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terra-NAT.id
}

resource "aws_route_table_association" "terra-public-route-table-association"{
    subnet_id = aws_subnet.terra-public-subnet.id
    route_table_id = aws_route_table.terra-public-route-table.id
}

resource "aws_route_table_association" "terra-private-route-table-association"{
    subnet_id = aws_subnet.terra-private-subnet.id
    route_table_id = aws_route_table.terra-private-route-table.id
}
