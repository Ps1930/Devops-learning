1. Purpose of Day 17

Day 17 focuses on Docker image versioning discipline.

Goals:

Understand what Docker tags really are

Learn why latest is unreliable

Implement safe tagging strategies

Use CI-generated tags for traceability

This is critical for rollback, debugging, and production stability.

2. What a Docker Image Tag Is

A Docker image is identified by:

image_name:tag


Example:

myapp:1.0.0


Image name identifies the repository

Tag is a mutable label

Multiple tags can point to the same image ID

Image IDs are immutable; tags are not.

3. Why latest Is Dangerous

The latest tag:

Does not guarantee newest code

Changes every time an image is rebuilt

Breaks reproducibility

Makes rollbacks difficult

Using only latest in CI/CD or production leads to:

Unclear deployments

Debugging confusion

Risky releases

Best practice: never rely solely on latest.

4. Common Tagging Strategies
Semantic Versioning
myapp:1.0.0
myapp:1.0.1
myapp:1.1.0


Used for:

Controlled releases

Manual versioning

Git Commit SHA (Preferred in CI)
myapp:9db73b7


Advantages:

Every build is unique

Direct traceability to code

Easy rollback to a known commit

This is widely used in real-world DevOps pipelines.

5. Tagging Docker Images in CI

In GitHub Actions, images can be tagged using commit SHA:

- name: Build Docker image with tag
  run: |
    IMAGE_TAG=${GITHUB_SHA::7}
    docker build -t myapp:$IMAGE_TAG .


GITHUB_SHA is provided automatically by GitHub Actions

Short SHA keeps tags readable

Each CI run produces a uniquely tagged image

6. Using latest Safely (Optional)

If required, latest can be added in addition to a unique tag:

docker tag myapp:$IMAGE_TAG myapp:latest


Rule:

latest may exist, but must never be the only reference.

7. Why Image Tagging Matters in Production

Proper tagging enables:

Safe rollbacks

Clear deployment tracking

Faster incident resolution

Reliable CI/CD pipelines

Being able to answer:

“Which version is deployed?”

with a commit ID is a core DevOps expectation.

8. Key Learnings from Day 17

Docker tags are labels, not guarantees

latest is unreliable for production use

CI should generate unique, traceable image tags

Git commit SHA is a practical tagging strategy

Proper tagging is essential for rollback and debugging

