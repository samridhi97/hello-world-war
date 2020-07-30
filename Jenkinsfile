pipeline {
    environment { 
        registry = "sri199008/hello_war"
        registryCredential = 'dockerhub'
        dockerImage = '' 
    }
    agent none

    stages {
        stage('SCM Checkout') {
            agent any
            steps {
                git 'https://github.com/sri008/hello-world-war.git'
            }
        }
        stage('Build') {
            agent{
                docker {
                    image 'maven:3-alpine' 
                    args '-v /root/.m2:/root/.m2' 
                }
            }
            steps {
                 sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Build Image') {
            agent any
            steps {
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }

            }
        }
        stage('Deploy Image') {
            agent any
            steps {
               script { 
                   docker.withRegistry( '', registryCredential ) { 
                       dockerImage.push() 
                   }
               }

            }
        }
        stage('Remove Unused Docker Image') { 
            agent any
            steps{ 
                 sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        }
    }
}
