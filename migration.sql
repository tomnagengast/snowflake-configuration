-- ✅ Enable ALLOW_CLIENT_MFA_CACHING --
show parameters for account;
alter account set ALLOW_CLIENT_MFA_CACHING = true;

-- Check that TOM_NAGENGAST was created successfully --
show users;
-- Adding ACCOUNTADMIN to TOM_NAGENGAST
-- Change password
alter user tom_nagengast reset password;
-- Which roles does ACCOUNTADMIN belong to?
show roles like 'ACCOUNTADMIN'

-- Create ADMIN warehouse --
-- What do the other warehouses look like?
show warehouses;

-- check that users have the USER_ACCOUNT_POLICY applied --
show parameters like 'network_policy' in user tom_nagengast;
