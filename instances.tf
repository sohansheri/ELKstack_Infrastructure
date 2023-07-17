# ### KIBANA SERVER
resource "aws_instance" "kibana_server" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.kibana_server_sg.id]
  key_name               = "ec2key"
  subnet_id              = aws_subnet.kibana_public_subnet1.id


  tags = {
    "Name" = "kibana_server"
  }
}
resource "aws_eip" "kibana_eip" {
  instance = aws_instance.kibana_server.id
  vpc      = true
  tags = {
    "Name" = "kibana_eip"
  }
}




### BASTION HOST
resource "aws_instance" "bastion_server" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.bastion_server_sg.id]
  key_name               = "ec2key"
  subnet_id              = aws_subnet.kibana_public_subnet1.id


  tags = {
    "Name" = "bastion_server"
  }
}

resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion_server.id
  vpc      = true
  tags = {
    "Name" = "bastion_eip"
  }
}


### ELASTICSEARCH SERVER
resource "aws_instance" "elastic_server" { 
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = "t3.medium"
  vpc_security_group_ids = [aws_security_group.elastic_server_sg.id]
  key_name               = "ec2key"
  subnet_id              = aws_subnet.monitor_private_subnet1.id


  tags = {
    "Name" = "elastic_server"
  }
}



### LOGSTASH SERVER
resource "aws_instance" "logstash_server" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = "t3.small"

  vpc_security_group_ids = [aws_security_group.logstash_server_sg.id]
  key_name               = "ec2key"
  subnet_id              = aws_subnet.monitor_private_subnet1.id


  tags = {
    "Name" = "logstash_server"
  }
}

### DEMO SERVERS
resource "aws_instance" "demo_server_1" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.demo_server_sg.id]
  key_name               = "ec2key"
  subnet_id              = aws_subnet.app_private_subnet1.id

  tags = {
    "Name" = "demo_server_1"
  }
}

resource "aws_instance" "demo_server_2" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.demo_server_sg.id]
  key_name               = "ec2key"
  subnet_id              = aws_subnet.app_private_subnet2.id

  tags = {
    "Name" = "demo_server_2"
  }
}

resource "aws_instance" "demo_server_3" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.demo_server_sg.id]
  key_name               = "ec2key"
  subnet_id              = aws_subnet.app_private_subnet3.id

  tags = {
    "Name" = "demo_server_3"
  }
}
