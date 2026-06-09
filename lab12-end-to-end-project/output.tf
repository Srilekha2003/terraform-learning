output "environment" {
  value = local.environment
}

output "vm_name" {
  value = module.vm.vm_name
}

output "bucket_name" {
  value = module.bucket.bucket_name
}

output "service_account" {
  value = module.service_account.email
}