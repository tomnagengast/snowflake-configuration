# Hex Snowflake Configuration

## Terraform

## Permifrost

```sh
# Load environment variables
export $(cat .env | sed 's/#.*//g' | xargs)

# Run Terraform
terraform init -upgrade
terraform plan
terraform apply -auto-approve

# Run permifrost
permifrost -v run --dry --diff permifrost.yml
```

## Resources

- [Terraform Module: `chanzuckerberg/snowflake`](https://registry.terraform.io/providers/chanzuckerberg/snowflake/latest/docs)

## TODO

- Implement in https://github.com/teej/titan
