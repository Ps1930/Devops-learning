1. Purpose of Day 13

Day 13 focuses on controlling what Docker sees and ships during image builds.

Goals:

Understand Docker build context

Prevent unnecessary files from entering images

Improve build speed and security

Learn .dockerignore as a best practice

This day is about discipline, not new features.

2. What Build Context Is

When the command below is executed:

docker build .


Docker sends everything in the current directory (.) to the Docker daemon.
This entire directory is called the build context.

Important:

Docker does not send only the Dockerfile

It sends all files unless explicitly ignored

3. Why Build Context Matters

Large or messy build contexts cause:

Slow Docker builds

Larger images

Longer CI/CD pipeline execution

Accidental inclusion of secrets or credentials

Docker assumes you know what you’re doing.
It does not protect you from yourself.

4. What .dockerignore Is

.dockerignore is a file that tells Docker which files and folders to exclude from the build context.

It works similarly to .gitignore, but applies only to Docker builds.

Ignored files:

Are not sent to Docker daemon

Are not available during image build

Do not end up inside the image

5. Example .dockerignore File
.git
__pycache__
*.log
.env


Explanation:

.git → no version history inside image

__pycache__ → Python junk

*.log → runtime artifacts

.env → sensitive secrets

6. Verifying .dockerignore Behavior

After rebuilding the image:

docker run -it <image_name> bash


Inside container:

ls


Ignored files should not appear inside the container filesystem.

This confirms .dockerignore is working correctly.

7. Common .dockerignore Entries

Frequently ignored files/folders:

.git
node_modules
__pycache__
*.log
.env
tests
docs


Rule:

If the application does not need it at runtime, don’t include it in the image.

8. Why .dockerignore Is Critical in CI/CD

In CI/CD pipelines:

Docker builds run repeatedly

Build context is transferred every time

Large contexts waste time and compute

Secrets leakage becomes a serious risk

.dockerignore improves:

Performance

Security

Reliability

It is not optional in professional projects.
