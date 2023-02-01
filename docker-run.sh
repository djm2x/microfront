#!/bin/sh

# docker network create my-internal --internal
# docker network create traefik-web

# docker rm -f CONTAINER_ID
# https://linuxhint.com/bash_loop_list_strings/
# declare -a list=("library" "Fedora" "Red Hat Linux" "Ubuntu" "Debian" )
# serviceName='library-com-front'


# echo $serviceName;

dockerRunFunction(){
    serviceName=$1
    domainName=$2

    docker stop $serviceName | xargs docker rm

    docker run -d \
    --restart unless-stopped \
    --network proxy \
    --label traefik.enable=true \
    --label traefik.http.routers.$serviceName.tls=true \
    --label traefik.http.routers.$serviceName.tls.certresolver=letsencrypt \
    --label traefik.http.routers.$serviceName.rule="Host(\`$domainName.mohamed-mourabit.com\`) && Path(\`/front\`)" \
    --label traefik.http.services.$serviceName.loadbalancer.server.port=4205 \
    --name $serviceName \
    djm2x/$serviceName:latest
}


dockerRunFunction2(){
    serviceName=$1
    domainName=$2
    prefix=$3

    docker stop $serviceName | xargs docker rm

    docker run -d \
    --restart unless-stopped \
    --network proxy \
    --volume $serviceName-vol:/wwwroot \
    --label traefik.enable=true \
    --label traefik.http.routers.$serviceName.tls=true \
    --label traefik.http.routers.$serviceName.tls.certresolver=letsencrypt \
    --label traefik.http.routers.$serviceName.rule="Host(\`$domainName.mohamed-mourabit.com\`) && PathPrefix(\`/$prefix\`)" \
    --label traefik.http.services.$serviceName.loadbalancer.server.port=5005 \
    --name $serviceName \
    $serviceName:latest
}

# find the last tagged commit and assume it was the last release
# cd projects && git diff --name-only $COMMIT_ID | awk -F'/' 'NF!=1{print $2}' | sort -u

git diff --name-only HEAD $COMMIT |grep shell

# git diff --raw HEAD^1

# git diff HEAD^1 --name-only|grep shell

# echo $COMMIT
# dockerRunFunction 'library-com-front2' 'library';
# dockerRunFunction2 'library-com-api' 'library';
# dockerRunFunction2 'mongo' 'db' 'mongo';




# curl --verbose http://172.24.0.9:5000/swagger
# curl --verbose http://172.30.0.5:3000

# echo $COMMIT
# chmod 600 ./config/acme.json

# chmod +x ./docker-run.sh

# du -sch /home/vivek/* | sort -rh

# du -a /var | sort -n -r | head -n 10

# du -hsx -- * | sort -rh | head -10

# docker image prune --all

# sudo du -a /var/lib/docker/containers | sort -n -r | head -n 10
