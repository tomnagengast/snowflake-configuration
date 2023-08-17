resource snowflake_network_policy_attachment network_policy_attachments {
  network_policy_name = each.key
  set_for_account     = lookup(each.value, "set_for_account", null)
  users               = lookup(each.value, "users", [])

  for_each = {
    SERVICE_ACCOUNT_POLICY = {
      set_for_account = false # TODO set to `true` to activate
    }
    USER_ACCOUNT_POLICY = {
      set_for_account = false
      # users           = [
      #   "TOM_NAGENGAST",
      # ]
    }
  }
}
