pipeline {
	agent any
	environment {
		APP_NAME="lbg-api-app"
		TAG="latest"
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
				docker build -t ${APP_NAME}:${TAG} .
		   		"""
			}
		}
		stage('Push') {
			steps {
				sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
				sh """
				echo "Push image to registry: "
				docker push ${APP_NAME}:${TAG}
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
