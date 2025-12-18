
Day 9 :
Docker internals + Containers lifecycle 

Docker Images are layered 
Docker Internals, Image Layers & Container Lifecycle
1. Docker Images Are Layered

Docker images are not a single block. They are built in layers.

When you pull an image like nginx, Docker downloads multiple layers:

Base OS layer

Dependencies layer

Application layer

Configuration layer

Each layer is:

Read-only

Cached locally

Reusable across images

This is why Docker is fast and storage-efficient.

2. Image Layers and Caching

When Docker builds or pulls an image:

If a layer already exists locally, Docker reuses it

Only missing layers are downloaded or built

This makes:

CI pipelines faster

Rebuilds efficient

Image updates incremental

Command used:

docker history <image_name>


This shows how the image was constructed layer by layer.

3. Containers and the Lifecycle Concept

A container is a running process, nothing more.

Container lifecycle:

Created → Running → Stopped → Removed


Important rule:

A container lives only as long as its main process is running.

If the main process exits, the container exits.

4. Why Containers Exit Immediately

Example:

docker run ubuntu


What happens:

Ubuntu container starts

No foreground process is defined

Container exits immediately

This is expected behavior, not an error.

5. Running Interactive Containers

To keep a container alive, you must run a process:

docker run -it ubuntu bash


Explanation:

-i → interactive

-t → terminal

bash → main process

As long as bash runs, the container stays alive.
Exit bash → container stops.

6. Inspecting Containers

Docker allows deep inspection of containers:

docker inspect <container_id>


This provides:

Network configuration

IP address

Port mappings

Environment variables

Mounts and metadata

This is used heavily for debugging.

7. Container Logs

Containers write logs to stdout and stderr.

To view logs:

docker logs <container_id>


Logs are the first place to look when a container misbehaves.

8. Stop vs Kill

Graceful stop:

docker stop <container_id>


Force stop:

docker kill <container_id>


stop allows cleanup

kill immediately terminates the process

Best practice: always try stop first.

9. Container Cleanup Philosophy

Containers are meant to be:

Disposable

Replaceable

Easy to destroy

Commands:

docker ps -a
docker rm <container_id>


In DevOps, you recreate, not repair.
