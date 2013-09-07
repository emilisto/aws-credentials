#!/bin/bash

AWS_BASE_DIR=~/.aws
CREDENTIALS_DIR=$AWS_BASE_DIR/credentials

function aws-credentials {
  name=$1

  if [[ -z $name ]]; then
    echo "Syntax: aws-credentials <name>"
    echo "where ~/.aws/credentials/<name>.csv is an IAM credentials file."

    echo "\nAvailable credentials:"
    pushd $CREDENTIALS_DIR > /dev/null
    for f in *; do
      echo "  $(echo $f | cut -d. -f1)"
    done
    popd > /dev/null
    return 1
  fi

  credential_file=$AWS_BASE_DIR/credentials/$name.csv
  if [[ ! -f $credential_file ]]; then
    echo "$credential_file does not exist."
    return 1
  fi

  IFS=, read username access_key secret_key < \
    <(tail -n 1 $credential_file | sed -s 's/"//g')

  export AWS_ACCESS_KEY=$access_key
  export AWS_SECRET_KEY=$secret_key
  export AWS_ACCESS_KEY_ID=$access_key
  export AWS_SECRET_ACCESS_KEY=$secret_key
  export AWS_CREDENTIAL_FILE=$credential_file
}
