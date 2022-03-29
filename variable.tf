variable "cluster_name" {
  type        = string
  description = "The name of the DataProc cluster to be created"
  default     = "mycluster1"
}

variable "region" {
  type        = string
  description = "The region in which the cluster and associated nodes will be created in"
  default     = "us-central1"
}


variable "kms_key_name" {
  type        = string
  description = "The KMS key name to use for PD disk encryption for all instances in the cluster."
  default     = ""
}

variable "subnetwork" {
  type        = string
  description = "under the subnetwork the resources should be created"
  default     = ""
}


variable "project" {
  type        = string
  description = "The id of project in which DataProc cluster will be created"
  default     = "sailor-321711"
}

variable "labels" {
  type = map(string)
  description = "Set of labels to identify the cluster"
  default = {
    environment = "dev"
  }
}

variable "staging_bucket" {
  type        = string
  description = "The Cloud Storage staging bucket used to stage files, such as Hadoop jars, between client machines and the cluster"
  default     = "mar251700"
}

variable "cluster_version" {
  type = string
  description = "The image version of DataProc to be used"
  default = "1.4"
}

variable "master_num_instances" {
  type        = number
  description = "Specifies the number of master nodes to create"
  default     = 1
}

variable "master_machine_type" {
  type        = string
  description = "Specifies the machine type of master nodes to create"
  default     = "n1-standard-2"
}

variable "master_min_cpu_platform" {
  type        = string
  description = "The name of a minimum generation of CPU family for the master"
  default     = "Intel Skylake"
}

variable "master_disk_type" {
  type = string
  description = "The disk type of the primary disk attached to each master node. One of 'pd-ssd' or 'pd-standard'."
  default = "pd-ssd"
}

variable "master_disk_size" {
  type = number
  description = "Size of the primary disk attached to each master node, specified in GB."
  default = 15
}

variable "worker_num_instances" {
  type        = number
  description = "Specifies the number of worker nodes to create"
  default     = 2
}

variable "worker_machine_type" {
  type        = string
  description = "Specifies the machine type of worker nodes to create"
  default     = "n1-standard-2"
}

variable "worker_min_cpu_platform" {
  type        = string
  description = "The name of a minimum generation of CPU family for the worker"
  default     = "Intel Skylake"
}

variable "worker_disk_type" {
  type = string
  description = "The disk type of the primary disk attached to each worker node. One of 'pd-ssd' or 'pd-standard'."
  default = "pd-ssd"
}

variable "worker_disk_size" {
  type = number
  description = "Size of the primary disk attached to each worker node, specified in GB."
  default = 15
}

variable "preemptible_worker_num_instance" {
  type        = number
  description = "Specifies the number of preemptible worker nodes to create"
  default     = 1
}

variable "preemptible_worker_machine_type" {
  type        = string
  description = "Specifies the machine type of preemptible worker nodes to create"
  default     = "n1-standard-8"
}

variable "preemptible_worker_min_cpu_platform" {
  type        = string
  description = "The name of a minimum generation of CPU family for the preemptible worker"
  default     = "Intel Skylake"
}

variable "preemptible_worker_disk_type" {
  type        = string
  description = "The disk type of the primary disk attached to each preemptible worker node. One of 'pd-ssd' or 'pd-standard'."
  default     = "pd-ssd"
}

variable "preemptible_worker_disk_size" {
  type        = string
  description = "Size of the primary disk attached to each preemptible worker node, specified in GB."
  default     = 30
}






