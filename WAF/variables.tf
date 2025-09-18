###############################
# Variables generales
###############################

variable "cloudfront_distribution" {
   description = "ID de la distribución de CloudFront a monitorear"
   type        = string
}

variable "project" {
  type = string
}

variable "bdo_name_service" {
  type = string
}

variable "purpose" {
  type = string
}

variable "bdo_environment" {
  type = string
}

variable "alarm_actions" {
  type        = list(string)
  default     = []
  description = "Lista de ARNs a notificar cuando una alarma se dispare"
}

variable "ok_actions" {
  type        = list(string)
  default     = []
  description = "Lista de ARNs a notificar cuando una alarma vuelva a estado OK"
}

variable "resource_adicional_tags" {
  type        = map(string)
  default     = {}
  description = "Etiquetas adicionales no obligatorias"
}

variable "resource_tags" {
  type        = map(string)
  default     = {}
  description = "Etiquetas Bdo - Etiquetas Aval"
}

variable "sns_topic_arn" {
  type        = string
  description = "SNS topic ARN para notificaciones"
}


###############################
# Variables por métrica
###############################

## Allowed Requests

variable "waf_allowedrequests_error_evaluation_periods" {
  type    = number
  default = 3 # Periodos por cada evaluacion antes de generar la alarma 3 * 120 = 360
}

variable "waf_allowedrequests_error_events_period" {
  type    = number
  default = 120 # Valor en segundos = 2 minutos
}

variable "waf_allowedrequests_error_threshold" {
  type    = number
  default = 5 # Equivale al 5% de tasa de error durante los periodos validados
}

## Blocked Requests

variable "waf_blockedrequests_error_evaluation_periods" {
  type    = number
  default = 3 # Periodos por cada evaluacion antes de generar la alarma 3 * 120 = 360
}

variable "waf_blockedrequests_error_events_period" {
  type    = number
  default = 120 # Valor en segundos = 2 minutos
}

variable "waf_blockedrequests_error_threshold" {
  type    = number
  default = 5 # Equivale al 5% de tasa de error durante los periodos validados
}

## Captcha Requests

variable "waf_captcharequests_error_evaluation_periods" {
  type    = number
  default = 3 # Periodos por cada evaluacion antes de generar la alarma 3 * 120 = 360
}

variable "waf_captcharequests_error_events_period" {
  type    = number
  default = 120 # Valor en segundos = 2 minutos
}

variable "waf_captcharequests_error_threshold" {
  type    = number
  default = 5 # Equivale al 5% de tasa de error durante los periodos validados
}