job "[[.envprefix]]-app2" {
  region = "[[.region]]"
  namespace = "vs"
  datacenters = [ "[[.datacenter]]" ]
  type = "service"

  group "test3" {
    network {
      port "http" {
        to = 80
      }
    }
    task "app2" {
      driver = "docker"

      config {
        image = "[[.docker_registry]]app2:[[.version_tag]]"
        ports = ["http"]

        auth {
          username = "[[.docker_registry_user]]"
          password = "[[.docker_registry_pw]]"
        }
        force_pull = "[[.force_pull]]"




      }
    }
  }
}