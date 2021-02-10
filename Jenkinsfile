timestamps {
node () {
   stage ('RobotFrameWork - Checkout') {
     //Git Checkout
       checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/anilchowdar/RobotFrameWork']]])
       gitBranch = sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim() 
	}
   stage ('RobotFrameWork - Build') {
 	 // Shell build step
    sh """  
      sudo /opt/jenkins.sh 
       """ 
    }
   stage ('RobotFrameWork - Publish HTML Reports') {
     // publish html
     // snippet generator doesn't include "target:"
    publishHTML (target: [
      allowMissing: false,
      alwaysLinkToLastBuild: false,
      keepAll: true,
      reportDir: '/var/lib/jenkins/workspace/RobotFrameWork/',
      reportFiles: 'report.html',
      reportName: "Report HTML"
    ])
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
