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
  default = 10000 # Equivale al umbral de 10,000 solicitudes; ajustable según el tráfico esperado.
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
  default = 500 # Equivale a detectar actividad maliciosa o tráfico no deseado que está siendo bloqueado por las reglas de WAF
}

## Captcha Requests

variable "waf_captcharequests_error_evaluation_periods" {
  type    = number
  default = 2 # Periodos por cada evaluacion antes de generar la alarma 2 * 120 = 240
}

variable "waf_captcharequests_error_events_period" {
  type    = number
  default = 120 # Valor en segundos = 2 minutos
}

variable "waf_captcharequests_error_threshold" {
  type    = number
  default = 100 # Equivale Umbral de 100 solicitudes
}