pipeline {
  agent any
  stages {
    stage('Checkout Scm') {
      steps {
        git 'https://github.com/anilchowdar/RobotFrameWork'
      }
    }

    stage('Shell script 0') {
      steps {
        sh '''#!/bin/bash
sudo python3 -m robot /var/lib/jenkins/workspace/*/*.robot
chmod +x *.robot'''
      }
    }

  }
  post {
    always {
      publishHTML(reportTitles: '', reportFiles: 'report.html', reportDir: '', keepAll: false, reportName: 'HTML Report', allowMissing: false, alwaysLinkToLastBuild: false)
    }

  }
  triggers {
    cron('H/2 * * * *')
  }
}
