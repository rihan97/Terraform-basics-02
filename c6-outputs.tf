
#terraform outputs values

# # the public ip of the ec2 instance 
# output "ec2_ip" {
#     value = aws_instance.myec2.public_ip
#     description = "ip address of the ec2 instance"
# }

# # ec2 instance public dns 
# output "ec2_dns" {
#     value = aws_instance.myec2.public_dns
#     description = "dns address of the ec2 instance "
# }


# inside the for loop after the for, you can call it whatever, it is just a variable for iteration purposes to go through whole loop
# output - for the loop with list
output "for_output_list" {
    value = [for instance in aws_instance.myec2: instance.public_dns]   //for the 5 ec2 instances output the dns
    description = "for loop with a list"
}

# output - for the the loop with map
output "for_output_map" {
    value = {for instance in aws_instance.myec2: instance.public_ip => instance.public_dns}  //since with a map you only provide the key (instance.id) & after symbol => will be the value
    description = "for loop with a map"
}


# The for c, means for each count number 1,2,3 etc which is the count.index, it can be called whatever a,b or c etc provide c the count numbers dns in this case
# output - for the loop iwth map advanced
output "for_advanced_output_map2" {
    value = {for c, instance in aws_instance.myec2: c => instance.public_dns}
    description = "for loop with a map - advanced"
}


# when you use the count variable in your resource you can use the legacy splat expression with it
# output legacy Splat operator - returns the lsits
output "legacy_splat_instance_publicDns" {
    value = aws_instance.myec2.*.public_dns
    description = "legacy splat expression"
}


# the latest splat expression and how we can use it - splot show me everything
# for this local name resource myec2 many instances will be created you put the [*] after it
# output legacy generalised Splat Operator - returns the list
output "latest_splat_instance_publicDns" {
    value = aws_instance.myec2[*].public_dns
    description = "latest splat expression"
}