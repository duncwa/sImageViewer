#!/usr/bin/env groovy

//
//  Jenkinsfile-ios-rls.groovy
//  sImageViewer
//  Created by Duncan Wallace 08/21/2020
//  Copyright © 2020. Duncwa LLC.  All rights reserved

pipeline {
    agent { label "fastlane_rls" }

    options {
      ansiColor("xterm")
      timeout(time: 1, unit: "HOURS")
      buildDiscarder(logRotator(numToKeepStr: "20", artifactNumToKeepStr: "20"))
    }

    environment {
      BUILD_NUM = "${env.BUILD_ID}"
      SLACK = "#cs-simageviewer-jenkins"
    }

    stages {
      stage('Setup') {
          steps {
              echo 'Install Bundle Ruby Gems'
              sh 'bundle install'
              sh 'pwd'
              sh 'echo $PATH'
              sh 'rvm list'
              sh 'printenv'
          }
      }
      stage('Build and Upload IPA') {
          steps {
              echo 'Generate IPA'
              sh 'bundle exec fastlane generate_rls_ipa'
          }
          post {
            always { stash includes: "fastlane/*_output/**/*", name: "generate_rls_ipa", allowEmpty: true }
          }
      }
    }

    post {
      always {
        script {
          try { unstash "generate_rls_ipa" }  catch (e) { echo "Failed to unstash stash: " + e.toString() }
        }
        archiveArtifacts artifacts: "fastlane/*_output/**/*", fingerprint: true
        archiveArtifacts artifacts: "*dSYM.zip", fingerprint: true
        archiveArtifacts artifacts: "*.ipa", fingerprint: true
      }

      success {
        sh "echo 'IPA Successful' "
        slackSend channel: SLACK, message: "AppStore IPA Generate Successful - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Link>)"
      }

      unstable {
        sh "echo 'IPA Unsuccessful' "
        slackSend channel: SLACK,  message: "AppStore IPA Generate Failed - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Link>)"

      }

      failure {
        sh "echo 'IPA Failed' "
        slackSend channel: SLACK,  message: "AppStore IPA Generate Failed- ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Link>)"

      }

    }
}
