terraform {
  required_version = "= 1.1.5"
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "= 0.25.36"
    }
  }
}

provider snowflake {
  account = "<accountid>.<region>.<cloud>"
  role    = "ACCOUNTADMIN"
}
