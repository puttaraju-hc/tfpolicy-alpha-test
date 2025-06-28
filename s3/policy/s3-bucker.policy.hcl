
policy {
    enforcement_level = mandatory
}

resource_policy "aws_s3_bucket_public_access_block" "public-access-field-check"{
    enforce{
        condition = core::try(attrs.bucket) != ""
    }
}
