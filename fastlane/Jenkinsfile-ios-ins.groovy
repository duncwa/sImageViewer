#!/usr/bin/env groovy

//
//  Jenkinsfile-ios-qe.groovy
//  sImageViewer
//  Created by Duncan Wallace 08/21/2020
//  Copyright © 2020. Duncwa LLC.  All rights reserved

pipeline {
    agent { label "fastlane_ins" }

    options {
      ansiColor("xterm")
      timeout(time: 1, unit: "HOURS")
      buildDiscarder(logRotator(numToKeepStr: "5", artifactNumToKeepStr: "5"))
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
      stage('Inspect for Sensitive Data') {
          steps {
              echo 'Run Inspection'
              sh 'bundle exec fastlane run_ios_ins'
          }
          post {
            always { stash includes: "fastlane/*_output/**/*", name: "run_ios_ins", allowEmpty: true }
          }
      }
    }

    post {
      always {
        script {
          try { unstash "run_ios_ins" }  catch (e) { echo "Failed to unstash stash: " + e.toString() }
        }
        archiveArtifacts artifacts: "fastlane/*_output/**/*", fingerprint: true
        // archiveArtifacts artifacts: "*dSYM.zip", fingerprint: true
        archiveArtifacts artifacts: "*.ipa", fingerprint: true
      }

      success {
        sh "echo 'Build Successful' "
        slackSend channel: SLACK, message: "Inspect Successful - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Link>)"
      }

      unstable {
        sh "echo 'Build Unstable' "
        slackSend channel: SLACK,  message: "Inspect Failed - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Link>)"

      }

      failure {
        sh "echo 'Build Failed' "
        slackSend channel: SLACK,  message: "Inspect Failed - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Link>)"

      }

    }
}
