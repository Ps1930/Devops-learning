1. Purpose of Day 11

Day 11 focuses on making Docker images functional, not just runnable.

Key objectives:

Install application dependencies

Understand how Docker builds images

Learn the difference between build-time and run-time behavior

This is essential for CI/CD pipelines and real-world Docker usage.

2. RUN vs CMD (Critical Difference)
RUN

Executes commands while building the image

Creates a new image layer

Used for:

Installing packages

Updating OS libraries

Setting up environment

Example:

RUN pip install flask

CMD

Executes when the container starts

Defines the main process

Only one CMD is active (last one wins)

Example:

CMD ["python", "/app.py"]

3. Why Dependency Installation Is Needed

Base images (e.g., python:3.10-slim) include:

Python runtime

Minimal system libraries

They do not include application-specific dependencies like Flask.

Therefore, dependencies must be installed during the image build process using RUN.

4. Dockerfile Used in Day 11
FROM python:3.10-slim

RUN pip install flask

COPY app.py /app.py

CMD ["python", "/app.py"]

5. Dockerfile Instruction Breakdown
FROM python:3.10-slim

Defines the base image

Lightweight Python environment

RUN pip install flask

Installs Flask at build time

Cached unless this line changes

COPY app.py /app.py

Copies application code into the image

CMD ["python", "/app.py"]

Starts Flask application when container runs

6. Building the Image

Command:

docker build -t day11-flask-app .


Docker reads the Dockerfile

Executes instructions sequentially

Produces a reusable Docker image

7. Running the Container

Command:

docker run -d -p 5000:5000 day11-flask-app


-d runs container in background

-p exposes container port to host

8. Verifying the Application

Test using:

curl http://localhost:5000


Expected output:

Hello from Flask in Docker!


This confirms:

Dependencies installed correctly

Application running inside container

Port mapping working

9. Build-Time vs Run-Time Explained
Build-Time

Occurs during docker build

Instructions: FROM, RUN, COPY

Creates image layers

Cached for reuse

Run-Time

Occurs during docker run

Instruction: CMD

Starts application process

Executes every time container starts

Understanding this distinction is critical for performance and debugging.

10. Day 11 Summary

By the end of Day 11, you learned:

How RUN differs from CMD

How to install dependencies inside Docker images

How build-time and run-time work

How to run a Flask application inside Docker

How Docker layers affect performance and caching
