#vm-common

## Description
Configs for my common VM

## Usage
- Create config files
```sh
$ cp config.dist.yml config.yml && cp ansible/local/vars.dist.yml ansible/local/vars.yml
```

- Change data in config files

- Create VM
```sh
$ vagrant up --provider=digital_ocean
```
or
```sh
$ vagrant up --provider=aws
```
