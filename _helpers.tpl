{{- define "velonx12.name" -}}
velonx12
{{- end -}}

{{- define "velonx12.fullname" -}}
{{ include "velonx12.name" . }}-{{ .Release.Name }}
{{- end -}}
