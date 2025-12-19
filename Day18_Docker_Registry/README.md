Docker Registries & Pushing Images from CI/CD
1. Purpose of Day 18

Day 18 focuses on delivering Docker images outside the build environment.

Goals:

Understand Docker registries

Authenticate securely in CI

Push Docker images automatically

Complete an end-to-end CI → Registry workflow

This is a core responsibility for a Junior DevOps Engineer.

2. What a Docker Registry Is

A Docker registry is a service that stores Docker images and makes them available for download.

It does not:

Run pipelines

Execute containers

Deploy applications

It only stores images.

Examples:

Docker Hub

GitHub Container Registry (GHCR)

AWS ECR

Azure ACR

3. Why Registries Are Required in CI/CD

CI environments are temporary and stateless.

Without a registry:

Built images are lost after CI finishes

Servers cannot pull images

Deployments cannot happen

Registries act as the handoff point between build and deployment.

4. Docker Hub Setup

Created a Docker Hub account

Created a public repository:
ps1930/ci-demo-app

Repository initially empty until CI pushes images

This repository stores all versioned Docker images.

5. Authentication Strategy (Security Best Practice)

CI/CD must never use human passwords.

Instead:

Docker Hub access tokens are used

Tokens have limited scope

Tokens can be revoked safely

Local authentication was tested using:

docker login


CI authentication uses GitHub Secrets.

6. GitHub Secrets Configuration

Two repository secrets were added:

DOCKERHUB_USERNAME

DOCKERHUB_TOKEN

Secrets:

Are encrypted

Are not committed to Git

Are masked in CI logs

This enables secure, automated authentication.

7. CI Workflow for Build & Push

GitHub Actions workflow performs:

Checkout code

Login to Docker Hub using secrets

Build Docker image

Tag image using Git commit SHA

Push image to Docker Hub

Example snippet:

IMAGE_TAG=${GITHUB_SHA::7}
docker build -t ps1930/ci-demo-app:$IMAGE_TAG ./Day14_MultiStage
docker push ps1930/ci-demo-app:$IMAGE_TAG

8. Image Tagging Strategy Used

Short Git commit SHA used as image tag

Ensures:

Unique images per build

Full traceability

Easy rollback

Avoided relying solely on latest.

9. CI Failure & Recovery (Real-World Learning)

Initial CI run failed due to:

GitHub Secrets propagation delay

Subsequent run succeeded without code changes.

Lesson:

CI failures must be analyzed, not blindly retried

Transient failures can occur during secret setup

10. Verification of Success

Success confirmed by:

Green CI pipeline

Image visible in Docker Hub repository

Tags matching Git commit IDs

This proves end-to-end delivery works.

11. Key Learnings from Day 18

Docker registries store images, not code

CI environments require external storage

Secrets must never be hardcoded

Access tokens are mandatory for CI auth

CI can build and push images securely

Proper tagging enables traceability

CI failures are part of real DevOps workflows
