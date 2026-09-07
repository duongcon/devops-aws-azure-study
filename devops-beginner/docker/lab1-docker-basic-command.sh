# Thực hành làm quen với docker qua các thao tác sau
# Pull a image from docker registry (Docker Hub)
docker pull <image>:<tag>
# List images
docker images
# List all container
docker ps
# Run 1 container from image
docker run -d -p <host port>:<container port> <image>:<tag>
# Example: port 8080 is output, port 80 is input of container
docker run -d -p 8080:80 nginx:latest
# List all container - All status
docker ps -a
# Start/Stop/Restart a container
docker start <container id>
docker stop <container id>
docker restart <container id>
# Delete a container
docker rm <container id>
# Delete a image
docker rmi <image>:<tag>
# SSH login to a running container
docker exec -it <container id> /bin/bash
