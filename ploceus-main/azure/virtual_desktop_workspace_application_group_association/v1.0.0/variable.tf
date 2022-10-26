#windows VDI App Groups Variable
variable "association_variable" {
  type = map(object({
    app_group = string
    workspace = string
  }))
}
