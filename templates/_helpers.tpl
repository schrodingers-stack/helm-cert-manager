{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "schtack.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Define common labels to add to the Schrödinger Stack templates.
*/}}
{{- define "schtack.labels" -}}
schtack.cloud: {{ true | quote}} 
schtack.cloud/addon: {{ include "schtack.chart" .context }}
helm.sh/chart: {{ include "schtack.chart" .context }}
app.kubernetes.io/managed-by: {{ .context.Release.Service }}
app.kubernetes.io/part-of: {{ .context.Chart.Name }}
{{- with .context.Values.schtack.additionalLabels }}
{{ toYaml . }}
{{- end }}
{{- end }}
