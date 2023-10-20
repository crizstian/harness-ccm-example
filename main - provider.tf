terraform {
  backend "gcs" {}
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}

