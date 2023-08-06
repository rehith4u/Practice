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
 	sh "docker push rehith4u/maven-web-app-docker:${buildNumber}"
}

// cat .kube/config ---> Copy and Paste in Jenkins
// Copy Kube Config file to Jenkins at Credentials

/**
stage("Deploy Application in K82 Cluster"){
	kubernetesDeploy(
            configs: 'springBootMongo.yml' ,
            kubeconfigId: 'KUBERNETES_CLUSTER_CONFIG' ,
            enableConfigSubstitution: true
      )
}
**/

stage("Deploy to Kubernetes Cluster"){
	sh 'kubectl apply -f springBootMongo.yml'
}

}