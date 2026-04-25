pipeline {
    agent any

    environment {
        IMAGE_NAME = "node-app"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test || true'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker rm -f node-container || true'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d --name node-container -p 3000:3000 $IMAGE_NAME'
            }
        }
    }
}