FROM node:16-alpine3.15 as build-env

# install git
RUN apk add --no-cache git

WORKDIR /app

ARG token=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

# clone core repo

# copy and cahe
COPY package.json .
COPY package-lock.json .

# RUN ls -al
RUN npm ci --force --no-optional

# Hack to make sure the angular modules are compiled at this stage
RUN ./node_modules/.bin/ngcc

RUN git clone --single-branch --branch dev https://mohamed-mourabit:$token@github.com/elabdellah/Core_Ecommerce.git src/app/core

COPY . .

# RUN ./node_modules/.bin/ngcc

RUN npm run prod

FROM nginx:alpine
WORKDIR /usr/share/nginx/html

RUN rm -rf ./*
COPY ./ngx.conf /etc/nginx/conf.d/default.conf

COPY --from=build-env /app/dist .

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

