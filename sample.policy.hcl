policy {}
resource_policy "aws_default_security_group" "default_security_group_violations" {
    locals {
        ingress = core::try(attrs.ingress, {})
        egress = core::try(attrs.egress, {})
    }
    enforce {
        condition = local.ingress != {} || local.egress != {}
        error_message = "VPC default security group should not allow inbound and outbound traffic."
    }
}
resource_policy "aws_security_group_rule" "security_group_violations" {
    locals {
        security_group_id = core::try(attrs.security_group_id, "")
    }
    enforce {
        condition = local.security_group_id != "" && (core::regex("aws_default_security_group.(.*).id",local.security_group_id) != null || core::regex("aws_vpc.(.*).default_security_group_id$", local.security_group_id) != null || core::regex("aws_default_vpc.(.*).default_security_group_id$", local.security_group_id) != null)
        error_message = "VPC default security group should not allow inbound and outbound traffic."
    }
}
resource_policy "aws_vpc_security_group_ingress_rule" "ingress_rule_violations" {
    locals {
        security_group_id = core::try(attrs.security_group_id, "")
    }
    enforce {
        condition = local.security_group_id != "" && (core::regex("aws_default_security_group.(.*).id",local.security_group_id) != null || core::regex("aws_vpc.(.*).default_security_group_id$", local.security_group_id) != null || core::regex("aws_default_vpc.(.*).default_security_group_id$", local.security_group_id) != null)
        error_message = "VPC default security group should not allow inbound and outbound traffic."
    }
}
resource_policy "aws_vpc_security_group_egress_rule" "egress_rule_violations" {
    locals {
        security_group_id = core::try(attrs.security_group_id, "")
    }
    enforce {
        condition = local.security_group_id != "" && (core::regex("aws_default_security_group.(.*).id",local.security_group_id) != null || core::regex("aws_vpc.(.*).default_security_group_id$", local.security_group_id) != null || core::regex("aws_default_vpc.(.*).default_security_group_id$", local.security_group_id) != null)
        error_message = "VPC default security group should not allow inbound and outbound traffic."
    }
}
