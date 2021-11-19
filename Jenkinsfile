pipeline {
    agent any
    
    tools {
        maven "mvn"
        jdk "java"
    }
    
    stages {
        
        stage('devdeploy') {
            
            steps {
                sh 'rm -rf java-helloworld'
                sh 'docker rmi everythingtogold/gold:myapp'
                sh 'git clone https://github.com/vishalpranav03/java-helloworld.git;'
                sh 'git tag "$BUILD_NUMBER"'
                dir("${env.WORKSPACE}/java-helloworld") {
                sh 'mvn clean package'
                sh 'java -jar target/my-app-1.0-SNAPSHOT.jar;'
                sh 'docker build . -t "everythingtogold/gold:myapp"'
                withCredentials([usernamePassword(credentialsId: '2', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh 'docker login --username $USERNAME --password $PASSWORD'
                sh 'docker push "everythingtogold/gold:myapp"'
                }
                }
                }
            }
        }
}
