variable "cluster_name" {
  type        = string
  description = "The name of the DataProc cluster to be created"
  
}

variable "region" {
  type        = string
  description = "The region in which the cluster and associated nodes will be created in"
}


variable "kms_key_name" {
  type        = string
  description = "The KMS key name to use for PD disk encryption for all instances in the cluster."
}

variable "subnetwork" {
  type        = string
  description = "under the subnetwork the resources should be created"
}


variable "project" {
  type        = string
  description = "The id of project in which DataProc cluster will be created"
}

variable "labels" {
  type = map(string)
  description = "Set of labels to identify the cluster"
}

# variable "staging_bucket" {
#   type        = string
#   description = "The Cloud Storage staging bucket used to stage files, such as Hadoop jars, between client machines and the cluster"
# }

variable "cluster_version" {
  type = string
  description = "The image version of DataProc to be used"
}

variable "master_num_instances" {
  type        = number
  description = "Specifies the number of master nodes to create"
}

variable "master_machine_type" {
  type        = string
  description = "Specifies the machine type of master nodes to create"
}

variable "master_min_cpu_platform" {
  type        = string
  description = "The name of a minimum generation of CPU family for the master"
}

variable "master_disk_type" {
  type = string
  description = "The disk type of the primary disk attached to each master node. One of 'pd-ssd' or 'pd-standard'."
}

variable "master_disk_size" {
  type = number
  description = "Size of the primary disk attached to each master node, specified in GB."
}

variable "worker_num_instances" {
  type        = number
  description = "Specifies the number of worker nodes to create"
}

variable "worker_machine_type" {
  type        = string
  description = "Specifies the machine type of worker nodes to create"
}

variable "worker_min_cpu_platform" {
  type        = string
  description = "The name of a minimum generation of CPU family for the worker"
}

variable "worker_disk_type" {
  type = string
  description = "The disk type of the primary disk attached to each worker node"
}

variable "worker_disk_size" {
  type = number
  description = "Size of the primary disk attached to each worker node, specified in GB."
}

variable "preemptible_worker_num_instance" {
  type        = number
  description = "Specifies the number of preemptible worker nodes to create"
}

variable "preemptible_worker_machine_type" {
  type        = string
  description = "Specifies the machine type of preemptible worker nodes to create"
}

variable "preemptible_worker_min_cpu_platform" {
  type        = string
  description = "The name of a minimum generation of CPU family for the preemptible worker"
}

variable "preemptible_worker_disk_type" {
  type        = string
  description = "The disk type of the primary disk attached to each preemptible worker node. One of 'pd-ssd' or 'pd-standard'."
}

variable "preemptible_worker_disk_size" {
  type        = string
  description = "Size of the primary disk attached to each preemptible worker node, specified in GB."
}


variable "optional_components" {
  type = list(string)
  description = "The optional_components"
}
variable "enable_http_port_access" {
  type = string
  description = " enable http access to specific ports on the cluster from external sources (aka Component Gateway)"
}

variable "internal_ip_only" {
  type        = bool
  description = "By default, clusters are not restricted to internal IP addresses, and will have ephemeral external IP addresses assigned to each instance. If set to true, all instances in the cluster will only have internal IP addresses. Note: Private Google Access (also known as privateIpGoogleAccess) must be enabled on the subnetwork that the cluster will be launched in."
}
