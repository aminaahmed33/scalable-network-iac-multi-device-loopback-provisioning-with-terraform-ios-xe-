variable "device_name" {
  description = "The name of the router"
}
variable "loopback_nums" {
  description = "List of loopback interface number to be created"
  type =map(string)
}