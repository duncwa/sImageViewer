pipeline {
    agent any

    stages {
      stage('Setup') {
          steps {
              echo 'Install Bundle Ruby Gems'
              sh 'bundle install'
              sh 'pwd'
              sh 'echo $PATH'
              sh 'rvm list'
          }
      }
      stage('Build and Upload IPA') {
          steps {
              echo 'Generate IPA'
              sh 'bundle exec fastlane generate_dev_ipa'
          }
          post {
            always { stash includes: "fastlane/*_output/**/*", name: "generate_dev_ipa", allowEmpty: true }
          }
      }
    }

    post {
      always {
        script {
          try { unstash "generate_dev_ipa" }  catch (e) { echo "Failed to unstash stash: " + e.toString() }
        }
        // sh "bundle exec fastlane danger"
        archiveArtifacts artifacts: "fastlane/*_output/**/*", fingerprint: true
      }

      success {
        sh "echo 'IPA Successful' "
        slackSend channel: SLACK, message: "IPA Generate Successful - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Link>)"
      }

      unstable {
        sh "echo 'IPA Unsuccessful' "
        slackSend channel: SLACK,  message: "IPA Generate Failed - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Link>)"

      }

      failure {
        sh "echo 'IPA Failed' "
        slackSend channel: SLACK,  message: "IPA Generate Failed- ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Link>)"

      }

    }
}
