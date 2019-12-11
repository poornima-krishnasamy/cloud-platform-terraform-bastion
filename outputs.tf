output "authorized_keys_manager" {
  description = "authorized_keys rendered template used by kops"
  value = data.template_file.authorized_keys_manager.rendered
}
