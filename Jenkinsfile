pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the Flask application...'
                sh 'python3 --version'
                sh 'python3 -m py_compile app.py'
            }
        }
        stage('Test') {
            steps {
                echo 'Running unit tests...'
                sh 'python3 -m unittest discover -s . -v'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                sh '''
                mkdir -p ${WORKSPACE}/python-app-deploy
                cp ${WORKSPACE}/app.py ${WORKSPACE}/requirements.txt ${WORKSPACE}/python-app-deploy/
                echo "Deployment directory contents:"
                ls -l ${WORKSPACE}/python-app-deploy
                '''
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for more details.'
        }
    }
}
