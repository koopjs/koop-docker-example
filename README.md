# Koop Docker example

**Work In Progress**

Sample application using [Koop](https://github.com/esri/koop) with [Docker](https://www.docker.com/).

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

**NOTE**: You can also use the VMware driver `--driver vmwarefusion`

```
docker-machine create --driver virtualbox dev
```
Evaluate the docker environment variables for your shell.

```
eval "$(docker-machine env dev)"
```
At this point you should be able to start the koop server using docker-compose.
```
docker-compose up --no-deps koop
```

You should now have a koop server running using in-memory cache.

```
curl -XGET `docker-machine ip`:8000/gist/6021269
```

## Koop persistent cache

### Elasticsearch

Start up the ES container using `docker-compose`.

```
docker-compose up -d es
```

Passing `-d` will start the container in the background.

Start the koop server.

```
docker-compose up --no-deps koopES
```

Pull in a feature service using the `koop-gist` plugin.

```
curl -XGET 127.0.0.1:8001/gist/6021269
```

Query elasticsearch cache for the newly created feature service.

```
curl -XGET 127.0.0.1:9200/koop/_search?=_id=Gist_6021269_0
```

### PostGIS

Start up the PostGIS cache backend.

```
docker-compose up -d postgis
```

Start the koops server with the `KOOP\_CACHE` ENV set to `postgis`.

```
docker-compose up --no-deps koopPG
```

```
curl -XGET 127.0.0.1:8002/gist/6021269
```

```
docker exec koopdockerexample_postgis_1 psql -U postgres -d koopdev -x -c "SELECT * FROM \"Gist:6021269:0\""

-[ RECORD 1 ]------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
id      | 1
feature | {"type":"Feature","properties":{},"geometry":{"type":"Polygon","coordinates":[[[-119.00390625,50.28933925329178],[-116.19140625,29.38217507514529],[-91.7578125,32.84267363195431],[-82.79296874999999,39.639537564366684],[-102.48046875,53.014783245859206],[-119.00390625,50.28933925329178]]]}}
geom    |
geohash | 9xr1kvcw
```

## Without `docker-compose`

Start the cache backends for ES and PostGIS
```
docker run --name postgis -p "5432:5432" -it kpettijohn/postgis
docker run --name es -p "9200:9200" -p "9300:9300" -it elasticsearch
```

Run a koop server for each of the backends
```
docker run --name koopES -it -p "8000:8000" --link es:es -e KOOP_CACHE=es kpettijohn/koop
docker run --name koopPG -it -p "8000:8000" --link postgis:postgis -e KOOP_CACHE=postgis kpettijohn/koop koop postgis
```
