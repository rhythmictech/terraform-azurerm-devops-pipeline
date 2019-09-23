variable "org" {
  description = "Azure DevOps Organization under which to create pipeline"
  type        = string
  default     = "rhythmic-test"
}

variable "project" {
  description = "Azure DevOps Project under which to create pipeline"
  type        = string
  default     = "rhythmic-test"
}

variable "name" {
  description = "Name for Azure Devops pipeline"
  type        = string
  default     = "rhythmic-test"
}

variable "github_personal_access_token" {
  description = "GitHub Personal Access Token. Requires scopes 'admin:repo_hook', 'repo', and 'user'"
  type        = string
}