{{- define "ppeagent.deploymentLabels" }}
app.kubernetes.io/name: {{ .Values.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: {{ .Values.name }}
app.kubernetes.io/part-of: {{ .Values.deploymentName }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
{{- end }}