resource snowflake_user users {
  name              = each.key
  comment           = lookup(each.value, "comment", null)
  default_role      = lookup(each.value, "default_role", null)
  default_warehouse = lookup(each.value, "default_warehouse", null)
  email             = lookup(each.value, "email", null)
  first_name        = lookup(each.value, "first_name", null)
  last_name         = lookup(each.value, "last_name", null)
  password          = lookup(each.value, "password", null)

  lifecycle {
    prevent_destroy = true
  }

  for_each = {
    "CENSUS_USER" = {
      comment           = "Service account for the Census application."
      default_role      = "PUBLISHER"
      default_warehouse = "PUBLISHING"
    }
    "DBT_CLOUD_USER" = {
      comment           = "Service account for the DBT Cloud application."
      default_role      = "TRANSFORMER"
      default_warehouse = "TRANSFORMING"
    }
    "FIVETRAN_USER" = {
      comment           = "Service account for the Fivetran application."
      default_role      = "LOADER"
      default_warehouse = "LOADING"
    }
    "STITCH_USER" = {
      comment           = "Service account for the Stitch application."
      default_role      = "LOADER"
      default_warehouse = "LOADING"
    }
    "HEX_USER" = {
      comment           = "Service account for the Hex application."
      default_role      = "REPORTER"
      default_warehouse = "REPORTING"
    }
    "TOM_NAGENGAST" = {
      comment           = "User account for Tom Nagengast."
      default_role      = "ACCOUNTADMIN"
      default_warehouse = "ADMIN"
      email             = "tnagengast@gmail.com"
    }
  }
}
