#####################
# Common Variables: #
#####################
provider_region  = "us-east-2"
vpc_id           = "vpc-xxxxxxxx"

########################
# KMS Key Module Vars: #
########################
cmk_alias             = "cmk/codebuild"
cmk_description       = "KMS CMK that will be used to encrypt objects and resources used in the CodeBuild Lambda Deployment Pipeline."
cmk_owners            = []
cmk_admins            = []
cmk_users             = []
cmk_grantees          = []

################################
# SNS Notification Topic Vars: #
################################
sns_topic_name        = "codebuild_lambda_deployment_pipeline_event_notifications"
sns_display_name      = "CodeBuild-Lambda-Deployment-Pipeline-Event-Notifications"

#############################
# CodeBuild S3 Bucket Vars: #
#############################
bucket_name           = "codebuild-lambda-artifact-bucket"
bucket_region         = "us-east-2"
bucket_prefix         = ["account-prefix"]
bucket_suffix         = ["region-suffix"]
s3_versioning_enabled = true
s3_mfa_delete         = false
s3_encryption_enabled = true
s3_kms_key_arn        = "aws:kms"
s3_bucket_acl         = "private"

###################################
# CodeBuild Security Group Vars:  #
###################################
security_group_name   = "CodeBuild-Lambda-Pipeline-SG"

###############################
# CodeBuild IAM Role Vars:    #
###############################
role_name             = "CodeBuild-Lambda-Pipeline-Service-Role"
role_description      = "CodeBuild Role that allows CodeBuild to build, create, update, deploy and maintain Lambda functions."
role_s3_access_list   = []
role_sns_access_list  = []
role_cmk_access_list  = []