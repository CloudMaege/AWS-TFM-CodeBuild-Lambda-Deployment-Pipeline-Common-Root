###########################################################################
# Terraform Config Vars:                                                  #
###########################################################################
provider_region  = "us-east-2"
vpc_id           = "vpc-xxxxxxxx"


###########################################################################
# Required CodeBuild KMS CMK Module Vars:                                 #
#-------------------------------------------------------------------------#
# The following variables require consumer defined values to be provided. #
###########################################################################
cmk_alias             = "cmk/codebuild"
cmk_description       = "KMS CMK that will be used to encrypt objects and resources used in the CodeBuild Lambda Deployment Pipeline."


###########################################################################
# Required CodeBuild S3 Bucket Module Vars:                               #
#-------------------------------------------------------------------------#
# The following variables require consumer defined values to be provided. #
###########################################################################
bucket_name           = "codebuild-lambda-artifact-bucket"
bucket_region         = "us-east-2"
bucket_prefix         = ["account_prefix"]
bucket_suffix         = ["region_suffix"]
s3_versioning_enabled = true
s3_encryption_enabled = true


###########################################################################
# Required CodeBuild SNS Topic Resource Vars:                             #
###########################################################################
sns_topic_name        = "codebuild_lambda_deployment_pipeline_event_notifications"
sns_display_name      = "CodeBuild-Lambda-Deployment-Pipeline-Event-Notifications"


###########################################################################
# Required CodeBuild Security Group Resource Vars:                        #
###########################################################################
security_group_name   = "CodeBuild-Lambda-Pipeline-SG"


###########################################################################
# Required CodeBuild IAM Role Module Vars:                               #
#-------------------------------------------------------------------------#
# The following variables require consumer defined values to be provided. #
###########################################################################
role_name             = "CodeBuild-Lambda-Pipeline-Service-Role"
role_description      = "CodeBuild Role that allows CodeBuild to build, create, update, deploy and maintain Lambda functions."


###########################################################################
# Required Tags:                                                          #
###########################################################################
tags = {
    Provisioned_By  = "Terraform"
    Root_GitHub_URL = "https://github.com/CloudMage-TF/AWS-CodeBuild-Lambda-Deployment-Pipeline-Common-Root.git"
}


###########################################################################
# Optional KMS CMK Module Vars:                                           #
#-------------------------------------------------------------------------#
# The following variables have default values already set by the module.  #
# They will not need to be included in a project root module variables.tf #
# file unless a non-default value needs be assigned to the variable.      #
###########################################################################
cmk_owners            = []
cmk_admins            = []
cmk_users             = []
cmk_grantees          = []


###########################################################################
# Optional S3 Bucket Module Vars:                                         #
#-------------------------------------------------------------------------#
# The following variables have default values already set by the module.  #
# They will not need to be included in a project root module variables.tf #
# file unless a non-default value needs be assigned to the variable.      #
###########################################################################
s3_mfa_delete         = false
s3_bucket_acl         = "private"
s3_kms_key_arn        = "AES256"


###########################################################################
# Optional CodeBuild IAM Role Module Vars:                                #
#-------------------------------------------------------------------------#
# The following variables have default values already set by the module.  #
# They will not need to be included in a project root module variables.tf #
# file unless a non-default value needs be assigned to the variable.      #
###########################################################################
role_s3_access_list   = []
role_sns_access_list  = []
role_cmk_access_list  = []