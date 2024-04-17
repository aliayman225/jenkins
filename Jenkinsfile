pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('b0b85ebe-581c-43ea-b532-3427df4be1a2')
    }
    stages {
        stage('Build') {
            steps {
                script {
                    def dockerImage = docker.build('aliayman225/demo:latest', '.')
                    // You can perform additional operations with the dockerImage if needed
                }
            }
        }
        stage('Login') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        docker.login(username: DOCKERHUB_CREDENTIALS_USR, password: DOCKERHUB_CREDENTIALS_PSW)
                    }
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        docker.image('aliayman225/demo:latest').push()
                    }
                }
            }
        }
    }
    post {
        always {
            script {
                docker.withRegistry('', 'docker-hub-credentials') {
                    docker.logout()
                }
            }
        }
    }
}
