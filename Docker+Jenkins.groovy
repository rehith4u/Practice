node{

 def mavenHome = tool name: "maven3.8.2"
 def buildNumber = BUILD_NUMBER

 
       echo "GitHub BranhName ${env.BRANCH_NAME}"
       echo "Jenkins Job Number ${env.BUILD_NUMBER}"
       echo "Jenkins Node Name ${env.NODE_NAME}"
  
       echo "Jenkins Home ${env.JENKINS_HOME}"
       echo "Jenkins URL ${env.JENKINS_URL}"
       echo "JOB Name ${env.JOB_NAME}"

 stage('CheckOutCode')
 {
 git branch: 'development', credentialsId: '12993250-1ff3-40a0-9978-794e74dcf712', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
 }
 
 stage('Build')
 {
  sh "${mavenHome}/bin/mvn clean package"
 }

 stage('SonarQubeReport'){
 sh "${mavenHome}/bin/mvn clean sonar:sonar"
 }

 stage("Build Docker Image"){
	sh "docker build -t rehith4u/java-web-app-docker:${buildNumber} ."
}

 stage("Docker Login and Push"){
	withcredentials([.....DockerHubPwd...........]){
	sh "docker login -u rehith4u -p ${DockerHubPwd}"
}
 	sh "docker push	rehith4u/maven-web-app-docker:${buildNumber}"
}

stage("Deploy Application as Container in Docker Deployment Server"){
	sshagent (['Docker_SSH']){
     sh "ssh -o StrictHostKeyChecking=no ubuntu@172.36.65.9 docker rm -f javawebappcontainer || true"

     sh "ssh -o StrictHostKeyChecking=no ubuntu@172.36.65.9 docker run -d -p 8080:8080 --name javawebappcontainer rehith4u/maven-web-app-docker:${buildNumber}"
    }
}

}