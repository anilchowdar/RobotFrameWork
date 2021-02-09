node {
    stage('build') {
        //get code from github
      try {
          git 'https://github.com/anilchowdar/RobotFrameWork.git'
        //Get Shell script from Opt directory
          sh 'sudo /opt/jenkins.sh'
        //build options from GitHub
          cron('H/15 * * * *')
      }
      catch (err) {
          echo err
      }
    }
}
