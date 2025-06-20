data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

 # Create VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# Create Public Subnet
resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-${count.index + 1}"
  }
}

# Create Private Subnet
resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.vpc_name}-private-${count.index + 1}"
  }
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_tag_name
    Environment = var.environment
  }
}

resource "aws_lb" "test" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [var.lb_sg_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = var.enable_deletion_protection

   tags = {
    Environment = var.environment_tag
  }
}

resource "aws_elastic_beanstalk_application" "this" {
  name        = var.eb_app_name
  description = var.eb_app_description

 
  appversion_lifecycle {
    service_role          = var.eb_service_role_arn
        
  }
}

resource "aws_db_instance" "postgres" {
  identifier              = var.db_identifier
  engine                  = "postgres"
  #engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  allocated_storage       = var.db_allocated_storage
  db_name                    = var.db_name
  username                = var.db_username
  password                = var.db_password
  port                    = var.db_port
   #vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  #db_subnet_group_name    = aws_db_subnet_group.this.name
  skip_final_snapshot     = true
  multi_az                = var.db_multi_az

  tags = {
    Name = var.db_identifier
  }
}

resource "aws_ecr_repository" "foo" {
  name                 = var.ecr_repo_name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}









