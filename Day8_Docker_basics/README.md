Day 8 
Docker Introduction & Running Containers
1. Why Docker Is Needed

Before Docker, applications were deployed directly on servers. This caused multiple problems:

Different environments for developers, testers, and production

Dependency conflicts between applications

Manual setup on every server

“Works on my machine” issues

Docker solves this by packaging the application along with its dependencies, ensuring it behaves the same everywhere.

2. What Docker Is

Docker is a containerization platform that allows applications to run in isolated environments called containers.

Key points:

Containers are lightweight

Containers share the host OS kernel

Containers start and stop quickly

No full OS inside a container

Docker uses Linux kernel features such as namespaces and cgroups to isolate processes.

3. What Is a Container?

A container is:

An isolated runtime environment

A running instance of a Docker image

Lightweight compared to virtual machines

Containers:

Share the host OS kernel

Run as processes

Can be started, stopped, and deleted easily

4. Docker vs Virtual Machines
Feature	Docker Containers	Virtual Machines
OS	Shares host OS	Full OS per VM
Startup	Seconds	Minutes
Resource usage	Low	High
Isolation	Process-level	OS-level

Containers are preferred for microservices and CI/CD pipelines.

5. Docker Architecture

Docker consists of three main components:

Docker Client

CLI tool used by users

Sends commands like docker run to the daemon

Docker Daemon

Runs in the background

Builds images and manages containers

Docker Registry

Stores Docker images

Docker Hub is the default public registry

6. Docker Image vs Docker Container
Docker Image

Read-only template

Blueprint for creating containers

Built using a Dockerfile

Docker Container

Running instance of an image

Can be started, stopped, or deleted

Analogy:
Image = Blueprint
Container = House built from blueprint

7. Installing Docker (Ubuntu)
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker


Verify installation:

docker --version

8. Running Your First Container
docker run hello-world


What happens:

Docker checks for the image locally

Pulls it from Docker Hub if not found

Runs the container

Container prints a message and exits

Exited containers are normal and not errors.

9. Listing Images and Containers
docker images     # Lists images
docker ps         # Running containers
docker ps -a      # All containers

10. Running a Web Server in a Container
docker run -d -p 8080:80 nginx


Explanation:

-d runs container in detached mode

-p 8080:80 maps host port to container port

nginx is the image name

Access using:

curl http://localhost:8080

11. Stopping and Removing Containers
docker stop <container_id>
docker rm <container_id>


Containers should be stopped and removed when not needed.

12. Why This Matters in DevOps

Docker enables:

Consistent environments

Faster deployments

Easy scaling

CI/CD automation

Microservices architecture

Docker is a foundational DevOps skill and integrates directly with CI/CD tools and Kubernetes.

13. Day 8 Summary

Understood what Docker is and why it exists

Learned difference between images and containers

Ran containers using Docker CLI

Deployed nginx without manual installation

Verified container using curl

Managed container lifecycle
