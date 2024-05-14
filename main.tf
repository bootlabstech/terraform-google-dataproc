resource "google_dataproc_cluster" "mycluster" {
  name     = var.name
  region   =var.region
  project = var.project
  graceful_decommission_timeout = var.graceful_decommission_timeout
  labels = {
    project_id = var.project
  }
  depends_on = [ google_project_iam_binding.kms_dataproc,
                 google_project_iam_binding.network_binding1000,
                 google_project_iam_binding.serviceaccount_access,
                  ]

  cluster_config {
    encryption_config {
      kms_key_name = var.kms_key
    }
    staging_bucket = var.staging_bucket

    master_config {
      num_instances = var.num_instances_master
      machine_type  = var.machine_type_master
      disk_config {
        boot_disk_type    = var.boot_disk_type_master
        boot_disk_size_gb =var.boot_disk_size_gb_master
      }
    }

    worker_config {
      num_instances    = var.num_instances_worker
      machine_type     = var.machine_type_worker
      min_cpu_platform = var.min_cpu_platform_worker
      disk_config {
        boot_disk_size_gb = var.boot_disk_size_gb_worker
        num_local_ssds    = 1
      }
    }

    preemptible_worker_config {
      num_instances     = var.preemptible_worker_num_instance
    }

    # Override or set some custom properties
    software_config {
      image_version =var.image_version
      override_properties = {
        "dataproc:dataproc.allow.zero.workers" = "true"
      }
    }

    gce_cluster_config {
      internal_ip_only = true
      tags = ["foo", "bar"]
      # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
      service_account = "${data.google_project.service_project.number}-compute@developer.gserviceaccount.com"
       service_account_scopes = [ # forces replacement
                   "https://www.googleapis.com/auth/cloud.useraccounts.readonly",
                   "https://www.googleapis.com/auth/devstorage.read_write",
                   "https://www.googleapis.com/auth/logging.write",
                   "https://www.googleapis.com/auth/cloud-platform",
                    # (1 unchanged element hidden)
                ]
      # network = "projects/host-project-dev-env-mum/global/networks/shared-vpc-development-01"
      subnetwork = var.subnetwork
    }

    # You can define multiple initialization_action blocks
    initialization_action {
      script      = var.script
      timeout_sec = var.timeout_sec
    }
  }
}
data "google_project" "service_project" {
  project_id = var.project
}

resource "google_project_iam_binding" "network_binding1000" {
  count   = 1
  project = var.host_project
  role    = "roles/compute.networkUser"
  members = [
    "serviceAccount:service-${data.google_project.service_project.number}@dataproc-accounts.iam.gserviceaccount.com",
    "serviceAccount:service-${data.google_project.service_project.number}@compute-system.iam.gserviceaccount.com",
    
  ]
}
resource "google_project_iam_binding" "kms_dataproc" {
  count   = 1
  project =var.project
  role    = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:service-${data.google_project.service_project.number}@dataproc-accounts.iam.gserviceaccount.com",
    "serviceAccount:service-${data.google_project.service_project.number}@compute-system.iam.gserviceaccount.com",
    ]
}
resource "google_project_iam_binding" "serviceaccount_access" {
  count   = 1
  project =var.project
  role    = "roles/compute.admin"
  members = [
    "serviceAccount:${data.google_project.service_project.number}-compute@developer.gserviceaccount.com",
    
    ]
}


