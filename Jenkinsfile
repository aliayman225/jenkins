pipeline{
    agent any
    environment {
        DOCKERHUB_CREDENTIALS=credentials('dockerhubaccess')
    }
    stages {
 
        stage('Build') {
            steps {
                sh 'docker build -t aliayman225/demo:latest .'
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push aliayman225/demo:latest'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
