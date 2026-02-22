variable "identifier" {
    description = "A unique identifier for the resources"
  
}

variable "ami_id" {
    description = "AMI ID for the EC2 instances"
    default     = "ami-00fd1d66dd66f12e2"
  
}

variable "ingress_rules" {
    description = "List of ingress rules for the security group"
    type = map(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
    }))
}

variable "egress_rules" {
    description = "List of egress rules for the security group"
    type = map(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
    }))
  
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    default     = "10.0.0.0/16"
  
}

variable "public_subnet_cidr" {
    description = "CIDR block for the public subnet"
    default     = "10.0.0.0/24"
  
}

variable "private_subnet_cidr1" {
    description = "CIDR block for the first private subnet"
    default     = "10.0.1.0/24"
}

variable "private_subnet_cidr2" {
    description = "CIDR block for the second private subnet"
    default     = "10.0.2.0/24"
}

variable "private_subnet_cidr3" {
    description = "CIDR block for the third private subnet"
    default     = "10.0.3.0/24"
}

variable "public_subnet_az" {
    description = "Availability zone for the public subnet"
    default     = "us-east-2a"
  
}

variable "private_subnet_1_az" {
    description = "Availability zone for the first private subnet"
    default     = "us-east-2a"
  
}

variable "private_subnet_2_az" {
    description = "Availability zone for the second private subnet"
    default     = "us-east-2b"
  
}

variable "private_subnet_3_az" {
    description = "Availability zone for the third private subnet"
    default     = "us-east-2c"
  
}