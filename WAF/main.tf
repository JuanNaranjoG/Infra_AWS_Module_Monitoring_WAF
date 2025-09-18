###############################
# Alarmas CloudFront
###############################

# Alarmas de Allowed Requests

resource "aws_waf_metric_alarm" "waf_allowedrequests" {

  alarm_name          = "${var.project}-${var.bdo_name_service}-AllowedRequestsError-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.waf_allowedrequests_error_evaluation_periods
  metric_name         = "AllowedRequests"
  namespace           = "AWS/WAF"
  period              = var.waf_allowedrequests_error_events_period
  statistic           = "Sum"
  threshold           = var.waf_allowedrequests_error_threshold
  alarm_description   = "Errores Allowed Requests en el WAF"

  tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}

# Alarmas de Blocked Requests

resource "aws_waf_metric_alarm" "waf_blockedrequests" {

  alarm_name          = "${var.project}-${var.bdo_name_service}-BlockedRequestsError-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.waf_blockedrequests_error_evaluation_periods
  metric_name         = "BlockedRequests"
  namespace           = "AWS/WAF"
  period              = var.waf_blockedrequests_error_events_period
  statistic           = "Sum"
  threshold           = var.waf_blockedrequests_error_threshold
  alarm_description   = "Errores Blocked Requests en el WAF"

  tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}

# Alarmas de Captcha Requests

resource "aws_waf_metric_alarm" "waf_captcharequests" {

  alarm_name          = "${var.project}-${var.bdo_name_service}-CaptchaRequestsError-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.waf_captcharequests_error_evaluation_periods
  metric_name         = "CaptchaRequests"
  namespace           = "AWS/WAF"
  period              = var.waf_captcharequests_error_events_period
  statistic           = "Sum"
  threshold           = var.waf_captcharequests_error_threshold
  alarm_description   = "Errores Captcha Requests en el WAF"

  tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}