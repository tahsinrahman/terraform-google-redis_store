# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "name_suffix" {
  description = "An arbitrary suffix that will be added to the end of the resource name(s). For example: an environment name, a business-case name, a numeric id, etc."
  type        = string
  validation {
    condition     = length(var.name_suffix) <= 14
    error_message = "A max of 14 character(s) are allowed."
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

variable "name" {
  description = "An arbitrary name for the redis instance."
  type        = string
  default     = "v1"
}

variable "region" {
  description = "The region to launch the redis instance in. Defaults to the google provider's region if nothing is specified here. See https://cloud.google.com/compute/docs/regions-zones."
  type        = string
  default     = null
}

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
