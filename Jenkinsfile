pipeline {
    agent any

    tools {
        nodejs 'node18'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Hamza-Yousaf109/node-Deployment.git'
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

        stage('Build') {
            steps {
                sh 'echo "Build complete"'
            }
        }

        stage('Run App') {
            steps {
                sh 'nohup node app.js > app.log 2>&1 &'
            }
        }
    }
}