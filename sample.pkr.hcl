locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "mautic" {
  ami_name      = "Mautic-Trainocate-${local.timestamp}"
  instance_type = "t3.micro"
  region        = "ap-southeast-1"
  profile       = "terraform"
  source_ami_filter {
    filters = {
      name                = "Mautic-Trainocate-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["883779074323"]
  }
  ssh_username = "bitnami"
}

build {
  sources = ["source.amazon-ebs.mautic"]

}


