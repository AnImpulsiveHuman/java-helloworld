pipeline {
    agent any
    
    tools {
        maven "mvn"
        jdk "java"
    }
    
    stages {
        
        stage('devdeploy') {
            
            steps {
                input('Do you want to proceed to the Deployment?')
                sh 'rm -rf java-helloworld'
                //sh 'docker rmi "everythingtogold/gold:build-$BUILD_NUMBER"'
                sh 'git clone https://github.com/vishalpranav03/java-helloworld.git;'
                sh 'git tag -a $BUILD_NUMBER -m "Build Number-$BUILD_NUMBER"'
                sh 'git push --tags --force'
                dir("${env.WORKSPACE}/java-helloworld") {
                sh 'mvn clean package'
                sh 'java -jar target/my-app-1.0-SNAPSHOT.jar;'
                sh 'docker build . -t "everythingtogold/gold:build-$BUILD_NUMBER"'
                withCredentials([usernamePassword(credentialsId: '2', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh 'docker login --username $USERNAME --password $PASSWORD'
                sh 'docker push "everythingtogold/gold:build-$BUILD_NUMBER"'
                }
                }
                }
            }
        }
}
