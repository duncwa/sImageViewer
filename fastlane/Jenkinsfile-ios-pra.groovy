pipeline {
    agent any

    stages {
      stage('Setup') {
          steps {
              echo 'Install Bundle Ruby Gems'
              sh 'bundle install'
              sh 'pwd'
          }
      }
        stage('Build') {
            steps {
                echo 'Test PRA'
                sh 'pwd'
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
