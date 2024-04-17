pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('b0b85ebe-581c-43ea-b532-3427df4be1a2')
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Use the 'tool' directive to select the default Docker installation
                    def dockerHome = tool 'docker'
                    bat "${dockerHome}\\docker build -t aliayman225/demo:latest ."
                }
            }
        }

        stage('Login') {
            steps {
                script {
                    def dockerHome = tool 'docker'
                    // Use the 'withCredentials' block to securely handle credentials
                    withCredentials([usernamePassword(credentialsId: 'YOUR_CREDENTIALS_ID', passwordVariable: 'DOCKERHUB_CREDENTIALS_PSW', usernameVariable: 'DOCKERHUB_CREDENTIALS_USR')]) {
                        bat "echo %DOCKERHUB_CREDENTIALS_PSW% | ${dockerHome}\\docker login -u %DOCKERHUB_CREDENTIALS_USR% --password-stdin"
                    }
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    def dockerHome = tool 'docker'
                    bat "${dockerHome}\\docker push aliayman225/demo:latest"
                }
            }
        }
    }

    post {
        always {
            script {
                def dockerHome = tool 'docker'
                bat "${dockerHome}\\docker logout"
            }
        }
    }
}
