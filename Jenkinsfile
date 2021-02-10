#!/usr/bin/env groovy

import hudson.model.*
import hudson.EnvVars
import groovy.json.JsonSlurperClassic
import groovy.json.JsonBuilder
import groovy.json.JsonOutput
import java.net.URL


node {
    timestamps {
            stage('Build') {
            // checkout scm
            checkout([$class: 'GitSCM', branches: [[name: '**']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'LocalBranch', localBranch: "**"]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'svc_jenkins', url: 'https://github.com/anilchowdar/RobotFrameWork.git']]])
            gitBranch = sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim()
            }
            stage("Test") {
                timeout(time: 2, unit: "MINUTES") {
                    sh "echo Start Jenkins Pipeline script for branch: ${gitBranch}"
                }
            }
            stage('Smoke') {
        try {
            sh "mvn clean verify -Dtags='type:Smoke'"
        } catch (err) {
            
        } finally {
            publishHTML (target: [
            reportDir: 'target/site/serenity',
            reportFiles: 'index.html',
            reportName: "Smoke tests report"
            ])
        }
   }
    }
}

def notify(status){
    emailext (
      to: "kumarchowdary467@gmail.com",
      replyTo: 'noreply@jenkinsbuildserver',
      subject: "${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
      body: """<p>${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
        <p>Check console output at <a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a></p>""",
    )
}
