#Configure the GitLab Provider
provider "gitlab" {
    token = "${var.gitlab_token}"
    base_url = "https://gitlab.rebrainme.com/api/v4/"
}

# Add a project owned by the user
resource "gitlab_project" "sample_project"{
    name = "terraform_repository"
    visibility_level = "private"
}
# Add a deploy key to the project
resource "gitlab_deploy_key""sample_deploy_key" {
    project = "${gitlab_project.sample_project.id}"
    title = "terraform_repository"
    key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDr2oghQ62SYbzsLmaCzPF/yrSr9C4fk9w9ff4PUiGOfkGjchy7ij44cOM0jP91NTh/xaWZhPWHU2ZT4zg2Yu6R2YaI2bMgqppVGQWXDLek2CLnVb/HhKVvkwbQgjSILqIcTJlNqTLAJvx7m3ndvW3RyiJPOzNQHSzy6Cna3sMpCg484n+IeRIg6nJf35UixRjeC7MVqHwQ85iW6VI5yYAEU7An1wOvctctSrOK9GEL0FpmlxYw+JEwVCjj967sslrUNlVYQru4yqqabzT4PVXBhpjU+kSlFD+JxbSWYMoGSscOSgVN0+RPUTYEEyArp1l8vCRuPPZhjKChcLagr6MN root"
    can_push = "true"
}
