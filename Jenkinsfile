pipeline {
    agent {
        docker {
            image 'node:18-alpine'
            args '-v /var/run/docker.sock:/var/run/docker.sock' // Mount Docker socket
        }
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                    ls -la
                    node --version
                    npm --version
                    docker build -t myapp:latest .
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                    docker run -d -p 30000:3000 myapp:latest
                    sleep 5
                    curl -f http://localhost:30000
                '''
            }   
        }
    }
}