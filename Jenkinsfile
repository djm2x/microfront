#!groovy
node {
  def APP_NAME = 'sa-dev-api'
  def DOMAINE = 'digitransform.co'
  def DOMAINE_PREFIX = 'api'
  def SUB_DOMAINE = 'sa-dev-api'
  def APP_PORT = '5000'
  def EXPOSED_PORT = '5020'

  def DOCKER_FILE_NAME = './subApi/Dockerfile'

  def app

    stage('Cloning Git') {
      def commit = checkout scm
      //  env.BRANCH_NAME = commit.GIT_BRANCH.replace('origin/', '')
      // sh "echo ${commit}"
    }

    stage('Building image') {
      app = docker.build("${APP_NAME}", " -f ${DOCKER_FILE_NAME} ./")
      sh """docker build -t sa-cms-dev-api -f ./cmsApi/Dockerfile ./"""
      // sh "echo ${app}"
    }

    stage('Docker Run') {
      sh "docker rm --force ${APP_NAME}"
      // sh "docker rmi --force ${APP_NAME}"
      //&& PathPrefix(`/${DOMAINE_PREFIX}`)
      // -p ${EXPOSED_PORT}:${APP_PORT} \
      sh """docker run -d \
      --restart unless-stopped \
      --network proxy \
      --env "me=you" \
      --volume /home/ubuntu/volumes/${APP_NAME}/wwwroot:/app/wwwroot \
      --label traefik.enable=true \
      --label traefik.http.routers.${APP_NAME}.tls=true \
      --label traefik.http.routers.${APP_NAME}.tls.certresolver=letsencrypt \
      --label traefik.http.routers.${APP_NAME}.rule='Host(`${SUB_DOMAINE}.${DOMAINE}`) && PathPrefix(`/${DOMAINE_PREFIX}`)'\
      --label traefik.http.services.${APP_NAME}.loadbalancer.server.port=${APP_PORT} \
      --name ${APP_NAME} \
      ${APP_NAME}"""

      sh "docker rm --force sa-cms-dev-api"

      sh """docker run -d \
      --restart unless-stopped \
      -p 6001:5001 \
      --volume /home/ubuntu/volumes/sa-cms-dev-api/wwwroot:/app/wwwroot \
      --name sa-cms-dev-api \
      sa-cms-dev-api"""

      // sh "docker system prune -a -f"
    }
}

