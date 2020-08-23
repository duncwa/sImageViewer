#!/usr/bin/env groovy

//
//  Jenkinsfile-ios-pra.groovy
//  sImageViewer
//  Created by Duncan Wallace 08/21/2020
//  Copyright © 2020. Duncwa LLC.  All rights reserved


pipeline {
    agent { any }

    options {
      ansiColor("xterm")
      timeout(time: 1, unit: "HOURS")
      buildDiscarder(logRotator(numToKeepStr: "5", artifactNumToKeepStr: "1"))
    }

    environment {
      ghprbPullId = "${env.PULL_REQ_NUM}"
      BUILD_NUM = "${env.BUILD_ID}"
      PR_NUM = "${env.PULL_REQ_NUM}"
      PR_URL ="https://github.com/duncwa/sImageViewer/pull/${env.PULL_REQ_NUM}"
    }

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
      stage('Build') {
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
        // sh "bundle exec fastlane danger"
        archiveArtifacts artifacts: "Fastlane*_output/**/*", fingerprint: true
      }

      sucess {
        sh "echo 'Build Successful' "
      }

      unstable {
        sh "echo 'Build Unstable' "

      }

      failure {
        sh "echo 'Build Failed' "

      }

    }
}
