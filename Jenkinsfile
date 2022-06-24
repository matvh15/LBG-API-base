pipeline {
	agent any
	environment {
		image_name="matvh15/lbg-api-app:latest"
	}
	stages {
		stage('Test') {
			steps {
				sh "npm install"
				sh "npm test"
			}
		}
		stage('Build') {
			steps {
				sh """
				echo "Build stage"
				docker build -t $image_name .
			}
		}
		stage('Deploy') {
			steps {
				//
				sh "echo Deploy stage"
			}
		}	
	}
}
