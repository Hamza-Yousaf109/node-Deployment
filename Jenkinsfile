pipeline {

    agent any

    environment {
        COMPOSE_PROJECT = "node-app-stack"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'master', url: 'https://github.com/Hamza-Yousaf109/node-Deployment.git'
            }
        }

        stage('Stop Existing Containers') {
            steps {
                sh '''
                    docker compose down || true
                '''
            }
        }

        stage('Build & Start Containers (Docker Compose)') {
            steps {
                sh '''
                    docker compose up -d --build
                '''
            }
        }

        stage('Verify Containers') {
            steps {
                sh '''
                    docker ps
                '''
            }
        }
    }

    post {
        success {
            echo "🚀 Deployment Successful using Docker Compose!"
        }
        failure {
            echo "❌ Deployment Failed!"
        }
    }
}