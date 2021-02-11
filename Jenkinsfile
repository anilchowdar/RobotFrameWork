pipeline {
  agent any
  stages {
    stage('Checkout Scm') {
      steps {
        git(url: 'https://github.com/anilchowdar/RobotFrameWork', credentialsId: '89678e7e-057b-4d24-a0b4-2878dbe5d38d')
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
      build(job: 'Testingggg')
      publishHTML(reportTitles: '', reportFiles: 'report.html', reportDir: '', keepAll: false, reportName: 'HTML Report', allowMissing: false, alwaysLinkToLastBuild: false)
    }

  }
  triggers {
    cron('H/2 * * * *')
  }
}
