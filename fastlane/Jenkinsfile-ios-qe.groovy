#!/usr/bin/env groovy

//
//  Jenkinsfile-ios-qe.groovy
//  sImageViewer
//  Created by Duncan Wallace 08/21/2020
//  Copyright © 2020. Duncwa LLC.  All rights reserved

pipeline {
    agent { label "fastlane_qe" }

    options {
      ansiColor("xterm")
      timeout(time: 1, unit: "HOURS")
      buildDiscarder(logRotator(numToKeepStr: "20", artifactNumToKeepStr: "20"))
    }

    environment {
      DANGER_GITHUB_API_TOKEN = credentials("s.githubtoken")
      ghprbPullId = "${env.PULL_REQ_NUM}"
      BUILD_NUM = "${env.BUILD_ID}"
      SLACK_URL = credentials("s.slackwebhookurl")
      SLACK_CHANNEL = "${env.SLACK_CHANNEL}"
      DEVICE = "${env.DEVICE}"
      TEST_SCHEME = "${env.TEST_SCHEME}"
      TEST_PLAN = "${env.TEST_PLAN}"
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
      stage('Build and Test QE') {
        steps {
          echo 'Test QE'
          sh 'bundle exec fastlane test_ios_qe'
        }
        post {
          always { stash includes: "fastlane/*_output/**/*", name: "test_ios_qe", allowEmpty: true }
        }
      }
    }

    post {
      always {
        script {
          try { unstash "test_ios_qe" }  catch (e) { echo "Failed to unstash stash: " + e.toString() }
        }
        archiveArtifacts artifacts: "fastlane/*_output/**/*", fingerprint: true
      }

      success {
        sh "echo 'Build Successful' "
        sh "bundle exec fastlane post_qe_ios_slack_message run_time:${currentBuild.duration / 1000} status:${currentBuild.result}"
      }

      unstable {
        sh "echo 'Build Unstable' "
        sh "bundle exec fastlane post_qe_ios_slack_message run_time:${currentBuild.duration / 1000} status:${currentBuild.result}"

      }

      failure {
        sh "echo 'Build Failed' "
        sh "bundle exec fastlane post_qe_ios_slack_message run_time:${currentBuild.duration / 1000} status:${currentBuild.result}"
      }

    }
}
