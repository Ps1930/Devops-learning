📘 DEVOPS NOTES — DAY 14
Multi-Stage Docker Builds (Concept, Pitfalls & Real-World Debugging)
1. Purpose of Day 14

Day 14 introduces the concept of multi-stage Docker builds and why they exist.

The goal was not to perfectly optimize a Python image, but to:

Understand why multi-stage builds are used

Learn how stages are separated

Experience common real-world pitfalls

Practice debugging containers that build successfully but fail at runtime

2. What a Multi-Stage Build Is

A multi-stage Docker build uses multiple FROM instructions in a single Dockerfile.

Each FROM:

Starts a new stage

Has its own filesystem

Does not automatically share dependencies with other stages

Basic idea:

Stage 1: build / prepare artifacts

Stage 2: run only what is required

This helps reduce:

Image size

Attack surface

Runtime complexity

3. Example Concept (Simplified)
FROM python:3.10-slim AS build
# build things here

FROM python:3.10-slim
# run things here


Only what is explicitly copied using:

COPY --from=build <source> <destination>


is transferred between stages.

Nothing else comes along.

4. Real Issue Encountered with Python

While experimenting with multi-stage builds for a Flask app:

Flask was installed in the build stage

Runtime stage did not have Flask installed

Only /app was copied between stages

Python dependencies live in site-packages, not /app

Result:

ModuleNotFoundError: No module named 'flask'


This is expected behavior, not a Docker bug.

5. Key Lesson: Dependencies Are Not Shared

Multi-stage builds:

Do not automatically transfer installed packages

Require explicit dependency handling

Are straightforward for compiled binaries

Are trickier for interpreted languages like Python

Naively copying application files is not enough.

6. Debugging Process Used

The following real DevOps debugging steps were practiced:

docker ps -a to check container state

docker logs <container_id> to read runtime errors

Running containers in foreground to see crashes directly

Inspecting files inside the container

Cleaning containers and images to avoid cache confusion

This is standard production debugging workflow.

7. Final Working Dockerfile (Day 14 Outcome)

For correctness and learning progression, the final working version used was:

FROM python:3.10-slim

WORKDIR /app

RUN pip install flask

COPY app.py .

CMD ["python", "app.py"]


This ensured:

Flask available at runtime

Application runs successfully

Clear separation of concerns without premature optimization

8. Why Multi-Stage Was Still Valuable to Learn

Even though the final image was single-stage:

The concept of multi-stage builds was understood

The limitations for Python apps were observed

The importance of explicit dependency management was learned

Debugging skills were strengthened

This mirrors real industry experience.

9. Key Learnings from Day 14

Multi-stage builds separate build-time and runtime

Dependencies do not cross stages automatically

Python apps require careful handling in multi-stage builds

Containers can build successfully but fail at runtime

docker logs is critical for debugging

Dockerfile syntax is strict and unforgiving

📍 STOP POINT

Day 14 focused on understanding and experience, not perfect optimization.

Advanced Python multi-stage builds require:

Virtual environments

Wheels

Or dependency reinstallation strategies
(these are covered later)
