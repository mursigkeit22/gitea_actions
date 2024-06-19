job "[[.envprefix]]-app1" {
  region = "[[.region]]"
  namespace = "vs"
  datacenters = [ "[[.datacenter]]" ]
  type = "service"

  group "test" {
    network {
      port "http" {
        to = 80
      }
    }
    task "app1" {
      driver = "docker"

      config {
        image = "[[.docker_registry]]app1:[[.version_tag]]"
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