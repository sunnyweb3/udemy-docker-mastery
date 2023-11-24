provider "docker" {
  # No specific configuration needed for local Docker engine;
  # Terraform will use the local Docker API by default.
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "webhost1"
  ports {
    internal = 80
    external = 80
  }
}
