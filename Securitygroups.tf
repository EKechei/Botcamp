resource "aws_security_group" "websg" {
  name        = "Websecuritygroup"
  description = "Security group for web traffic"
  vpc_id      = aws_vpc.vpc.id

}

resource "aws_security_group_rule" "websg_ingress_http" {
  type                     = "ingress"
  security_group_id        = aws_security_group.websg.id
  cidr_blocks              = ["0.0.0.0/0"]
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "websg_ingress_ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  security_group_id        = aws_security_group.websg.id
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]
}


resource "aws_security_group" "appsg" {
  name        = "Appsecuritygroup"
  description = "Security group for application servers"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "Appsecuritygroup"
  }
}

resource "aws_security_group_rule" "appsg_ingress" {
  type                     = "ingress"
  security_group_id        = aws_security_group.appsg.id
  source_security_group_id = aws_security_group.websg.id
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
}




resource "aws_security_group" "databasesg" {
  name        = "Databasesecuritygroup"
  description = "Security group for database servers"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "Databasesecuritygroup"
  }
}

resource "aws_security_group_rule" "databasesg_ingress" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.databasesg.id
  source_security_group_id = aws_security_group.appsg.id
}
