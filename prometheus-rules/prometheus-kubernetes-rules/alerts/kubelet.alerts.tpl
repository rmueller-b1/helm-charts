groups:
- name: kubelet.alerts
  rules:
  - alert: KubernetesKubeletManyDown
    expr: count(up{job="kube-system/kubelet"}) - sum(up{job="kube-system/kubelet"}) > 2
    for: 1h
    labels:
      tier: {{ required ".Values.tier missing" .Values.tier }}
      service: kubelet
      severity: critical
      context: kubelet
      dashboard: kubernetes-health
      playbook: docs/support/playbook/kubernetes/k8s_node_not_ready.html
    annotations:
      description: Many Kubelets are DOWN
      summary: More than 2 Kubelets are DOWN

  - alert: KubernetesKubeletDown
    expr: up{job="kube-system/kubelet"} == 0
    for: 1h
    labels:
      tier: {{ required ".Values.tier missing" .Values.tier }}
      service: kubelet
      severity: warning
      context: kubelet
      meta: "{{`{{ $labels.instance }}`}}"
      dashboard: kubernetes-health
      playbook: docs/support/playbook/kubernetes/k8s_node_not_ready.html
    annotations:
      description: Kublet on {{`{{ $labels.instance }}`}} is DOWN.
      summary: A Kubelet is DOWN

  - alert: KubernetesKubeletScrapeMissing
    expr: absent(up{job="kube-system/kubelet"})
    for: 1h
    labels:
      tier: {{ required ".Values.tier missing" .Values.tier }}
      service: kubelet
      severity: warning
      context: kubelet
      dashboard: kubernetes-health
      playbook: docs/support/playbook/kubernetes/k8s_node_scrape_missing.html
    annotations:
      description: Kubelets cannot be scraped. Status unknown.
      summary: Kubelets failed to be scraped.

  - alert: KubernetesKubeletTooManyPods
    expr: kubelet_running_pod_count > 225
    for: 1h
    labels:
      tier: {{ required ".Values.tier missing" .Values.tier }}
      service: kubelet
      severity: warning
      context: kubelet
      meta: "{{`{{ $labels.instance }}`}}"
      dashboard: kubernetes-node?var-server={{`{{$labels.instance}}`}}
    annotations:
      description: Kubelet is close to pod limit
      summary: Kubelet {{`{{ $labels.instance }}`}} is running {{`{{ $value }}`}} pods, close to the limit of 250

  - alert: KubernetesKubeletFull
    expr: kubelet_running_pod_count >= 250
    for: 1h
    labels:
      tier: {{ required ".Values.tier missing" .Values.tier }}
      service: kubelet
      severity: warning
      context: kubelet
      meta: "{{`{{ $labels.instance }}`}}"
      dashboard: kubernetes-node?var-server={{`{{ $labels.instance }}`}}
    annotations:
      description: Kubelet is full
      summary: Kubelet Kubelet {{`{{$labels.instance}}`}} is running {{`{{ $value }}`}} pods. That's too much!

  - alert: KubernetesKubeletFull
    expr: kubelet_running_pod_count >= 250
    for: 1h
    labels:
      tier: {{ required ".Values.tier missing" .Values.tier }}
      service: kubelet
      severity: warning
      context: kubelet
      meta: "{{`{{ $labels.instance }}`}}"
      dashboard: kubernetes-node?var-server={{`{{ $labels.instance }}`}}
    annotations:
      description: Kubelet is full
      summary: Kubelet {{`{{ $labels.instance }}`}} is running {{`{{ $value }}`}} pods. That's too much!

  - alert: KubernetesKubeletDockerHangs
    expr: rate(kubelet_docker_operations_timeout[5m])> 0
    for: 15m
    labels:
      tier: {{ required ".Values.tier missing" .Values.tier }}
      service: kubelet
      severity: warning
      context: docker
      meta: "{{`{{ $labels.instance }}`}}"
      dashboard: kubernetes-node?var-server={{`{{$labels.instance}}`}}
      playbook: docs/support/playbook/kubernetes/k8s_node_not_ready.html
    annotations:
      description: Docker hangs!
      summary: Docker on {{`{{$labels.instance}}`}} is hanging

  - alert: KubernetesHighNumberOfGoRoutines
    expr: go_goroutines{job="kube-system/kubelet"} > 5000
    for: 5m
    labels:
      tier: {{ required ".Values.tier missing" .Values.tier }}
      service: k8s
      severity: warning
      context: kubelet
      meta: "{{`{{ $labels.instance }}`}}"
    annotations:
      description: Kublet on {{`{{ $labels.instance }}`}} might be unresponsive due to a high number of go routines
      summary: High number of Go routines

  - alert: KubernetesPredictHighNumberOfGoRoutines
    expr: abs(predict_linear(go_goroutines{job="kube-system/kubelet"}[1h], 2*3600)) > 10000
    for: 5m
    labels:
      tier: {{ required ".Values.tier missing" .Values.tier }}
      service: k8s
      severity: warning
      context: kubelet
      meta: "{{`{{ $labels.instance }}`}}"
    annotations:
      description: Kublet on {{`{{$labels.instance}}`}} might become unresponsive due to a high number of go routines within 2 hours
      summary: Predicting high number of Go routines
