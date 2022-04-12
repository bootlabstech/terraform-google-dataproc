resource "google_dataproc_cluster" "mycluster" {
  name     = var.cluster_name
  region   = var.region
  project  = var.project
  labels   = var.labels
  provider = google-beta

  cluster_config {
   
    staging_bucket    = var.staging_bucket
    
    software_config {
      image_version   = var.cluster_version
  /*    optional_components = var.optional_components
      override_properties = {
        "dataproc:dataproc.allow.zero.workers"    = var.override_properties
    }*/
    }
    /*
    endpoint_config {
      enable_http_port_access = var.enable_http_port_access
    }
*/
    gce_cluster_config {
      subnetwork  = var.subnetwork 
      internal_ip_only = var.internal_ip_only
    }

    encryption_config {
      kms_key_name = var.kms_key_name
    }

    master_config {
      num_instances     = var.master_num_instances
      machine_type      = var.master_machine_type
      min_cpu_platform  = var.master_min_cpu_platform
      disk_config {
        boot_disk_type    = var.master_disk_type
        boot_disk_size_gb = var.master_disk_size
      }
    }

    worker_config {
      num_instances     = var.worker_num_instances
      machine_type      = var.worker_machine_type
      min_cpu_platform  = var.worker_min_cpu_platform
      disk_config {
        boot_disk_type    = var.worker_disk_type
        boot_disk_size_gb = var.worker_disk_size
      }
    }

    preemptible_worker_config {
      num_instances     = var.preemptible_worker_num_instance
      #machine_type      = var.preemptible_worker_machine_type
      #min_cpu_platform  = var.preemptible_worker_min_cpu_platform
      #disk_config {
      #  boot_disk_type    = var.preemptible_worker_disk_type
      #  boot_disk_size_gb = var.preemptible_worker_disk_size
      #}
    }
 }

}


