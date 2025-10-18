aws_region    = "us-east-1"
project_name  = "multicloud-demo"
vpc_cidr      = "10.0.0.0/16"
instance_type = "t3.micro"
key_name      = "my-aws-key"

subnet_cidrs = {
  web = "10.0.1.0/24"
  app = "10.0.2.0/24"
  db  = "10.0.3.0/24"
}

db_username = "admin"
db_password = "MySecurePassword123"

azure_vpn_public_ip = "172.191.4.166"