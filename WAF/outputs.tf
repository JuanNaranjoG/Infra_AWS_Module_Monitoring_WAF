###############################
# Outputs
###############################

## Alarma por solicitudes permitidas (AllowedRequests)
output "waf_allowed_requests_alarm_name" {
  description = "Nombre de la alarma de AllowedRequests"
  value       = aws_cloudwatch_metric_alarm.waf_allowedrequests.alarm_name
}

## Alarma por solicitudes bloqueadas (BlockedRequests)
output "waf_blocked_requests_alarm_name" {
  description = "Nombre de la alarma de BlockedRequests"
  value       = aws_cloudwatch_metric_alarm.waf_blockedrequests.alarm_name
}

## Alarma por solicitudes CAPTCHA (CaptchaRequests)
output "waf_captcha_requests_alarm_name" {
  description = "Nombre de la alarma de CaptchaRequests"
  value       = aws_cloudwatch_metric_alarm.waf_captcharequests.alarm_name
}