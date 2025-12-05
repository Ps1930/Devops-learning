Day 5: Docker level 2 - nginx webapp and volume demo.

Contents:
- index.html : Static HTML
- Dockerfile  : nginx-based image definition
- notes.txt   : short notes (optional)

How to run:
docker build -t mywebapp day5/webapp
docker run -d -p 8080:80 --name webapp1 mywebapp
