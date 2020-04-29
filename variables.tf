# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "tf_env" {
  description = "Just an identifier that will be used in GCP resource names. Will help us distinguish resources created by Terraform versus resources that were already created before Terraform."
  type        = string
  validation {
    condition     = length(var.tf_env) <= 10
    error_message = "A max of 10 character(s) are allowed."
  }
}

variable "vpc_network" {
  description = "A reference (self link) to the VPC network to host the Redis MemoryStore in."
  type        = string
}

variable "ip_cidr_range" {
  description = "A /29 IP CIDR block that will be reserved for the Redis MemoryStore."
  type        = string
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "memory_size_gb" {
  description = "Size of the redis memorystore in GB."
  type        = number
  default     = 1
}

variable "redis_version" {
  description = "The version of Redis software. See https://cloud.google.com/memorystore/docs/redis/supported-versions#current_versions."
  type        = string
  default     = "REDIS_4_0"
}

variable "service_tier" {
  description = "Either \"BASIC\" for standalone or \"STANDARD_HA\" for high-availability."
  type        = string
  default     = "BASIC"
}

variable "redis_timeout" {
  description = "how long a redis operation is allowed to take before being considered a failure."
  type        = string
  default     = "10m"
}
