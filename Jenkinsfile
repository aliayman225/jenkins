pipeline{
    agent any
    environment {
        DOCKERHUB_CREDENTIALS=credentials('dockerhubaccess')
    }
    stages {
 
        stage('gitclone') {
            steps {
                git 'https://github.com/aliayman225/jenkins.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t yasser744/demo:latest .'
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u 
                $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push yasser744/demo:latest'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
