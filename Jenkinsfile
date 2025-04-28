pipeline {
    agent any  // Use any available agent (can also use a specific docker agent)

    environment {
        // Set Docker Hub credentials and repository details
        DOCKER_CREDENTIALS = 'docker-hub-credentials'  // Jenkins credentials ID for Docker Hub login
        DOCKER_IMAGE_NAME = 'elvin98bc/app-jenkins'  // Docker image name (repository) on Docker Hub
        DOCKER_TAG = 'latest'  // Docker tag for the image
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from the repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the repository
                    sh 'docker build -t $DOCKER_IMAGE_NAME:$DOCKER_TAG .'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub using Jenkins credentials
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh '''
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                    '''
                }
            }
        }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    sh 'docker push $DOCKER_IMAGE_NAME:$DOCKER_TAG'
                }
            }
        }

        stage('Cleanup') {
            steps {
                // Clean up local Docker images to free up space on the Jenkins agent
                sh 'docker rmi $DOCKER_IMAGE_NAME:$DOCKER_TAG'
            }
        }
    }

    post {
        always {
            // Always run this block, regardless of success or failure
            echo 'Cleaning up after pipeline'
            sh 'docker system prune -f'  // Prune unused Docker images and containers
        }
    }
}