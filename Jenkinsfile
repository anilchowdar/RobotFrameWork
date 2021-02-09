node {
    stage('build') {
        //get code from github
      try {
          git 'https://github.com/anilchowdar/RobotFrameWork.git'
      }
      catch (err) {
          echo err
      }
    }
    stage('Test') {
        //Get Shell script from Opt directory
          sh 'sudo /opt/jenkins.sh'
        //build options from GitHub
          scm('H/15 * * * *')
    }
}
