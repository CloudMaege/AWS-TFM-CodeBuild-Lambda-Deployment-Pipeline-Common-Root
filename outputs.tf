######################
# KMS Key Outputs:   #
######################
output "kms_key_id" {
  value = module.codebuild_cmk.kms_key_id
}

output "kms_key_arn" {
  value = module.codebuild_cmk.kms_key_arn
}

output "kms_key_alias" {
  value = module.codebuild_cmk.kms_key_alias
}

######################
# SNS Topic Outputs: #
######################
output "sns_topic_id" {
  value = aws_sns_topic.events.id
}

output "sns_topic_arn" {
  value = aws_sns_topic.events.arn
}

######################
# S3 Bucket Outputs: #
######################
output "s3_bucket_id" {
  value = module.codebuild_s3_artifact_bucket.s3_bucket_id
}

output "s3_bucket_arn" {
  value = module.codebuild_s3_artifact_bucket.s3_bucket_arn
}

output "s3_bucket_domain_name" {
  value = module.codebuild_s3_artifact_bucket.s3_bucket_domain_name
}

output "s3_bucket_region" {
  value = module.codebuild_s3_artifact_bucket.s3_bucket_region
}

###########################
# Security Group Outputs: #
###########################
output "security_group_id" {
  value = aws_security_group.codebuild_security_group.id
}

output "security_group_arn" {
  value = aws_security_group.codebuild_security_group.arn
}

output "security_group_name" {
  value = aws_security_group.codebuild_security_group.name
}

output "security_group_vpc_id" {
  value = aws_security_group.codebuild_security_group.vpc_id
}

#################
# Role Outputs: #
#################
output "codebuild_role_id" {
  value = module.codebuild_service_role.codebuild_role_id
}

output "codebuild_role_arn" {
  value = module.codebuild_service_role.codebuild_role_arn
}