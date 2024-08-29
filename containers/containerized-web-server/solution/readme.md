## Run the containerized web server
docker-compose up -d

## Verify the port binding
docker-compose port web 8080


# preconditions

To install Docker Compose

lnx
sudo curl -L "https://github.com/docker/compose/releases/download/{version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

## change permission
sudo chmod +x /usr/local/bin/docker-compose

## macos home-brew package
brew install docker-compose