pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Test PRA'
                sh 'bundle exec fastlane test_ios_pra'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
