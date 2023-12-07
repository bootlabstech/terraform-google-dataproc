variable "name" {
    type = string
    description = "name of dataproc cluster"
}
variable "project" {
    type = string
    description = "project id " 
}
variable "region" {
    type=string
    description = "region where u want to create "
  
}
variable "graceful_decommission_timeout" {
    type = string
    description = "graceful_decommission_timeout"
    default = "120s" 
}
variable "staging_bucket" {
    type = string
    description = "name of that already created" 
}
variable "num_instances_worker" {
    type = number
    description = "number of instance on worker node"
}
variable "machine_type_worker" {
    type=string
    description = "machine type for worker node "
  
}
variable "boot_disk_size_gb_worker" {
    type=number
    description = "boot disk size on gb for worker node "
  
}
variable "num_instances_master" {
    type=number
    description = "no of instance on master node "
  
}
variable "boot_disk_size_gb_master" {
    type = number
    description = "size of boot disk on gb"
  
}
variable "boot_disk_type_master" {
    type=string
    description = "boot disk type"
  
}
variable "machine_type_master" {
    type = string
    description = "machine type "
  
}
variable "min_cpu_platform_worker" {
    type = string
    description = "cpu platform"
    default = "Intel Skylake"
  
}
variable "image_version" {
    type = string
    description = "image version of os "
}
variable "service_account" {
    type=string
    description = "service account of project"
}
variable "subnetwork" {
    type = string
    description = "subnetwork "
  
}
variable "script" {
    type=string
    description = "script"
  default = "gs://dataproc-initialization-actions/stackdriver/stackdriver.sh"
}
variable "timeout_sec" {
    type = number
    description = "timeout second "
    default = 500
  
}
variable "preemptible_worker_num_instance" {
  type        = number
  description = "Specifies the number of preemptible worker nodes to create"
  default = 0
}