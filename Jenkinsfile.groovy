
pipeline{
 
agent any

agent {
label "nodename"
}

tools{
maven "maven3.8.2"
}

stages{

	stage('Checkout Code'){
		steps{
		git branch: 'master', credentialsId: '.........', url: 'https://github.com/.......maven-web-application.git'
		}
    }

	stage('Build'){
		steps{
        sh "mvn clean package"
        }
    }

    stage('SonarQubeReport'){
        steps{
            sh "mvn sonar:sonar"
        }
    }

    stage('Upload Artifact into Nexus Repo'){
        steps{
            sh "mvn clean deploy"
        }
    }
    
    stage('Deploy into Tomcat'){
        steps{
            sshagent(['................']){
                sh "scp -o StrictHostKeyChecking=no /target/maven-web-application.war ec2-user@172.52.62/opt/apache-maven-3.8.6/webapps/"
            }
        }
    }

} //Stages Closed

post{  
    failure{
        Email Text Body: Build is Failed...!!
        Regards
        Rehith Siva, subject: 'Build is Over', to: 'rehith@yahoo.com'
    }

    success{
        Email Text Body: Build is Succesfull...!!
        Regards
        Rehith Siva, subject: 'Build is Over', to: 'rehith@yahoo.com'
    }
}

} //Pipeline Closed   