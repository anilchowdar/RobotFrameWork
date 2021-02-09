import groovy.util.FileNameFinder
import javaposse.jobdsl.dsl.DslScriptLoader
import javaposse.jobdsl.plugin.JenkinsJobManagement
import org.junit.ClassRule
import org.jvnet.hudson.test.JenkinsRule
import spock.lang.Shared
import spock.lang.Specification
import spock.lang.Unroll

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
      try {
         //Get Shell script from Opt directory
          sh 'sudo /opt/jenkins.sh'
        //build options from GitHub
          scm('H/15 * * * *')
      }
    }
}
