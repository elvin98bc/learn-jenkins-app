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
        // agent {
        //     docker {
        //         image 'node:18-alpine'
        //         reuseNode true
        //     }
        // }
            steps {
                echo "Testing..."
                sh '''
                    ls -la
                    pwd
                    cat build/index.html
                    sh 'test -f build/index.html'
                '''
                }
            }   
    }
}

// pipeline {
//     agent any

//     stages {
//         stage('Build') {
//             agent {
//                 docker {
//                     image 'node:18-alpine'
//                     reuseNode true
//                 }
//             }
//             steps {
//                 sh '''
//                     # Debugging: Check the workspace and the initial file list
//                     ls -la
//                     node --version
//                     npm --version

//                     # Install dependencies and build the project
//                     npm ci
//                     npm run build
                    
//                     # Debugging: Check the file structure after the build
//                     ls -la build
//                 '''
//             }
//         }

//         stage('Test') {
//             steps {
//                 echo "Testing..."
//                 sh '''
//                     # Debugging: Verify the current working directory and file structure
//                     ls -la
//                     pwd

//                     # Check if index.html exists in the build directory
//                     cat build/index.html

//                     # Use test -f to check if index.html exists
//                     test -f build/index.html && echo "index.html exists" || echo "index.html does not exist"
//                 '''
//             }
//         }   
//     }
//}