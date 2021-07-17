
resource "digitalocean_droplet" "goapp" {
  image = "docker-20-04"
  name = "goapp"
  region = "ams3"
  size = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "sudo apt install git",

      "git clone https://github.com/advantch/go-web-app",
      "docker-compose up -d --build",

      "cd go-web-app && docker-compose up -d --build",
      "docker-container ls"
    ]
  }
}