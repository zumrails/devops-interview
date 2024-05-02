module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "interview-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


# Create a Route 53 private hosted zone
resource "aws_route53_zone" "private_zone" {
  vpc {
    vpc_id = module.vpc.vpc_id
  }

  name = "internal.interview.com"
}

# Create a security group for the ALB
resource "aws_security_group" "alb_sg" {
  name        = "interview-alb-sg"
  description = "Security group for the ALB"
  vpc_id      = module.vpc.vpc_id

  # Allow inbound traffic from VPC subnets
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  # Allow outbound traffic to the internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an Application Load Balancer
resource "aws_lb" "load_balancer" {
  name               = "interview-lb"
  internal           = true
  load_balancer_type = "application"
  subnets            = module.vpc.public_subnets
  security_groups    = [module.vpc.default_security_group_id]

  tags = {
    Name = "example-lb"
  }
}

# Create a default listener (HTTP on port 80)
resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type         = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "that's the private load balancer"
      status_code  = "200"
    }
  }
}
