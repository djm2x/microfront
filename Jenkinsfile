#!groovy
node {
  def apps = [
    [name: "home", port: '4200', exposed_port: '6000', path: 'home', domaine: "194.163.148.222", domaine_prefix: ''],
    [name: "product", port: '4200', exposed_port: '6001', path: 'product', domaine: "194.163.148.222", domaine_prefix: ''],
     [name: "remote-app", port: '4200', exposed_port: '6002', path: 'remote-app', domaine: "194.163.148.222", domaine_prefix: ''],
     [name: "shell", port: '4200', exposed_port: '6003', path: 'shell', domaine: "194.163.148.222", domaine_prefix: ''],
  ];

  // def DOCKER_FILE_NAME = './subApi/Dockerfile'

  // def app

    stage('Cloning Git') {
      // def commit = checkout scm
      //  env.BRANCH_NAME = commit.GIT_BRANCH.replace('origin/', '')
      sh "ls -al"
      sh "git diff"

 def lastCommit = sh(script: "git rev-parse --short HEAD", returnStdout: true)

      apps.each { e ->
         try {
          def changes = sh(script:"""git diff --name-only HEAD@{1} ${lastCommit} | grep ${e.name}""", returnStdout: true)

          if(changes == '' || changes == null) {
            println("${e.name} no changes, no build")
          } else {
            println("${e.name} has some changes, building...")
          }

        } catch (err) {
          println("2222222222222222222222")
          println(err)
        }

        // println(commit)
        //  test git diff

        // println(changes)
      }
    }

    // stage('Building image') {
    //   app = docker.build("${APP_NAME}", " -f ${DOCKER_FILE_NAME} ./")
    //   sh """docker build -t sa-cms-dev-api -f ./cmsApi/Dockerfile ./"""
    //   // sh "echo ${app}"
    // }

    // stage('Docker Run') {
    //   sh "docker rm --force ${APP_NAME}"
    //   // sh "docker rmi --force ${APP_NAME}"
    //   //&& PathPrefix(`/${DOMAINE_PREFIX}`)
    //   // -p ${EXPOSED_PORT}:${APP_PORT} \
    //   sh """docker run -d \
    //   --restart unless-stopped \
    //   --network proxy \
    //   --env "me=you" \
    //   --volume /home/ubuntu/volumes/${APP_NAME}/wwwroot:/app/wwwroot \
    //   --label traefik.enable=true \
    //   --label traefik.http.routers.${APP_NAME}.tls=true \
    //   --label traefik.http.routers.${APP_NAME}.tls.certresolver=letsencrypt \
    //   --label traefik.http.routers.${APP_NAME}.rule='Host(`${SUB_DOMAINE}.${DOMAINE}`) && PathPrefix(`/${DOMAINE_PREFIX}`)'\
    //   --label traefik.http.services.${APP_NAME}.loadbalancer.server.port=${APP_PORT} \
    //   --name ${APP_NAME} \
    //   ${APP_NAME}"""

    //   sh "docker rm --force sa-cms-dev-api"

    //   sh """docker run -d \
    //   --restart unless-stopped \
    //   -p 6001:5001 \
    //   --volume /home/ubuntu/volumes/sa-cms-dev-api/wwwroot:/app/wwwroot \
    //   --name sa-cms-dev-api \
    //   sa-cms-dev-api"""

    //   // sh "docker system prune -a -f"
    // }
}

