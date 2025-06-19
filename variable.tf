# AWS Region
variable "region" {
  type    = string
  default = "eu-central-1a"
}

variable "tags" {
  type = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
  default = "my-custom-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default = ["eu-central-1a", "eu-central-1b"]
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default = "ami-02003f9f0fde924ea"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Tag name for the EC2 instance"
  type        = string
  default     = "Test"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default = "my-tf-test-bucket-fe"
}

variable "bucket_tag_name" {
  description = "The Name tag for the S3 bucket"
  type        = string
  default     = "My bucket"
}

variable "environment" {
  description = "The environment tag for the S3 bucket"
  type        = string
  default     = "Dev"
}

variable "lb_name" {
  description = "Name of the Load Balancer"
  type        = string
  default = "test-lb"
}

variable "internal" {
  description = "Whether the Load Balancer is internal"
  default       = false
}

variable "load_balancer_type" {
  description = "Type of Load Balancer (application or network)"
  type        = string
  default = "application"
}

variable "lb_sg_id" {
  description = "Security Group ID for the Load Balancer"
  type        = string
  default = "sg-0a135faf51266e478"
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
  default = [ "subnet-0ead9c4502a8360e8", "subnet-04150d17889a797a4"  ]
}

variable "enable_deletion_protection" {
  description = "Enable or disable deletion protection"
  type        = bool
  default = true
}

variable "environment_tag" {
  description = "Environment tag for resources"
  type        = string
  default = "production"
}

variable "eb_app_name" {
  description = "Name of the Elastic Beanstalk application"
  type        = string
  default = "my-eb"
}
variable "eb_app_description" {
  default = "My sample Elastic Beanstalk app"
}


variable "eb_service_role_arn" {
  description = "ARN of the IAM service role for Elastic Beanstalk"
  type        = string
  default = "arn:aws:iam::501619570787:role/ElasticBeanstalkservice"
}

variable "db_identifier" {
  type        = string
  default     = "postgres-db"
}

#variable "db_engine_version" {
 # type        = string
 # default     = "15.4"
#}

variable "db_instance_class" {
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  type        = number
  default     = 20
}

variable "db_name" {
  type        = string
  default     = "mydatabase"
}

variable "db_username" {
  type        = string
  default     = "sravya"
}

variable "db_password" {
  type        = string
  default     = "Sravya123"
  sensitive   = true
}

variable "db_port" {
  type        = number
  default     = 5432
}


variable "db_multi_az" {
  type        = bool
  default     = false
}

 #variable "db_subnet_group_name" {
 # type        = string
  #default     = "rds-subnet-group"
#}

variable "db_subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the DB subnet group"
  default = [ "subnet-09fa280d908c43302", "subnet-0307c2b5f123b2ed4" ]
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the security group will be created"
  default = "vpc-07dc2f07651427069"
}

variable "ecr_repo_name" {
  description = "Name of the ECR repository"
  type        = string
  default = "my-ecr-repo"
}

variable "image_tag_mutability" {
  description = "Whether image tags are MUTABLE or IMMUTABLE"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Whether to scan images on push"
  type        = bool
  default     = true
}
