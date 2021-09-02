# Docker
my Docker

# **Install docker compose (linux)**

- sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o **/usr/local/bin/docker-compose**
- sudo chmod +x /usr/local/bin/docker-compose
- sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
- docker-compose --version

`docker-compose up -d`

**run** "docker-compose.yml" containers at current directory.

-d = detach (running in the background.)

`docker-compose down`

**stop** the "docker-compose.yml" containers.

will remove the containers from "docker ps" processes list also.
