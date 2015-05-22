FROM node:0.10

ENV APP_DIR /usr/src/koop/

RUN apt-get update \
  && apt-get install -y postgresql-client-9.4 \
  && mkdir -p $APP_DIR

WORKDIR $APP_DIR

COPY package.json $APP_DIR

RUN npm install

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY . $APP_DIR

EXPOSE 8000

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["koop"]
