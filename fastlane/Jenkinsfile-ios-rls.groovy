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
      stage('Build and Upload IPA') {
          steps {
              echo 'Generate IPA'
              sh 'bundle exec fastlane publish_rls_ipa'
          }
          post {
            always { stash includes: "fastlane/build/**/*", name: "publish_rls_ipa", allowEmpty: true }
          }
      }
    }

    post {
      always {
        script {
          try { unstash "publish_rls_ipa" }  catch (e) { echo "Failed to unstash stash: " + e.toString() }
        }
        archiveArtifacts artifacts: "fastlane/build/*dSYM.zip", fingerprint: true
        archiveArtifacts artifacts: "fastlane/build/*.ipa", fingerprint: true
      }

      success {
        sh "echo 'IPA Successful' "
        sh "bundle exec fastlane post_rls_slack_message run_time:${currentBuild.duration / 1000} status:${currentBuild.result}"
      }

      unstable {
        sh "echo 'IPA Unsuccessful' "
        sh "bundle exec fastlane post_rls_slack_message run_time:${currentBuild.duration / 1000} status:${currentBuild.result}"
      }

      failure {
        sh "echo 'IPA Failed' "
        sh "bundle exec fastlane post_rls_slack_message run_time:${currentBuild.duration / 1000} status:${currentBuild.result}"
      }

    }
}
