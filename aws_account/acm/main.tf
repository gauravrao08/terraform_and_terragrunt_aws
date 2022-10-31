resource "aws_acm_certificate" "tch-cert" {
  private_key       = file("private.key")
  certificate_body  = file("actual_cert.cer")
  certificate_chain = file("inter.cer")

   tags = {
    Domain = "test.com"   ## update the tag value
    manage-by = "terraform"  ## dont remove this tag
  }
}


## you need to create 3 file  private.key , actual_cert.cer, inter.cer