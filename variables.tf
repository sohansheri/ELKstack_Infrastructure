
variable "vpc_cidr" {
  description = " Variable to declare VPC CIDR range"
  default     = "13.13.0.0/16"
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "elk_vpc"
}

variable "kibanasub_public1_cidr" {
  description = "This is the CIDR range for Kibana public subnet "
  default     = "13.13.1.0/24"
}

variable "monitorsub_private1_cidr" {
  description = "This is the CIDR range for Monitor private subnet "
  default     = "13.13.4.0/24"
}

variable "appsub_private1_cidr" {
  description = "This is the CIDR range for Application private subnet 1"
  default     = "13.13.7.0/24"
}


variable "appsub_private2_cidr" {
  description = "This is the CIDR range for Application private subnet 2"
  default     = "13.13.8.0/24"
}



variable "appsub_private3_cidr" {
  description = "This is the CIDR range for Application private subnet 1"
  default     = "13.13.9.0/24"
}




variable "internet_gateway_name" {
  description = "Name of internet gateway "
  default     = "elk_vpc_igw"
}

