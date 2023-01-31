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

# dockerRunFunction 'library-com-front2' 'library';
# dockerRunFunction2 'library-com-api' 'library';





# docker stop info-academie | xargs docker rm

# docker run -d \
# --restart unless-stopped \
# --network proxy \
# --label traefik.enable=true \
# --label traefik.http.routers.library-secure.rule=Host\(\`library.mohamed-mourabit.com\`\) \
# --label traefik.http.services.library.loadbalancer.server.port=4205 \
# --name library \
# djm2x/library-com-front:latest \


docker stop marketplace | xargs docker rm

docker run -d \
--restart unless-stopped \
--network proxy \
--label traefik.enable=true \
--label traefik.http.routers.library-secure.entrypoints=https \
--label "traefik.http.routers.marketplace.rule=Host(\`dev-local.digitransform.co\`) && Path(\`/front\`)" \
--label traefik.http.routers.marketplace.tls=true \
--label traefik.http.routers.marketplace.tls.certresolver=letsencrypt \
--label traefik.http.services.marketplace.loadbalancer.server.port=4000 \
--name marketplace \
aelbekkali/marketplace-front:latest \




# --label traefik.http.routers.marketplace.rule=\(Host\(\`dev-local.digitransform.co\`\) && Path\(\`\/front\`\)\) \

# --label traefik.http.routers.library-secure.tls=true \
# --label traefik.http.routers.library-secure.tls.certresolver=letsencrypt \
# --label traefik.http.routers.library-secure.service=library \
# --label traefik.http.routers.library.entrypoints=http \
# --label traefik.http.routers.library.rule=Host\(\`library.mohamed-mourabit.com\`\) \
# --label traefik.http.middlewares.library-https-redirect.redirectscheme.scheme=https \
# --label traefik.http.routers.library.middlewares=traefik-https-redirect \
# --label traefik.http.services.library.loadbalancer.server.scheme=https \
# --label traefik.port=4205 \
# --label traefik.docker.network=proxy \
# -p 4205:4205 \
# --label traefik.docker.network=traefik-web \
# --label traefik.entryPoints=web \
# --label traefik.http.routers.library.tls=true \
# --label traefik.http.routers.library.tls.certresolver=lets-encrypt \
# --network my-internal \

# curl --verbose http://172.24.0.9:5000/swagger
# curl --verbose http://172.30.0.5:3000

# docker run -d \
# --label \
#   traefik.port=5005 \
# --network traefik-web \
# --network my-internal \
# --name library-api djm2x/library-com-api:latest

# chmod 600 ./config/acme.json

# chmod +x ./docker-run.sh

# du -sch /home/vivek/* | sort -rh

# du -a /var | sort -n -r | head -n 10

# du -hsx -- * | sort -rh | head -10

# docker image prune --all

# sudo du -a /var/lib/docker/containers | sort -n -r | head -n 10
