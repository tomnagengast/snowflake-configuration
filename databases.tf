resource snowflake_database databases {
  name    = each.key
  comment = each.value.comment

  lifecycle {
    prevent_destroy = true
  }

  for_each = {
    "ANALYTICS" = {
      comment = ""
    }
    "CENSUS" = {
      comment = ""
    }
    "FIVETRAN" = {
      comment = ""
    }
    "SNOWFLAKE" = {
      comment = ""
    }
    "SNOWFLAKE_SAMPLE_DATA" = {
      comment = "TPC-H, OpenWeatherMap, etc"
    }
    "STITCH" = {
      comment = ""
    }
  }
}
