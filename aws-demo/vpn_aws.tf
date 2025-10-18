# aws-demo/vpn_aws.tf

##########################
# AWS Customer Gateway
# (represents the Azure VPN public IP)
##########################
resource "aws_customer_gateway" "azure_cgw" {
  bgp_asn    = 65000
  ip_address = "172.191.4.166"
  type       = "ipsec.1"
  tags = {
    Name = "${var.project_name}-azure-cgw"
  }
}

##########################
# AWS Virtual Private Gateway (VGW)
##########################
resource "aws_vpn_gateway" "vgw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-vgw"
  }
}

##########################
# Attach VGW to VPC
##########################
resource "aws_vpn_gateway_attachment" "vgw_attach" {
  vpn_gateway_id = aws_vpn_gateway.vgw.id
  vpc_id         = aws_vpc.main.id
}

##########################
# AWS VPN Connection (VGW <-> Customer Gateway)
##########################
resource "aws_vpn_connection" "to_azure" {
  customer_gateway_id = aws_customer_gateway.azure_cgw.id
  vpn_gateway_id      = aws_vpn_gateway.vgw.id
  type                = "ipsec.1"

  # static routes to Azure networks (advertise your AWS local prefixes to Azure)
  static_routes_only = true

  tags = {
    Name = "${var.project_name}-vpn-to-azure"
  }
}

# Add a route in your VPC route table(s) to send Azure CIDR via the VGW
resource "aws_route" "to_azure" {
  route_table_id         = aws_route_table.public.id # adjust to private route table for private subnets
  destination_cidr_block = "10.10.0.0/16"            # Azure VNet CIDR
  gateway_id             = aws_vpn_gateway.vgw.id
}
