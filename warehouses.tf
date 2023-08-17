resource snowflake_warehouse warehouses {
  name    = each.key
  comment = lookup(each.value, "comment", null)
  auto_suspend = lookup(each.value, "auto_suspend", null)
  warehouse_size = lookup(each.value, "warehouse_size", null)

  lifecycle {
    prevent_destroy = true
  }

  for_each = {
    "ADMIN" = {
      auto_suspend = 60
      comment = "Use for admin operations."
      warehouse_size = "X-Small"
    }
    "LOADING" = {
      auto_suspend = 600
      comment = "Use for loading data into source databases."
      warehouse_size = "X-Small"
    }
    "PUBLISHING" = {
      auto_suspend = 60
      comment = "Use for publishing tool operations."
      warehouse_size = "X-Small"
    }
    "REPORTING" = {
      auto_suspend = 600
      comment = "Use for reporting and BI tool operations."
      warehouse_size = "X-Small"
    }
    "TRANSFORMING" = {
      auto_suspend = 600
      comment = "Use for dbt and model development."
      warehouse_size = "X-Small"
    }
  }
}
