Dockerfile Basics & Building Custom Images
1. What a Dockerfile Is

A Dockerfile is a plain text file that contains a set of instructions used by Docker to build an image.

It defines how an image is created

Each instruction creates a new image layer

Instructions are executed top to bottom

A Dockerfile connects source code → runnable container.

2. Why Dockerfiles Are Important

Without Dockerfiles:

You depend on prebuilt images

You can’t customize environments

CI/CD pipelines become limited

With Dockerfiles:

You control runtime environment

Builds are reproducible

Images can be rebuilt anywhere

3. Basic Dockerfile Structure

A minimal Dockerfile contains:

FROM python:3.10-slim
COPY app.py /app.py
CMD ["python", "/app.py"]


This creates a Python image that runs a script when the container starts.

4. Dockerfile Instructions Explained
FROM

Specifies the base image

Mandatory for every Dockerfile

Example:

FROM python:3.10-slim

COPY

Copies files from host system into the image

Happens at build time

Example:

COPY app.py /app.py

CMD

Defines the default command when container starts

Only one CMD is allowed (last one wins)

Runs at container runtime

Example:

CMD ["python", "/app.py"]

5. Building a Docker Image

Command used:

docker build -t day10-python-app .


Explanation:

-t → tag (image name)

. → build context (current directory)

Docker executes Dockerfile instructions and creates an image.

6. Running the Custom Image

Command:

docker run day10-python-app


Expected output:

Hello from Docker!


The container exits after execution because the main process (Python script) finishes.

7. Image Naming Rules

Docker image names:

Must be lowercase

Can include numbers and hyphens

Uppercase letters cause build failures

Example:

❌ Day10-python-app

✅ day10-python-app

8. Relation to Container Lifecycle

From Day 9 knowledge:

Containers run as long as their main process runs

When CMD finishes, container exits

This behavior is expected and correct

9. Day 10 Summary

By the end of Day 10, you learned:

What a Dockerfile is

Purpose of FROM, COPY, CMD

How Docker builds images layer by layer

How to create and run a custom Docker image

Docker image naming rules

How Dockerfile relates to container lifecycle
