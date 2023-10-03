include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::ssh://git@git.zias.io/ops/tf-billing-db.git//tf-modules?ref=v1.1.8"
  extra_arguments "conditional_vars" {
    commands = get_terraform_commands_that_need_vars()
    required_var_files = [
      "${get_parent_terragrunt_dir()}/../common.tfvars"
    ]
  }
}

inputs = {
centos_user = true
triple_i1_zpool_import = true
triple_i2_zpool_import = true
centos73_ami = "ami-067a270ced47a9a22"
triple_i3_zpool_import = true
  shard_name = "dbs7"
  active_proxy = true
  standby_proxy = true
  triple_i1 = true
  triple_i2 = true
  triple_i3 = true
  triple_migration_1 = false
  database_vol_type = "gp3"
  database_vol_size = "12000"
  nvme_enabled = true
  instance_type = "r5.12xlarge"
  triple_i1_instance_type = "r5.12xlarge"
  triple_i2_instance_type = "r5.12xlarge"
  triple_i3_instance_type = "r5.12xlarge"
  proxy_instance_type = "c5a.4xlarge"
  mysql_undo_redo_volume_size = "300"

  _extra_tags = {
    map-migrated = "d-server-01m63ppym242wj"
    db = "mysql"
    product = "billing_db"
    service_component = "db"
  }
}
