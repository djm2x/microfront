#!groovy
node {
  def apps = [
    [name: "remote-app", port: '4200', exposed_port: '6002', path: 'remote-app', domaine: "194.163.148.222", domaine_prefix: ''],
    [name: "home", port: '4200', exposed_port: '6000', path: 'home', domaine: "194.163.148.222", domaine_prefix: ''],
    [name: "product", port: '4200', exposed_port: '6001', path: 'product', domaine: "194.163.148.222", domaine_prefix: ''],
    [name: "shell", port: '4200', exposed_port: '6003', path: 'shell', domaine: "194.163.148.222", domaine_prefix: ''],
  ];

  def DOCKER_FILE_NAME = './subApi/Dockerfile'

  def app

  stage('Cloning Git') {
    def commit = checkout scm
    //  env.BRANCH_NAME = commit.GIT_BRANCH.replace('origin/', '')
    // sh "echo ${commit}"
    // sh "echo ${commit.GIT_PREVIOUS_SUCCESSFUL_COMMIT}"

    // sh "pwd"
    // sh "ls -al"
    // sh "echo ${lastCommit}"

    // sh "git --version"

    //  def lastCommit = sh(script: "git rev-parse --short HEAD", returnStdout: true)
    def currentCommit = commit.GIT_COMMIT // sh(script: "git rev-parse HEAD", returnStdout: true).trim()
    def lastCommit = commit.GIT_PREVIOUS_SUCCESSFUL_COMMIT

    lastCommit = lastCommit.trim() == '' ? 'HEAD^' : lastCommit

    def command = "git diff-tree -r --name-only ${currentCommit} ${lastCommit}"

    def changes0 = sh(script: command, returnStdout: true).trim()

    println("----------------------------------> ${changes0}")

    apps.each { e ->

      if(!lastCommit) {
        echo "First commit building ${e.name} ..."
        return
      }

      def changes = sh(script: "${command} -- projects/${e.name}", returnStdout: true).trim()

      println("***********************> ${changes}")

      if (!changes) {
        echo "No changes in the folder ${e.name}."
        return
      }

      echo "Changes found in the folder ${e.name}:"
      echo "${changes}"
    }
  }
}
