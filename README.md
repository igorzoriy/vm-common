# vm-common

## Description
Configs for my common VM

## Usage
- Create VM with docker
```sh
$ docker-machine create
    --driver digitalocean
    --digitalocean-access-token TOKEN
    --digitalocean-image "ubuntu-14-04-x64"
    --digitalocean-region "fra1"
    vm-common
```

- Switch to VM
```sh
$ docker-machine env vm-common
```

- Create image(s)
```sh
$ docker build -t openvpn ./openvpn
```

- Create containers
```sh
$ docker run -d --privileged -p 443:443/tcp openvpn
```

- Copy openvpn client config
```sh
$ docker cp CONTAINER_ID:/etc/openvpn/client.ovpn ~/path/to/client.ovpn
```
