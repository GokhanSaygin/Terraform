#locals block
#variable block

#locals {
#    users = ["David", "Tom", "Bobby"]
#}

variable "dev_users" {
    type = list
    default = ["Liam", "Oliver", "Elijah", "James", "William", "Benjamin", "Lucas", "Henry"] 
}

variable "ops_users" {
    type = list
    default = ["Theodore", "Jack", "Levi", "Alexander", "Jackson", "Mateo"]
}

variable "monitoring_users" {
    type = list
    default = ["Daniel", "Michael", "Mason", "Sebastian", "Ethan"]
}

variable "data_users" {
    type = list
    default = ["Logan", "Owen", "Samuel", "Jacob", "Asher", "Aiden"]
}

variable "admin_users" {
    type = list
    default = ["John", "Joseph", "Wyatt", "David", "Leo", "Luke", "Julian"]
}