pipeline {
  agent any
  environment {
    QA_SERVER = 'https://qa.application.com/'
    CT_SERVER = 'http://ct.application.com/'

  }
  stages {
	    stage('intialize') {
	      steps {
	        sh 'echo "PATH= ${PATH}'
	      }
	    }
    
	    stage('Run Robot Tests') {
	      steps {
		        	sh 'python3 -m robot /var/lib/jenkins/workspace/RobotFrameWork/data_driven.robot'
		        	sh 'python3 -m robot /var/lib/jenkins/workspace/RobotFrameWork/log.html'
				sh 'chmod +x data_driven.robot'
		        	sh 'exit 0'
	      		}
	      post {
        	always {
		        script {
		          step(
			            [
			              $class              : 'RobotPublisher',
			              outputPath          : 'reports',
			              outputFileName      : '**/output.xml',
			              reportFileName      : '**/report.html',
			              logFileName         : '**/log.html',
			              disableArchiveOutput: false,
			              passThreshold       : 50,
			              unstableThreshold   : 40,
			              otherFiles          : "**/*.png,**/*.jpg",
			            ]
		          	)
		        }
	  		}		
	    }
	}    
  }
  
}
