### linkedin_advanced/01-remote-state

terraform init \
    -backend-config="bucket=red30-tfstate" \
    -backend-config="key=red30/ecommerceapp/app.state" \
    -backend-config="region=us-east-2" \
    -backend-config="dynamodb_table=red30-tfstatelock" \
    -backend-config="access_key=1234" \
    -backend-config="secret_key=1234"