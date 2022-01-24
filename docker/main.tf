terraform {
  required_providers {
    # We recommend pinning to the specific version of the Docker Provider you're using
    # since new versions are released frequently
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_container" "ubuntu" {
    name = "ubuntu1"
    image = "ubuntu:18.04"
    command = ["/bin/bash","-c","while true; do sleep 60000; done"]
    provisioner "local-exec" {
      command = "echo ${docker_container.ubuntu.network_data[0].ip_address} >> inventario.txt"
    }
}