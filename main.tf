provider "aws" {
     region = "ap-south-1"
     profile = "os"
 }
variable  input {}
resource "aws_elasticsearch_domain" "opensearch" {
  count =var.input >=0 && var.input <=20 ? 1:0
  domain_name = "demo"
  elasticsearch_version = "7.10"

  cluster_config {

    instance_type = "t3.medium.elasticsearch"
  }
  ebs_options{
    ebs_enabled =true
    volume_size=30
    volume_type ="gp2"
  }

  tags = {
    Domain = "TestDomain"
  }
}
resource "aws_elasticsearch_domain" "example" {
  count =var.input >20  && var.input <50  ? 1:0
  domain_name           = "example"
  elasticsearch_version = "7.10"

  cluster_config {
    instance_type = "r4.large.elasticsearch"
  }
  ebs_options{
    ebs_enabled =true
    volume_size=30
    volume_type ="gp2"
  }
