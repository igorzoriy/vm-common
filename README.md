# vm-common

## Description
Configs for my common VM

## Usage
- Create VM with docker
```sh
$ docker-machine create\
    --driver digitalocean\
    --digitalocean-access-token {TOKEN}\
    --digitalocean-image "ubuntu-16-04-x64"\
    --digitalocean-region "ams2"\
    vm-common
```

- Switch to VM
```sh
$  eval $(docker-machine env vm-common)
```

- Build images and containers
```sh
$ docker-compose up --build -d
```

- Copy openvpn client config
```sh
$ docker cp CONTAINER_ID:/etc/openvpn/client.ovpn ~/path/to/client.ovpn
```
