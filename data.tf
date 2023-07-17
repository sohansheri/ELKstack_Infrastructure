
### KIBANA AMI FOR TESTING
data "aws_ami" "ubuntu_ami" {
  filter {
    name = "tag:Name"
    values = ["kibana_ami"]
  }
}