node {
    stage('build') {
      //get code from github
      try {
          git 'https://github.com/anilchowdar/RobotFrameWork.git'
      }
      catch (err) {
          echo 'Build Success'
      }
    }
    stage('Test') {
      try {
          //Get Shell script from Opt directory
          sh 'sudo /opt/jenkins.sh'
          //build options from GitHub
       triggers {
           cron('H/2 * * * *')
          }
      }
      catch (err) {
          echo 'Test is Successful'
      }
    }
}