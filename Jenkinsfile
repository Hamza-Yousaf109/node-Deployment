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

        stage('Clean Old Containers') {
            steps {
                sh '''
                    echo "🧹 Cleaning old containers..."

                    docker compose down -v --remove-orphans || true

                    docker rm -f node-app-container || true
                    docker rm -f mongo-container || true

                    docker system prune -f || true
                '''
            }
        }

        stage('Build & Start Containers (Docker Compose)') {
            steps {
                sh '''
                    echo "🚀 Building and starting containers..."

                    docker compose up -d --build
                '''
            }
        }

        stage('Verify Containers') {
            steps {
                sh '''
                    echo "📦 Running containers:"
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