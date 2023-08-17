resource snowflake_role roles {
  name    = each.key
  comment = lookup(each.value, "comment", null)

  lifecycle {
    prevent_destroy = true
  }

  for_each = {
    "LOADER" = {
      comment = "Loader role can create and manage objects in the source databases."
    }
    "PUBLISHER" = {
      comment = "Publisher role can read from the analytics database, as well as create and manage objects publisher databases."
    }
    "REPORTER" = {
      comment = "Reporter role can read from the analytics database."
    }
    "TRANSFORMER_READONLY" = {
      comment = "A read-only mirror of the Transformer role."
    }
    "TRANSFORMER" = {
      comment = "Transformer role can read from source and publisher databases, as well as create and manage objects in the analytics database for model development."
    }
  }
}
