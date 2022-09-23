# GET existing ACM Cert
data "aws_acm_certificate" "issued" {
  domain   = data.aws_route53_zone.mydomain.name
  statuses = ["ISSUED"]
}