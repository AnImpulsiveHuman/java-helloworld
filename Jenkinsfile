pipeline {
    agent any
    
    tools {
        maven "mvn"
        jdk "java"
    }
    
    stages {
        
        stage('clean') {
            
            steps {
                sh 'rm -rf java-helloworld'
                sh 'docker rmi everythingtogold/gold:myapp'
            }
        }
        
        stage('clone') {
            
            steps {
                sh 'git clone https://github.com/vishalpranav03/java-helloworld.git;'
            }
        }
        
        stage('mvnbuild') {
            
            steps {
                dir("${env.WORKSPACE}/java-helloworld") {
                sh 'mvn clean package'
                sh 'java -jar target/my-app-1.0-SNAPSHOT.jar;'
                }
            }
        }
        
        stage('dockerbuild') {
            
            steps {
                dir("${env.WORKSPACE}/java-helloworld") {
                sh 'docker build . -t everythingtogold/gold:myapp'
                }
            }
        }
    }
}
