pipeline {
    agent any

    stages {
      stage('Setup') {
          steps {
              echo 'Install Bundle Ruby Gems'
              sh 'bundle install'
          }
      }
        stage('Build') {
            steps {
                echo 'Test PRA'
                sh 'bundle exec fastlane test_ios_pra'
            }
        }
        stage('Inspect') {
            steps {
                echo 'Inspecting..'
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
