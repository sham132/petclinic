pipeline {
    agent any
    environment {
        dockerhub=credentials('Ehtasham-dockerhub')

        }
    stages {
        // Step 1
        stage('SCM') {
                steps {
                    git 'https://github.com/sham132/petclinic.git'
                }        
        }
        // Step 2
        stage('Build by Maven') {
                steps {
                      withMaven(maven: 'Maven') {
                        sh 'mvn clean package'
                }
                }
        }
        // Step 3
        stage('Build docker image') {
                steps {
                    sh "sudo docker build -t pmd1234/ehtashamdev:${BUILD_NUMBER} ."
                }
        }
        tage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: "JenkinsAccessToken", url: "https://hub.docker.com"]) {
                    bat "docker push pmd1234/ehtashamdev:${BUILD_NUMBER}"
                }
            }
        } 
    }
}      
