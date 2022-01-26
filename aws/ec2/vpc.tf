# VPC
resource "aws_vpc" "informe_nube" {
    cidr_block = var.cidr
    assign_generated_ipv6_cidr_block = false
    enable_dns_hostnames = true

    tags = {
        Name = "VPC Tests"
        Episodeo = "Informe Nube 4"
    }

    lifecycle {
        prevent_destroy = false // para entornos de produccion colocarlo en true
    }
}
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.informe_nube.id
    count = lenght(data.aws_availability_zones.available.zone_ids)
    cidr_block = cidrsubnet(var.cidr, 4, 0 + count.index)
    map_public_ip_on_launch = false
    availability_zone = element(data.aws_availability_zones.available.names, count.index)

    tags = {
        Name = "Red publica-${count.index}"
        Episodeo = "Informe Nube 4"
    }

    depends_on = [aws_vpc.informe_nube]
}

resource "aws_subnet" "privada" {
    
}

