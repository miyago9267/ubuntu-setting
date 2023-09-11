docker ps | grep portainer | awk '{print $1}' | xargs docker stop | xargs docker rm

docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 -p 9443:9443 \
    --name=portainer --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data portainer/portainer-ce:latest