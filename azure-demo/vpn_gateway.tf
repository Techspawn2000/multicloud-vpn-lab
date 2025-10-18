##################################################
# Azure VPN Connection to AWS - vpn_gateway.tf
# Author: Techspawn Global Solutions
##################################################

variable "aws_vpn_gateway_ip" {
  description = "The public IP address of AWS VPN Gateway (Tunnel 1)"
  type        = string
  default     = "REPLACE_WITH_AWS_TUNNEL1_IP"
}

