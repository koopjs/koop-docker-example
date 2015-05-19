# Koop Server Example

## Setup

Install docker - https://docs.docker.com/installation/

Install docker-compose to manage our containers.

```
curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

## Quick start

```
git clone git@github.com:kpettijohn/koop-server-example.git
cd koop-server-example/postgis
docker build -t postgis .
cd ../koop-server
docker build -t koop .
cd ..

docker-compose up -d postgis
sleep 5
docker-compose up --no-deps koop
```
