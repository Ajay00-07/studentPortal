pipeline{
    agent any

    environment{
        DOCKER_IMAGE ='ajaykumar2602/studentportal'
        DOCKER_TAG ='v2'
    }

    stages{
        stage('Clone Repository'){
            steps{
                git branch: 'main', url: 'https://github.com/Ajay00-07/studentPortal.git'
            }
        }

        stage('Docker Build Image'){
            steps{
                bat 'docker build -t %DOCKER_IMAGE%:%DOCKER_TAG .'
            }
        }

        stage('Docker Login'){
            steps{
                withCredentials([usernamePassword(
                credentialId: 'Dockerhub',
                usernameVariable: 'DOCKER_USER',
                passwordVariable: 'DOCKER_PASSWORD'
                )]){
                    bat 'echo %DOCKER_PASSWORD%| docker login -u %DOCKER_USER% --password-stdin'
                }
            }
        }

        stage('Push Image'){
            steps{
                bat 'docker push %DOCKER_IMAGE%:%DOCKER_TAG%'
            }
        }
    }

    post{
        success{
            echo 'Build Successfull..'
        }
        failure{
            echo 'Build Failed...'
        }
    }
}
