module "app1" {
    source = "./modules/iaac"

    identifier = "app1"

    ingress_rules = {
        ssh = {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        http = {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
    }
    }
    egress_rules = {
      all_allowed = {
        from_port = 0
        to_port = 65535
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }

}

