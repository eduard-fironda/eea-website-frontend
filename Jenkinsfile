pipeline {
  environment {
    GIT_NAME = "eea-website-frontend"
    registry = "eduardvalentin/eea-website-frontend"
    dockerImage = ''
    tagName = ''
  }

  agent any

  stages {
    stage('Build & Push ( on tag )') {
      steps {
        script {
          checkout scm
          tagName = "latest" // Example
          withCredentials([usernamePassword(credentialsId: 'your-dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
            sh """
            echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
            docker buildx create --use
            docker buildx build --platform linux/amd64,linux/arm64 -t $registry:$tagName --push .
            docker buildx rm
            """
          }
        }
      }
    }
  }
}
