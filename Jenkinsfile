node {
    stage('build') {
        //get code from github
      try {
          git 'https://github.com/anilchowdar/RobotFrameWork.git'
        //Get Shell script from Opt directory
          sh 'sudo /opt/jenkins.sh'
      }
      catch (err) {
          echo err
      }
    }
}
