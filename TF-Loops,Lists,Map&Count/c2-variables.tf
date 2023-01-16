#input variables

#aws region
variable "aws_region" {
    description = "Region in which AWS Resources to be created"
    type = string
    default = "eu-west-2"
}

#aws instance type
variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2.micro"
}

#aws EC2 instance key pair
variable "instance_keypair" {
    description = "keypair that needs to be associated with the EC2 instance"
    type = string
    default = "london.tf"

}

#aws EC2 instance type - list 
variable "instance_type_list"{
    description = "The EC2 instance type"
    type = list(string)
    default = ["t2.micro", "t3.micro", "t3.large"]
}

#aws EC2 instance type map
variable "instance_type_map"{
    description = "The EC2 instance type"
    type = map
    default = {
        "dev" = "t2.micro"
        "test" = "t3.micro"
        "prod" = "t3.large"
    }
}