policy{
    enforcement_level = advisory
}

resource_policy "aws_ebs_volume" "ebs_encrypted"{
    enforce{
        condition = attrs.encrypted == true
    }
}
