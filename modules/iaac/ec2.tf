resource "aws_instance" "instances" {
    count = 2
    ami = var.ami_id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public.id
    associate_public_ip_address = true
    metadata_options {
      http_endpoint = "enabled"
      http_tokens = "optional"
    }
    security_groups = [ aws_security_group.this.id ]
    tags = {
        Name = "${var.identifier}-ec2-instance-${count.index}"
    }

    lifecycle {
      ignore_changes = [ security_groups ]
    }
  
}
# instances[0]
# instances[1]

resource "aws_security_group" "this" {
    vpc_id = aws_vpc.this.id
    name = "${var.identifier}-sg"
    description = "Security group for ${var.identifier} EC2 instances"
    tags = {
        Name = "${var.identifier}-sg"
    }
  
}

resource "aws_security_group_rule" "ingress_rule" {
    
    type = "ingress"
    security_group_id = aws_security_group.this.id
    
    for_each = var.ingress_rules

    from_port = each.value.from_port
    to_port = each.value.to_port
    protocol = each.value.protocol
    cidr_blocks = each.value.cidr_blocks
  
}

resource "aws_security_group_rule" "egress_rule" {
    type = "egress"
    security_group_id = aws_security_group.this.id

    for_each = var.egress_rules

    from_port = each.value.from_port
    to_port = each.value.to_port
    protocol = each.value.protocol
    cidr_blocks = each.value.cidr_blocks
  
}