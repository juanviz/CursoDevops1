provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
resource "aws_vpc" "example" {
    cidr_block = "10.8.0.0/20"
    enable_dns_hostnames = true
    tags {
        Name = "cursoIBM"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.example.id}"
}


resource "aws_route_table" "eu-west-public" {
    vpc_id = "${aws_vpc.example.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags {
        Name = "Public Subnet"
    }
}

resource "aws_route_table_association" "eu-west-public" {
    subnet_id = "${aws_subnet.test01.id}"
    route_table_id = "${aws_route_table.eu-west-public.id}"
}


resource "aws_subnet" "test01" {
    vpc_id            = "${aws_vpc.example.id}"
    availability_zone = "eu-west-1b"
    cidr_block        = "${cidrsubnet(aws_vpc.example.cidr_block, 4, 0)}"
    map_public_ip_on_launch = true
    depends_on = ["aws_internet_gateway.gw"]
}

resource "aws_subnet" "test02" {
    vpc_id            = "${aws_vpc.example.id}"
    availability_zone = "eu-west-1b"
    cidr_block        = "${cidrsubnet(aws_vpc.example.cidr_block, 4, 1)}"
    depends_on = ["aws_internet_gateway.gw"]
}


resource "aws_eip_association" "eip_assoc" {
  instance_id = "${aws_instance.minecraft01.id}"
  allocation_id = "${aws_eip.ip.id}"

}

resource "aws_instance" "minecraft01" {
    ami           = "ami-ff9ef286"
    instance_type = "m3.medium"
    subnet_id     = "${aws_subnet.test01.id}"
    key_name = "devops_ibm"
    security_groups = [
        "${aws_security_group.internal_inbound.id}",
        "${aws_security_group.external_inbound_minecraft.id}"
    ]
    tags {
        Name = "Minecraft01",
        Role = "minecraft"
    }
    depends_on = ["aws_internet_gateway.gw"]
}

resource "aws_instance" "minecraft02" {
    ami           = "ami-ff9ef286"
    instance_type = "m3.medium"
    key_name = "devopsjv"
    security_groups = [
        "${aws_security_group.internal_inbound.id}",
        "${aws_security_group.external_inbound_minecraft.id}"
    ]
    subnet_id     = "${aws_subnet.test02.id}"
    tags {
        Name = "Minecraft02",
        Role = "minecraft"
    }
}

resource "aws_eip" "ip" {
    instance = "${aws_instance.minecraft01.id}"
    vpc = true
}

resource "aws_security_group" "internal_inbound" {
    name = "internal_inbound"
    description = "Allow access to apps on internal subnets"
    vpc_id = "${aws_vpc.example.id}"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        Name = "internal_inbound"
    }
}

resource "aws_security_group" "external_inbound_minecraft" {
    name = "external_inbound_minecraft"
    description = "Allow access to apps on external access"
    vpc_id = "${aws_vpc.example.id}"

    ingress {
        from_port = 25565
        to_port = 25565
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        Name = "external_inbound_minecraft"
    }
}

