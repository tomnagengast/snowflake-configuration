resource snowflake_network_policy network_policies {
  name            = each.key
  comment         = lookup(each.value, "comment", null)
  allowed_ip_list = lookup(each.value, "allowed_ip_list", [])
  blocked_ip_list = lookup(each.value, "blocked_ip_list", [])

  for_each = {
    SERVICE_ACCOUNT_POLICY = {
      comment         = "Policy whitelisting all IPs for external tool connections."
      allowed_ip_list = [
        # Census https://docs.getcensus.com/sources/snowflake#allowed-ip-addresses
        "34.216.163.241",
        "54.212.243.205",

        # dbt Cloud https://docs.getdbt.com/docs/dbt-cloud/cloud-configuring-dbt-cloud/connecting-your-database
        "52.45.144.63",
        "54.81.134.249",
        "52.22.161.231",

        # Fivetran https://fivetran.com/docs/getting-started/ips#fivetranipaddresses
        "35.80.36.104/29", # [AWS IP ADDRESSES (CIDR)] US (Oregon)
        "35.227.135.0/29", # [GCP IP ADDRESSES (CIDR)] US (Oregon)
        "52.0.2.4/32", # [GCP IP ADDRESSES (CIDR) / AWS IP ADDRESSES (CIDR)] US (N. Virginia)
        "3.239.194.50", # [AWS IP ADDRESSES (CIDR)] US (N. Virginia)
        "3.239.194.48/29", # [AWS IP ADDRESSES (CIDR)] US (N. Virginia)
        "35.234.176.144/29", # [GCP IP ADDRESSES (CIDR)] US (N. Virginia)

        # Hex https://learn.hex.tech/docs/connect-to-data/allow-connections-from-hex-ip-addresses
        "3.129.36.245",
        "3.13.16.99",
        "3.18.79.139",

        # Stitch https://www.stitchdata.com/docs/security/stitch-ip-addresses
        "52.23.137.21/32",
        "52.204.223.208/32",
        "52.204.228.32/32",
        "52.204.230.227/32",
      ]
    }
    USER_ACCOUNT_POLICY = {
      comment         = "Policy allowing users to bypass the SERVICE_ACCOUNT_POLICY policy. Should not be activated, but rather attached at the user level."
      allowed_ip_list = ["0.0.0.0/0"]
    }
  }
}
