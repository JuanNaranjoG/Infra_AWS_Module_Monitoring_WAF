# 📊 Módulo de Monitoreo para WAF en AWS

Este módulo de **Terraform** permite configurar **alertas de monitoreo** en **Amazon CloudWatch** para de WAF. Las alertas supervisan errores del servidor, latencia de origen y errores en funciones Lambda@Edge, permitiendo detección temprana de problemas y acción preventiva.

---

## ✅ Requisitos

| Herramienta     | Versión mínima |
| --------------- | -------------- |
| Terraform       | >= 1.0         |
| AWS Provider    | ~> 5.0         |
| Random Provider | ~> 3.4.3       |

---

## 📁 Archivos principales

- **`main.tf`**: Configuración de recursos de CloudWatch (alarmas).
- **`output.tf`**: Variables de salida del módulo.
- **`variables.tf`**: Variables para personalización (nombres, umbrales, etc).

---

## 🔧 Configuración detallada

### Alarmas configuradas:

- **AllowedRequests** – Suma de solicitudes Permitidas:

```hcl
resource "aws_waf_metric_alarm" "waf_allowedrequests" {
  ...
}
```

- **BlockedRequests** – Suma de solicitudes Bloquedas:

```hcl
resource "aws_waf_metric_alarm" "waf_blockedrequests" {
  ...
}
```

- **CaptchaRequests** – Suma de solicitudes de Captcha:

```hcl
resource "aws_waf_metric_alarm" "waf_captcharequests" {
  ...
}
```

**Los threshold vienen por defecto y estos valores son los que se encuentran en el documento de lineamientos de monitoreo.**

---

## ⚙️ Parámetros de las variables threshold

| Variable                                                  | Valor        |
| --------------------------------------------------------- | ------------ |
| waf_allowedrequests_error_evaluation_periods              | 1            |
| waf_allowedrequests_error_events_period                   | 300 segundos |
| waf_allowedrequests_error_threshold                       | 10 (10%)     |
| waf_blockedrequests_error_evaluation_periods              | 1            |
| waf_blockedrequests_error_events_period                   | 300 segundos |
| waf_blockedrequests_error_threshold                       | 80           |
| waf_captcharequests_error_evaluation_periods              | 1            |
| waf_captcharequests_error_events_period                   | 300 segundos |
| waf_captcharequests_error_threshold                       | 0            |


---

## ⚙️ Parámetros configurables

| Parámetro             | Descripción                                             |
| --------------------- | ------------------------------------------------------- |
| `var.service`         | Nombre del servicio.                                    |
| `alarm_name`          | Nombre de la alarma.                                    |
| `comparison_operator` | Operador de comparación (e.g., `GreaterThanThreshold`). |
| `evaluation_periods`  | Cantidad de períodos de evaluación antes de activar.    |
| `metric_name`         | Nombre de la métrica monitoreada.                       |
| `namespace`           | Espacio de nombres de la métrica.                       |
| `period`              | Frecuencia de evaluación en segundos.                   |
| `statistic`           | Estadística usada (`Average`, `Sum`, etc).              |
| `threshold`           | Valor límite para activar la alerta.                    |
| `tags`                | Etiquetas del banco: `tag_environment`, `tag_app`, etc. |

---

## 🧪 Modo de uso

```hcl
module "waf_monitoring" {
  source                  = "git::git@github.com:bocc-principal/Infra_AWS_Module_Monitoring_WAF.git//WAF?ref=main"
  cloudfront_distribution = var.cloudfront_distribution
  project                  = var.project
  bdo_name_service         = var.bdo_name_service
  bdo_environment          = var.bdo_environment
  purpose                  = var.purpose

  sns_topic_arn            = var.sns_topic_arn
}
```

---

## 🧪 A tener en cuenta

Una vez creado el SNS Topic se debe dejar encryptado con su respectivo KMS

---

## 📝 Resource

# https://docs.aws.amazon.com/es_es/waf/latest/developerguide/waf-metrics.html

# Infra_AWS_Module_Monitoring_WAF
