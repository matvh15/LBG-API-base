pipeline {
	agent any
	environment {
		image_name="matvh15/lbg-api-app:latest"
		DOCKERHUB_USERNAME=credentials("DOCKERHUB_CREDS_USR")
		DOCKERHUN_PASSWORD=credentials("DOCKERHUB_CREDS_PSW")
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
		   		"""
			}
		}
		stage('Push') {
			steps {
				sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
				sh """
				echo "Push image to registry: "
				docker push $image_name
				"""
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
