# backup-s3

Backup photos to Amazon S3

## Usage

```
./backup-photo.rb
```

### Setup

AWS CLI must be configured (`aws configure`).

Copy `lifecycle.sample.json` to `lifecycle.json` and:

```
./init_s3_backup.bash
```

## Requirements

* [aws-cli](http://aws.amazon.com/cli/)
