FROM node:0.10

RUN apt-get update && apt-get install -y postgresql-client-9.4

RUN git clone https://github.com/koopjs/koop-sample-app.git /usr/src/koop

WORKDIR /usr/src/koop 

RUN npm install

ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 1337
CMD ["koop"]
