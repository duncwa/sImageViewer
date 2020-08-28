#!/usr/bin/env groovy

//
//  Jenkinsfile-ios-pra.groovy
//  sImageViewer
//  Created by Duncan Wallace 08/21/2020
//  Copyright © 2020. Duncwa LLC.  All rights reserved

pipeline {
  agent { label "fastlane_pra" }

  options {
    ansiColor("xterm")
    timeout(time: 1, unit: "HOURS")
    buildDiscarder(logRotator(numToKeepStr: "20", artifactNumToKeepStr: "20"))
  }

  environment {
    DANGER_GITHUB_API_TOKEN = credentials("s.githubtokentwo")
    DANGER_GITHUB_CREDS_USR = credentials("s.githubup")
    DANGER_GITHUB_API_TOKEN_USR = "${env.DANGER_GITHUB_CREDS_USR}"
    DANGER_GITHUB_API_TOKEN_PSW = "${env.DANGER_GITHUB_CREDS_PSW}"
    ghprbPullId = "${env.PULL_REQ_NUM}"
    CHANGE_ID = "${env.PULL_REQ_NUM}"
    BUILD_NUM = "${env.BUILD_ID}"
    PR_NUM = "${env.PULL_REQ_NUM}"
    PR_URL = "https://github.com/duncwa/sImageViewer/pull/${env.PULL_REQ_NUM}"
    GIT_URL_1 = "https://github.com/duncwa/sImageViewer/pull/${env.PULL_REQ_NUM}"
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
    stage('Build and Test PRA') {
      steps {
        echo 'Test PRA'
        sh 'bundle exec fastlane test_ios_pra'
      }
      post {
        always { stash includes: "fastlane/*_output/**/*", name: "test_ios_pra", allowEmpty: true }
      }
    }
  }

  post {
    always {
      script {
        try { unstash "test_ios_pra" }  catch (e) { echo "Failed to unstash stash: " + e.toString() }
      }
      sh "bundle exec fastlane ios_danger"
      archiveArtifacts artifacts: "fastlane/*_output/**/*", fingerprint: true
    }

    success {
      sh "echo 'Build Successful' "
      slackSend channel: SLACK, message: "Build Successful - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Link>)"
    }

    unstable {
      sh "echo 'Build Unstable' "
      slackSend channel: SLACK,  message: "Tests Failed - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Link>)"
    }

    failure {
      sh "echo 'Build Failed' "
      slackSend channel: SLACK,  message: "Build Failed - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Link>)"
    }
  }
}
