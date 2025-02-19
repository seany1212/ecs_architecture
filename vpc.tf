module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.common_tags.env}-${local.common_tags.product}-vpc"
  cidr = "10.0.0.0/16"

  azs             = data.aws_availability_zones.available
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true

  tags = local.common_tags
}
