# **Install docker compose (linux)**

`sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose`

Install with **latest version** docker compose

`sudo chmod +x /usr/local/bin/docker-compose`

Give **execute** permission to it

`sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose`
`docker-compose --version`

Create a **soft link** to /usr/bin/ path


`docker-compose up -d`

**run** "docker-compose.yml" containers at current directory.

-d = detach (running in the background.)

`docker-compose down`

**stop** the "docker-compose.yml" containers.

will remove the containers from "docker ps" processes list also.
