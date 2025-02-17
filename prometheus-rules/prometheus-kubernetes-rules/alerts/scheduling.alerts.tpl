groups:
- name: scheduling.alerts
  rules:
  - alert: PodSchedulingInsufficientCPU
    expr: sum(rate(kube_pod_failed_scheduling_cpu_total[30m]) > 0) by (namespace, pod_name)
    for: 5m
    labels:
      tier: {{ required ".Values.tier missing" .Values.tier }}
      service: scheduling
      severity: info
      context: cpu
      meta: "{{`{{ $labels.namespace }}`}}/{{`{{ $labels.pod_name }}`}}"
    annotations:
      summary: Scheduling of Pod failed due to insufficient cpu
      description: The pod {{`{{ $labels.namespace }}`}}/{{`{{ $labels.pod_name }}`}} failed to be scheduled. Insuffient CPU!
      
  - alert: PodSchedulingInsufficientCPU
    expr: sum(rate(kube_pod_failed_scheduling_cpu_total[30m]) > 0) by (namespace, pod_name)
    for: 1h
    labels:
      tier: {{ required ".Values.tier missing" .Values.tier }}
      service: scheduling
      severity: warning
      context: cpu
      meta: "{{`{{ $labels.namespace }}`}}/{{`{{ $labels.pod_name }}`}}"
    annotations:
      summary: Scheduling of Pod failed due to insufficient cpu
      description: The pod {{`{{ $labels.namespace }}`}}/{{`{{ $labels.pod_name }}`}} failed to be scheduled. Insuffient CPU!
      
  - alert: PodSchedulingInsufficientMemory
    expr: sum(rate(kube_pod_failed_scheduling_memory_total[30m]) > 0) by (namespace, pod_name)
    for: 5m
    labels:
      tier: {{ required ".Values.tier missing" .Values.tier }}
      service: scheduling
      severity: info
      context: cpu
      meta: "{{`{{ $labels.namespace }}`}}/{{`{{ $labels.pod_name }}`}}"
    annotations:
      summary: Scheduling of Pod failed due to insufficient memory
      description: The pod {{`{{ $labels.namespace }}`}}/{{`{{ $labels.pod_name }}`}} failed to be scheduled. Insuffient memory!
      
  - alert: PodSchedulingInsufficientMemory
    expr: sum(rate(kube_pod_failed_scheduling_memory_total[30m]) > 0) by (namespace, pod_name)
    for: 1h
    labels:
      tier: {{ required ".Values.tier missing" .Values.tier }}
      service: scheduling
      severity: warning
      context: cpu
      meta: "{{`{{ $labels.namespace }}`}}/{{`{{ $labels.pod_name }}`}}"
    annotations:
      summary: Scheduling of Pod failed due to insufficient memory
      description: The pod {{`{{ $labels.namespace }}`}}/{{`{{ $labels.pod_name }}`}} failed to be scheduled. Insuffient memory!
