#!/usr/bin/env ruby

HOME          = '/Users/aereal'
SOURCE_DIR    = "#{HOME}/Pictures/2014"
S3_REGION     = 'ap-northeast-1'
S3_BUCKET     = "#{S3_REGION}-aereal-photo-backup"
S3_BUCKET_URL = "s3://#{S3_BUCKET}"
AWS_CMD       = "#{HOME}/.anyenv/envs/pyenv/bin/pyenv exec aws"

def aws_cli(*args)
  system "#{HOME}/.anyenv/envs/pyenv/bin/pyenv", "exec", "aws", *args
end

def logger
  @logger ||=
    begin
      require "logger"
      Logger.new($stdout)
    end
end

logger.info "Start backup photos to Amazon S3 #{S3_BUCKET_URL}"
aws_cli "s3", "sync", SOURCE_DIR, S3_BUCKET_URL, "--region", S3_REGION, "--delete", "--exclude", "*.DS_Store", "--exclude", "*.jpg"
logger.info "Finish backup photos to Amazon S3 #{S3_BUCKET_URL}"
