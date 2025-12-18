📘 DEVOPS NOTES — DAY 12
WORKDIR, Cleaner Dockerfiles & Instruction Order
1. Purpose of Day 12

Day 12 focuses on improving Dockerfile structure and hygiene.

Goals:

Avoid messy absolute paths

Make Dockerfiles readable and maintainable

Understand how Docker caching works

Write Dockerfiles that won’t punish you in CI/CD

This is refinement, not new concepts.

2. What WORKDIR Is

WORKDIR sets the default working directory inside the Docker image.

Example:

WORKDIR /app


Effects:

Creates /app if it doesn’t exist

All subsequent commands run from /app

Avoids repeated absolute paths

Once WORKDIR is set, Docker behaves as if:

cd /app


was executed inside the image.

3. Why WORKDIR Is Important

Without WORKDIR:

Files are copied to root (/)

Paths become long and error-prone

Dockerfiles look cluttered

With WORKDIR:

Cleaner paths

Safer file handling

Easier to scale for larger projects

It is considered best practice in real-world Dockerfiles.

4. Dockerfile Used on Day 12
FROM python:3.10-slim

WORKDIR /app

RUN pip install flask

COPY app.py .

CMD ["python", "app.py"]

5. Dockerfile Instruction Breakdown
FROM python:3.10-slim

Base image with Python

Lightweight and efficient

WORKDIR /app

Sets /app as default directory

All following instructions run inside /app

RUN pip install flask

Installs Flask at build time

Creates a cached image layer

COPY app.py .

Copies app.py into /app

Uses relative path because of WORKDIR

CMD ["python", "app.py"]

Runs the Flask app at container start

Defines the container’s main process

6. Why Instruction Order Matters

Docker builds images layer by layer and caches each layer.

Bad order:

COPY app.py .
RUN pip install flask


Problem:

Any code change breaks cache

Dependencies reinstall every build

CI becomes slow

Good order:

RUN pip install flask
COPY app.py .


Reason:

Dependencies change less frequently than code

Cache is reused efficiently

Correct ordering dramatically improves build performance.

7. Comparison: Day 11 vs Day 12
Day 11 Dockerfile

Absolute paths

No working directory

Functional but basic

Day 12 Dockerfile

Uses WORKDIR

Cleaner structure

Optimized for caching

Easier to maintain

This is the difference between “it runs” and “it scales”.
