#!/bin/bash

set -ue

# local
script_dir="$(dirname "$0")"
data_dir="$(realpath "$script_dir/../data")"

export AWS_CONFIG_FILE="$HOME/.aws/config"
export AWS_CMD="aws"
export S3_REGION="ap-northeast-1"
export S3_BUCKET="${S3_REGION}-aereal-photo-backup"
export S3_LIFECYCLE_JSON="${data_dir}/lifecycle.json"

${AWS_CMD} s3 mb s3://${S3_BUCKET} --region ${S3_REGION}
${AWS_CMD} s3api put-bucket-lifecycle --bucket "${S3_BUCKET}" --lifecycle file://${S3_LIFECYCLE_JSON}
