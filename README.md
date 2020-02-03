# Koop Docker Example

> Example application using [Koop](https://github.com/esri/koop) with [Docker](https://www.docker.com/).

## Getting started

### OSX

Grab docker, docker-machine, and docker-compose.

```
curl -L https://get.docker.com/builds/Darwin/x86_64/docker-latest > docker
curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_darwin-amd64 > docker-machine
curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > docker-compose

chmod +x docker*
mv docker* /usr/local/bin/
```

Create your docker host with docker-machine.

**NOTE**: You can also use the VMware Fusion driver (`--driver vmwarefusion`) if it's available.

```
docker-machine create --driver virtualbox dev
```

Evaluate the docker environment variables for your shell.

```
eval "$(docker-machine env dev)"
```

At this point, you should be able to start the koop server using docker-compose.

## Using docker-compose

```
docker-compose up --build
```

You should now have a koop server running at

```
http://localhost:9000
```

## Using docker

Build the docker image

```
docker build -t docker-koop .
```

Run the docker

```
docker run -p 9000:9000 docker-koop
```

You should now have a koop server running at

```
http://localhost:9000
```

## Contributing

Esri welcomes contributions from anyone and everyone. Please see our [guidelines for contributing](https://github.com/Esri/contributing).

## License

[Apache-2.0](LICENSE.md)
