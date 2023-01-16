#declaring our ec2 instances
resource "aws_instance" "myec2" {
  ami           = data.aws_ami.amz-linux2.id
  # instance_type = var.instance_type //// this is hard allocated variable
  instance_type = var.instance_type_list[0]   // this is for a list
  # instance_type = var.instance_type_map["dev"]   // this is for a map
  key_name = var.instance_keypair
  user_data = file("/Users/rayhanalam/Documents/Training/Terraform/Terraform-basics-/User-data/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  count = 5  // either copy this whole block 5 times or use this count, this also has index variable 
  tags = {
    Name = "EC2-instance-${count.index}"   //starts with 0 till 4
  }
}
