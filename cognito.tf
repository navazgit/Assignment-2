resource "aws_cognito_user_pool" "pool" {
  name                       = "cognito-462281"
  email_verification_subject = "Device Verification Code"
  email_verification_message = "Please use the following code {####}"
  sms_verification_message   = "{####} Baz"
  alias_attributes           = ["email", "preferred_username"]
  auto_verified_attributes   = ["email"]
}
resource "aws_cognito_user_pool_client" "client" {
  name = "client"

  user_pool_id = "${aws_cognito_user_pool.pool.id}"
}
resource "aws_s3_bucket_object" "object" {
  bucket = "mybucket1-462281"
  key    = "config.js"
  source = "config.js"
}
resource "aws_s3_bucket_object" "js" {
  bucket = "mybucket1-462281"
  key    = "conf"
  source = "conf/test"
}