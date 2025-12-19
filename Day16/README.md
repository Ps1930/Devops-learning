DEVOPS NOTES — DAY 16

Docker + GitHub Actions (CI Build Integration)

Integrated Docker image build into GitHub Actions CI

Learned that CI runners start from repository root

Faced Docker build failure due to missing Dockerfile in default context

Fixed pipeline by explicitly defining build context path

Validated Dockerfile in a clean CI environment

Understood that CI enforces reproducibility and exposes hidden assumptions

Key Command in CI:

docker build -t ci-test-image ./Day14_MultiStage


Key Learning:

Always specify build context in CI when Dockerfile is not in repo root.
