###########################################################################
# Terraform Config Vars:                                                  #
###########################################################################
variable "provider_region" {
  description = "The region where this project will be provisioned within AWS."
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The id of the VPC that the CodeBuild Security Group will be placed in. This information can also be gathered from a data source if the VPC was deployed using TF."
  type        = string
}


###########################################################################
# Required KMS CMK Module Vars:                                           #
#-------------------------------------------------------------------------#
# The following variables require consumer defined values to be provided. #
###########################################################################
variable "cmk_alias" {
  type        = string
  description = "The alias that will be used to reference the provisioned KMS CMK. This value will be appended to alias/ within the module."
  default     = "cmk/codebuild"
}

variable "cmk_description" {
  type        = string
  description = "Description providing information about the KMS CMK that will be provisioned."
  default     = "KMS CMK that will be used to encrypt objects and resources used in the CodeBuild Lambda Deployment Pipeline."
}


###########################################################################
# Required CodeBuild S3 Bucket Module Vars:                               #
#-------------------------------------------------------------------------#
# The following variables require consumer defined values to be provided. #
###########################################################################
variable "bucket_name" {
  type        = string
  description = "The S3 bucket that CodeBuild will use to push built Lambda deployment packages to. This bucket will also be used for the deployments of those functions."
  default     = "codebuild-lambda-artifact-bucket"
}

variable "bucket_region" {
  type        = string
  description = "The AWS region where the S3 bucket will be provisioned."
  default     = "empty"
}

variable "bucket_prefix" {
  type        = list
  description = "Prefix values that will be added to the beginning of the S3 bucket name for uniqueness."
  default     = []
}

variable "bucket_suffix" {
  type        = list
  description = "Suffix values that will be added to the end of the S3 bucket name for uniqueness."
  default     = []
}

variable "s3_versioning_enabled" {
  type        = bool
  description = "Flag to enable bucket object versioning."
  default     = false
}

variable "s3_encryption_enabled" {
  type        = bool
  description = "Flag to enable bucket object encryption."
  default     = false
}


###########################################################################
# Required CodeBuild SNS Topic Resource Vars:                             #
###########################################################################
variable "sns_topic_name" {
  type        = string
  description = "Name of the SNS Topic that will be used for Lambda build and deployment notifications."
  default     = "codebuild_lambda_deployment_pipeline_event_notifications"
}

variable "sns_display_name" {
  type        = string
  description = "Display Name of the SNS Topic that will be used for Lambda build and deployment notifications."
  default     = "CodeBuild-Lambda-Deployment-Pipeline-Event-Notifications"
}


###########################################################################
# Required CodeBuild Security Group Resource Vars:                        #
###########################################################################
variable "security_group_name" {
  type        = string
  description = "The Name that will be assigned to the security group created for CodeBuild Projects."
  default     = "CodeBuild-Lambda-Pipeline-SG"
}


###########################################################################
# Required CodeBuild IAM Role Module Vars:                               #
#-------------------------------------------------------------------------#
# The following variables require consumer defined values to be provided. #
###########################################################################
variable "role_name" {
  type        = string
  description = "Name of the the CodeBuild Lambda Pipeline Service Role."
  default     = "CodeBuild-Lambda-Pipeline-Service-Role"
}

variable "role_description" {
  type        = string
  description = "Specify the description for the the Lambda Pipeline Service Role."
  default     = "CodeBuild Role that allows CodeBuild to build, create, update, deploy and maintain Lambda functions."
}


###########################################################################
# Required Tags:                                                          #
###########################################################################
variable "tags" {
  type        = map
  description = "Specify any tags that should be added to the KMS CMK being provisioned."
  default     = {
    Provisoned_By  = "Terraform"
    Root_GitHub_URL     = "https://github.com/CloudMage-TF/AWS-CodeBuild-Lambda-Deployment-Pipeline-Common-Root.git"
  }
}


###########################################################################
# Optional KMS CMK Module Vars:                                           #
#-------------------------------------------------------------------------#
# The following variables have default values already set by the module.  #
# They will not need to be included in a project root module variables.tf #
# file unless a non-default value needs be assigned to the variable.      #
###########################################################################
variable "cmk_owners" {
  type        = list(string)
  description = "List of users/roles that will have ownership of the CodeBuild KMS CMK."
  default     = []
}

variable "cmk_admins" {
  type        = list
  description = "List of users/roles that will have administrative permissions on the CodeBuild KMS CMK."
  default     = []
}

variable "cmk_users" {
  type        = list(string)
  description = "List of users/roles that will have rights to use the KMS CMK to Encrypt/Decrypt/Re-Encrypt resources."
  default     = []
}

variable "cmk_grantees" {
  type        = list(string)
  description = "List of users/roles that will be granted permissions to Create/List/Delete temporary grants to use the KMS CMK."
  default     = []
}


###########################################################################
# Optional S3 Bucket Module Vars:                                         #
#-------------------------------------------------------------------------#
# The following variables have default values already set by the module.  #
# They will not need to be included in a project root module variables.tf #
# file unless a non-default value needs be assigned to the variable.      #
###########################################################################
variable "s3_mfa_delete" {
  type        = bool
  description = "Flag to enable the requirement of MFA in order to delete a bucket, object, or disable object versioning."
  default     = false
}

variable "s3_kms_key_arn" {
  type        = string
  description = "The KMS CMK that will be used to encrypt objects within the CodeBuild Lambda deployment artifact bucket."
  default     = "AES256"
}

variable "s3_bucket_acl" {
  type        = string
  description = "Access Control List that will be placed on the CodeBuild Lambda deployment artifact bucket."
  default     = "private"
}


###########################################################################
# Optional CodeBuild IAM Role Module Vars:                                #
#-------------------------------------------------------------------------#
# The following variables have default values already set by the module.  #
# They will not need to be included in a project root module variables.tf #
# file unless a non-default value needs be assigned to the variable.      #
###########################################################################
variable "role_s3_access_list" {
  type        = list(string)
  description = "List of S3 Bucket ARNs that the CodeBuild Lambda Pipeline Service Role will be given access to."
  default     = []
}

variable "role_sns_access_list" {
  type        = list(string)
  description = "List of SNS Topic ARNs that the CodeBuild Lambda Pipeline Service Role will be given access to."
  default     = []
}

variable "role_cmk_access_list" {
  type        = list(string)
  description = "Optional - List of KMS CMK ARNs that the CodeBuild Lambda Pipeline Service Role will be given usage permissions to."
  default     = []
}