# ARG VARIANT="16-alpine3.15"

# # FROM node:${VARIANT}
# FROM node:16-alpine3.15

# # install git
# RUN apk add --no-cache git

# WORKDIR /app

# COPY package.json .
# COPY package-lock.json .

# RUN npm i

# COPY . .

FROM nginx:alpine
WORKDIR /usr/share/nginx/html

ENV SUB_API='value'

RUN ls -al

RUN rm -rf ./*
COPY ./ngx.conf /etc/nginx/conf.d/default.conf


COPY ./test-env-var/ .

ARG SUB_API
ARG _CMS_API='https://sa-dev-api-cms.digitransform.co'

ENV _SUB_API $SUB_API
ENV CMS_API $_CMS_API

RUN sed -i "s#\${SUB_API}#$_SUB_API#g" ./ind**.html
RUN sed -i "s#\${CMS_API}#$CMS_API#g" ./in*.html
RUN sed -i "s#window\['env'\]#111111111111111111#g" ./in**.html

# COPY ./dist .
# RUN sed -i "s#window\['env'\]#'ssssssssssss'#g" ./main.**.js

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
# ENTRYPOINT [ "npm", "run", "b" ]