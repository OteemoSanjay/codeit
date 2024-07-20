#!/bin/bash
# 01 - initial - jairams
# 02 - Add AWS CLI check

# Check if aws cli is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI not found. Please install AWS CLI first."
    exit 1
fi

clear

# Displays help options. 
Help()
{
   # Display Help
   echo "Displays IN PLAIN TEXT the Key-Value pairs for secrets in Secrets Manager"
   echo
   echo "Syntax: ./listSecrets.sh [-h|-s env/stack-secrets| -a]"
   echo "options:"
   echo "-h                     Print this message."
   echo "-s env/stack-secrets   Prints just secrets for that stack."
   echo "-a                     Prints all secrets in Secrets Manager (not advised)."
   echo
}


# Function to list all secrets
list_all_secrets() {
    aws secretsmanager list-secrets --query 'SecretList[*].Name' --output text
}

# Function to describe a secret and get key-value pairs
describe_secret() {
    local secret_name="$1"
    secret_value=$(aws secretsmanager get-secret-value --secret-id "$secret_name" --query 'SecretString' --output text)
    echo "Secret Name: $secret_name"
    echo "Key-Value Pairs:"
    echo "$secret_value" | jq
}

find_whitespaces() {
     local secret_name="$1"
     string=$(aws secretsmanager get-secret-value --secret-id "$secret_name" |  jq --raw-output '.SecretString')
     if [[ "$string" =~ \ |\' ]] ; then  echo "$secret_name" " WHITESPACEs FOUND - check the output for leading or trailing spaces."; else    echo "No whitespace found"; fi
     
}

# Get and parse options
while getopts ':as:h' opt; do
  case "$opt" in
    a)
    echo "Listing all secrets:"
    all_secrets=$(list_all_secrets)
    for secret in $all_secrets; do
        describe_secret "$secret"
    done
      ;;
    s)
      arg="$OPTARG"
      describe_secret ${OPTARG}
      find_whitespaces ${OPTARG}
      ;;
    h)
      Help
      exit 0
      ;;
  esac
done
shift "$(($OPTIND -1))"
