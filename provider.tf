
provider "google" {
  credentials = file("~/.gcloud/.imbrou.json")
  project = "imbrou-184013"
  region  = "europe-west9"
}

