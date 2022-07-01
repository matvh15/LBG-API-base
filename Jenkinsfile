pipeline {
	agent any
	environment {
		APP_NAME="lbg-api-app"
		TAG="latest"
		//DOCKERHUB_CREDS=credentials("DOCKERHUB_CREDS")
		REGISTRY="gcr.io/lbg6-130622"
	}
	stages {
		stage('Test') {
			steps {
				sh "npm install"
				sh "npm test"
			}
		}
		stage('Sonar') {
			steps {
				sh "sonar-scanner -Dsonar.host.url=http://localhost:9000 -Dsonar.login=admin -Dsonar.password=password"
			}
		}
		stage('Build') {
			steps {
				sh """
				echo "Build stage"
				docker build -t ${REGISTRY}/${APP_NAME}:${BUILD_NUMBER} .
		   		"""
			}
		}
		stage('Push') {
			steps {
				//sh "docker login -u ${DOCKERHUB_CREDS_USR} -p ${DOCKERHUB_CREDS_PSW}"
				sh """
				echo "Push image to registry: "
				docker push ${REGISTRY}/${APP_NAME}:${BUILD_NUMBER}
				"""
			}	
		}
		stage('Deploy') {
			steps {
				sh "kubectl apply -f kubernetes/service.yml"
				sh "sed -e 's,{{IMAGE_NAME}},${REGISTRY}/${APP_NAME}:${BUILD_NUMBER},g' kubernetes/application.yml | kubectl apply -f -"
			}
		}
	}
}
