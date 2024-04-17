pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('b0b85ebe-581c-43ea-b532-3427df4be1a2')
	}

	stages {
	    

		stage('Build') {

			steps {
				bat 'docker build -t aliayman225/demo:latest .'
			}
		}

		stage('Login') {

			steps {
				bat 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				bat 'docker push aliayman225/demo:latest'
			}
		}
	}

	post {
		always {
			bat 'docker logout'
		}
	}

}
