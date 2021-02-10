node {

  try {
      stage('Test myapp') {
         echo "R ${currentBuild.result} C ${currentBuild.currentResult}"
         step([
            $class : 'RobotPublisher',
            outputPath : 'myapp/output/',
            outputFileName : "*.xml",
            disableArchiveOutput : false,
            passThreshold : 100,
            unstableThreshold: 95.0,
            otherFiles : "*/selenium-screenshot.png,*/report-.csv",
          ])
       }
       echo "R ${currentBuild.result} C ${currentBuild.currentResult}"
    } catch (e) {
       throw(e)
    } finally {
    }
}

