# 🐾 Petclinic 애플리케이션 with GitAction CI

---

## 📌 개요

Spring 기반의 Petclinic 애플리케이션을 Docker로 컨테이너화하고,  
GitHub Actions를 활용해 **ECR에 이미지 빌드 & 푸시**,  
그리고 **Argo CD GitOps 기반 자동 배포**까지 연계한 CI 파이프라인을 구축

---

## 🧰 사용 기술

- **Java 8 / Spring Framework**
- **Maven**
- **Docker / Dockerfile**
- **AWS ECR**
- **GitHub Actions**
- **Kustomize**
- **Argo CD (연동용)**

---

## 🔄 CI 파이프라인 흐름

| 단계 | 설명 |
|------|------|
| ✅ Checkout | 애플리케이션 코드 다운로드 |
| ✅ Build | Maven으로 WAR 패키징 |
| ✅ Dockerize | Docker 이미지 빌드 |
| ✅ Push | AWS ECR로 이미지 푸시 |
| ✅ GitOps 연동 | argo-eks 리포의 `kustomization.yaml` 자동 수정 및 커밋 |

> 🔁 이 과정을 통해 Argo CD는 Git 변경을 감지하고 자동 배포

---

## 🔐 GitHub Secrets 요구사항

| 키                     | 설명                            |
|------------------------|---------------------------------|
| `AWS_ACCESS_KEY_ID`     | AWS 액세스 키 ID                |
| `AWS_SECRET_ACCESS_KEY` | AWS 시크릿 키                   |
| `MY_GITHUB_PAT`         | 개인 GitHub 토큰 (argo-eks 레포 수정용) |

---

## 📂 디렉토리 구조

```bash
petclinic-app/
├── src/                           # Java 소스 코드
├── pom.xml                        # Maven 빌드 설정
├── docker/
│   └── app/
│       ├── Dockerfile             # Tomcat 기반 WAR 배포용 Dockerfile
│       └── petclinic.war          # 빌드시 복사됨
├── .github/
│   └── workflows/
│       └── petclinic-ci.yaml      # CI/CD 워크플로우
└── README.md
```

---


## 📁 CI 자동 커밋 위치

```bash
argo-eks/app/kustomization.yaml
```

> 위 파일의 `image` 필드가 자동 수정되고, Git commit 후 Argo CD가 변경을 감지하여 자동 배포가 트리거 됨

---


