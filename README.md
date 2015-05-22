# Koop docker example 

**Work In Progress**

Sample application using koop with docker.


```
docker-compose up --no-deps koop
```

```
curl -XGET 127.0.0.1:8000/gist/6021269
```

## Koop persistent cache

### ES 

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

```
docker-compose up -d postgis
```

```
docker-compose up --no-deps koopPG
```

```
curl -XGET 127.0.0.1:8002/gist/6021269
```
