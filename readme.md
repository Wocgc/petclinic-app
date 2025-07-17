🚀 EKS 기반 GitOps 애플리케이션 배포 구성 (Argo CD)

📌 개요

이 레포는 AWS EKS 클러스터에서 Argo CD 기반 GitOps 방식으로 애플리케이션을 배포하도록 구성되어 있습니다.

Helm, Kustomize, Raw YAML을 조합하여 다양한 리소스를 배포하며, CI 파이프라인(GitHub Actions) 으로부터 전달받은 이미지 태그 변경 사항도 자동 반영됩니다.

🗂️ 폴더 구조

eks-petclinic/
├── app/             # Petclinic 앱 배포 정의 (CI가 이미지 태그 변경)
├── web/             # Web 프론트엔드 구성 (CI가 이미지 태그 변경)
├── monitoring/      # Prometheus, Grafana, Node Exporter 등
├── efk/             # Elasticsearch, Fluentd, Kibana 구성
├── ingress/         # ALB Ingress 설정 및 Helm values
├── hpa/             # HPA 정의 (CPU/Memory 기반 오토스케일링)
├── autoscaler/      # Cluster Autoscaler 설정
├── dashboard/       # Kubernetes Dashboard 배포
├── apps/            # Argo CD에서 사용하는 Application 선언들
├── role/            # IAM Role 및 정책 JSON
└── whatap/          # Whatap K8s Agent 설정

🧰 사용 기술

Argo CD

Kustomize

Helm

Raw Kubernetes YAML

GitHub Actions (GitOps 트리거 목적)

🧠 GitOps 구성 방식

항목

설명

GitOps Tool

Argo CD

앱 정의 방식

Raw YAML, Helm 혼합 사용

앱 배포 경로

app/, web/, monitoring/ 등

Argo CD 앱 정의

apps/ 아래 .yaml 파일로 각각 분리

이미지 자동 변경 위치

app/kustomization.yaml, web/kustomization.yaml

자동 커밋 소스

petclinic-app CI 파이프라인

Argo CD 설치 방식

Helm Chart 기반 설치

🔄 GitOps 동작 흐름

Petclinic CI가 Docker 이미지를 빌드하고 ECR에 푸시함

이 레포의 app/kustomization.yaml, web/kustomization.yaml의 newTag: 필드를 자동 수정

GitHub Actions가 변경사항을 커밋 및 push

Argo CD가 Git 변경 감지 → 앱 자동 재배포

🔗 연동된 CI 레포

petclinic-app

CI에서 Docker 이미지 빌드 및 eks-petclinic 레포의 kustomization.yaml 자동 업데이트

⚙️ 전체 기술 스택 요약

분야

도구

CI/CD

GitHub Actions → 이미지 빌드 및 GitOps 트리거

CD

Argo CD (ApplicationSet 기반)

클러스터

AWS EKS, ALB Ingress, HPA, Cluster Autoscaler

모니터링

Prometheus, Grafana

로깅

EFK (Elasticsearch, Fluentd, Kibana)

기타 구성

Whatap, Kubernetes Dashboard, IAM Roles
