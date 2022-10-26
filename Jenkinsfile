pipeline {
    agent any
    environment {
        dockerhub=credentials('dockerhub')
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
                        sh 'mvn package -Dmaven.test.skip=true'
                }
                }
        }
        // Step 3
        stage('Build docker image') {
                steps {
                    sh "docker build -t pmd1234/ehtashamdev:${BUILD_NUMBER} ."
                }
        }
		// Step 4
		stage('Login') {
                steps {
				    echo 'Login Begin ...'
					sh 'echo $dockerhub_USR'
                    sh "docker login -u pmd1234 -p dckr_pat_mYtDJa8uGvBaP9yg8MXyTjlhbQU"
					
                }
        }
		// Step 5
		stage('Pushing Code to Docker Hub') {
                steps {
				    echo 'Pushing to DockerHub Begins ...'
                    sh "docker push pmd1234/ehtashamdev:${BUILD_NUMBER}"
                }
        }
		
		 stage('Deploy Java in QA/Test Env') {
                steps {
					sh "docker rm -f pmd1234"            
					sh "docker run  -d -p 1223:8080 --name pmd1234   pmd1234/ehtashamdev:${BUILD_NUMBER}"           
                }
        }
       
    }
}      



