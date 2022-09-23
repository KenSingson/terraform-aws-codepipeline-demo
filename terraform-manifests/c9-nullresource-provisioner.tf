# Create a Null Resource and Provisioners

resource "null_resource" "name" {
  depends_on = [
    module.ec2_public_bastion
  ]
  connection {
    type = "ssh"
    host = aws_eip.bastion_eip.public_ip
    user = "ec2-user"
    private_key = file("private-key/udemy-terraform-kp.pem")
  }

  # FILE PROVISIONERS
  # Used to Copy files to newly created resources
  provisioner "file" {
    source = "private-key/udemy-terraform-kp.pem"
    destination = "/tmp/udemy-terraform-kp.pem"
  }

  # REMOTE EXEC PROVISIONER
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/udemy-terraform-kp.pem"
    ]
  }
}