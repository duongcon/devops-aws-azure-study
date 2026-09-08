# Prepare Dockerfile as sample
# Run below command to build image
docker build -t my-httpd-image .
# Check image
docker images
# Run below command to run container
docker run -d -p 8888:80 --name my-httpd-container my-httpd-image
# Goto browser and check
http://localhost:8888/index.html
