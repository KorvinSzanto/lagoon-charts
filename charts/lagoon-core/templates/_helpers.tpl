{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "lagoon-core.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "lagoon-core.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "lagoon-core.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "lagoon-core.labels" -}}
helm.sh/chart: {{ include "lagoon-core.chart" . }}
{{ include "lagoon-core.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "lagoon-core.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lagoon-core.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}



{{/*
Create the name of the service account to use for api.
*/}}
{{- define "lagoon-core.api.serviceAccountName" -}}
{{- if .Values.api.serviceAccount.create }}
{{- default (include "lagoon-core.api.fullname" .) .Values.api.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.api.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name for api.
*/}}
{{- define "lagoon-core.api.fullname" -}}
{{- include "lagoon-core.fullname" . }}-api
{{- end }}

{{/*
Common labels api
*/}}
{{- define "lagoon-core.api.labels" -}}
helm.sh/chart: {{ include "lagoon-core.chart" . }}
{{ include "lagoon-core.api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels api
*/}}
{{- define "lagoon-core.api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lagoon-core.name" . }}
app.kubernetes.io/component: {{ include "lagoon-core.api.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}



{{/*
Create a default fully qualified app name for api-db.
*/}}
{{- define "lagoon-core.apiDB.fullname" -}}
{{- include "lagoon-core.fullname" . }}-api-db
{{- end }}

{{/*
Common labels api-db
*/}}
{{- define "lagoon-core.apiDB.labels" -}}
helm.sh/chart: {{ include "lagoon-core.chart" . }}
{{ include "lagoon-core.apiDB.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels api-db
*/}}
{{- define "lagoon-core.apiDB.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lagoon-core.name" . }}
app.kubernetes.io/component: {{ include "lagoon-core.apiDB.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}



{{/*
Create a default fully qualified app name for api-redis.
*/}}
{{- define "lagoon-core.apiRedis.fullname" -}}
{{- include "lagoon-core.fullname" . }}-api-redis
{{- end }}

{{/*
Common labels api-redis
*/}}
{{- define "lagoon-core.apiRedis.labels" -}}
helm.sh/chart: {{ include "lagoon-core.chart" . }}
{{ include "lagoon-core.apiRedis.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels api-redis
*/}}
{{- define "lagoon-core.apiRedis.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lagoon-core.name" . }}
app.kubernetes.io/component: {{ include "lagoon-core.apiRedis.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}



{{/*
Create a default fully qualified app name for keycloak.
*/}}
{{- define "lagoon-core.keycloak.fullname" -}}
{{- include "lagoon-core.fullname" . }}-keycloak
{{- end }}

{{/*
Common labels keycloak
*/}}
{{- define "lagoon-core.keycloak.labels" -}}
helm.sh/chart: {{ include "lagoon-core.chart" . }}
{{ include "lagoon-core.keycloak.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels keycloak
*/}}
{{- define "lagoon-core.keycloak.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lagoon-core.name" . }}
app.kubernetes.io/component: {{ include "lagoon-core.keycloak.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}



{{/*
Create a default fully qualified app name for keycloak-db.
*/}}
{{- define "lagoon-core.keycloakDB.fullname" -}}
{{- include "lagoon-core.fullname" . }}-keycloak-db
{{- end }}

{{/*
Common labels keycloak-db
*/}}
{{- define "lagoon-core.keycloakDB.labels" -}}
helm.sh/chart: {{ include "lagoon-core.chart" . }}
{{ include "lagoon-core.keycloakDB.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels keycloak-db
*/}}
{{- define "lagoon-core.keycloakDB.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lagoon-core.name" . }}
app.kubernetes.io/component: {{ include "lagoon-core.keycloakDB.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}



{{/*
Create the name of the service account to use for broker.
*/}}
{{- define "lagoon-core.broker.serviceAccountName" -}}
{{- if .Values.broker.serviceAccount.create }}
{{- default (include "lagoon-core.broker.fullname" .) .Values.broker.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.broker.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name for broker.
*/}}
{{- define "lagoon-core.broker.fullname" -}}
{{- include "lagoon-core.fullname" . }}-broker
{{- end }}

{{/*
Common labels broker
*/}}
{{- define "lagoon-core.broker.labels" -}}
helm.sh/chart: {{ include "lagoon-core.chart" . }}
{{ include "lagoon-core.broker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels broker
*/}}
{{- define "lagoon-core.broker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lagoon-core.name" . }}
app.kubernetes.io/component: {{ include "lagoon-core.broker.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}