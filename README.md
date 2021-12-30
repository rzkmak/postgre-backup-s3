[![golang-pipeline](https://github.com/rzkmak/postgre-backup-s3/actions/workflows/release.yml/badge.svg)](https://github.com/rzkmak/postgre-backup-s3/actions/workflows/release.yml)

# postgre-backup-s3

### How to run

```
docker run -e AWS_SECRET_ACCESS_KEY=<AWS-SECRET-KEY> -e AWS_ACCESS_KEY_ID=<AWS-ACCESS-KEY> -e AWS_S3_BUCKET=<AWS-S3-BUCKET> -e AWS_S3_BUCKET_PREFIX=<AWS-S3-BUCKET-PREFIX> -e PGDATABASE=<DBNAME> -e PGUSER=<DBUSER> -e PGPASSWORD=<DBPASSWORD> -e PGHOST=<DBHOST> -e PGPORT=5432 rzkmak/postgre-backup-s3:<PGVERSION>
```

see available version in: https://hub.docker.com/r/rzkmak/postgre-backup-s3/tags

### TODO
- [ ] add multiple version postgre using matrix

Any contribution is welcomed and appreciated.