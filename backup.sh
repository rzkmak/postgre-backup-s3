#!/bin/bash

set -e

if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

if [ -z "${AWS_ACCESS_KEY_ID}" ]; then
  echo "Required env: AWS_ACCESS_KEY_ID"
  exit 1
fi

if [ -z "${AWS_SECRET_ACCESS_KEY}" ]; then
  echo "Required env: AWS_SECRET_ACCESS_KEY"
  exit 1
fi

if [ -z "${AWS_S3_BUCKET}" ]; then
  echo "Required env: AWS_S3_BUCKET"
  exit 1
fi

if [ -z "${AWS_S3_BUCKET_PREFIX}" ]; then
  echo "Required env: AWS_S3_BUCKET_PREFIX"
  exit 1
fi

if [ -z "${PGDATABASE}" ]; then
  echo "Required env: PGDATABASE"
  exit 1
fi

if [ -z "${PGUSER}" ]; then
  echo "Required env: PGUSER"
  exit 1
fi

if [ -z "${PGPASSWORD}" ]; then
  echo "Required env: PGPASSWORD"
  exit 1
fi

if [ -z "${PGHOST}" ]; then
  echo "Required env: PGHOST"
  exit 1
fi

if [ -z "${PGPORT}" ]; then
  echo "Required env: PGPORT"
  exit 1
fi

echo "start backup ${PGDATABASE} database@${PGHOST} ..."

pg_dump $PGDUMP_OPTIONS $PGDATABASE | aws s3 cp - s3://$AWS_S3_BUCKET/$AWS_S3_BUCKET_PREFIX/$(date +"%Y")/$(date +"%m")/$(date +"%d").dump || exit 2

echo "finish..."

exit 0