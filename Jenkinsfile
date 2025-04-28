pipeline {
    agent any

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    rm -rf node_modules
                    npm cache clean --force
                    ls -la
                    node --version
                    npm --version
                    npm ci
                    npm run build
                    ls -la
                '''
            }
        }
         stage('Test') {
            steps {
                echo "Testing..."
                sh '''
                    sh 'test -f build/index.html'
                '''
            }
        }
    }
}