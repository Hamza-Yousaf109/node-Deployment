pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Hamza-Yousaf109/node-Deployment.git'
            }
        }

        stage('Clean Old Containers') {
            steps {
                sh '''
                    docker compose down -v --remove-orphans || true
                '''
            }
        }

        stage('Build & Deploy') {
            steps {
                sh '''
                    docker compose up -d --build
                '''
            }
        }

        stage('Verify') {
            steps {
                sh 'docker ps'
            }
        }
    }

    post {
        success {
            echo "🚀 Deployment Successful with Docker Compose"
        }
        failure {
            echo "❌ Deployment Failed"
        }
    }
}