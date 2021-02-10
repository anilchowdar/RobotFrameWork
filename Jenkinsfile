@Library('jenkins-angular-sharedlib@file-copy-1.0.0') angularLib 
@Library('jenkins-aspnetcore-sharedlib@file-copy-1.0.0') aspnetcoreLib 
@Library('jenkins-nginx-sharedlib@1.0.0') nginxLib 


def nginxUtils = new NginxUtilities(this);
def angularDockerUtils = new AngularDockerUtilities(this);
def aspNetCoreUtils = new AspNetCoreUtilities(this);
def aspNetCoreK8sUtils = new AspNetCoreK8sUtil(this);

node {
    try {
        def projectName = "cleanuptruckscheduler";
        
        def cleanupApiArtifactName = "cleanup-webapi";
        def svcName = "cleanuptruckscheduler.service";
        def cleanupApiPath = "CleanupTruckScheduler/CleanupTruckScheduler.Api/CleanupTruckScheduler.Api";
        def ngProjectPath = "CleanupTruckScheduler/CleanupTruckScheduler.App";
        def gitBranch = "";

        stage('checkout') {
            // checkout scm
            checkout([$class: 'GitSCM', branches: [[name: '**']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'LocalBranch', localBranch: "**"]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'svc_jenkins', url: 'http://.git']]])
            gitBranch = sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim()
            sh "echo Start Jenkins Pipeline script for branch: ${gitBranch}"
        }
        
        dir("${cleanupApiPath}") {
            stage('cleanuptruck-api') {
                // compile
                aspNetCoreUtils.build(cleanupApiArtifactName);
                // test

                // integration test
                
                // deploy
                aspNetCoreUtils.deploy(gitBranch, projectName, svcName);
                // aspNetCoreK8sUtils.deploy(metaApiArtifactName, version, gitBranch, "../kubernetes/deployments/metadata-api-template.yaml"); 
                
                // swagger
                // aspNetCoreUtils.swaggerGen(metaApiArtifactName, gitTag, gitBranch, swaggerEndpoint, swaggerLang);
            }

            stage('nginx') {
                // TODO: pass in branch name
                nginxUtils.deploy(gitBranch, projectName);
            }
        }

        // Angular stuff
        dir("${ngProjectPath}") {
            stage('ng client') {
                // BUILD
                angularDockerUtils.compile('args')
                // DEPLOY ASSETS
                angularDockerUtils.deploy(gitBranch, "cleanuptruckscheduler", "cleanuptruckscheduler");
            }
        }

        // notify('Success')
    } catch(err) {
        notify("Error ${err}")
        currentBuild.result = 'FAILURE'
    }
    
}

def notify(status){
    emailext (
      to: " ",
      replyTo: 'noreply@jenkinsbuildserver',
      subject: "${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
      body: """<p>${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
        <p>Check console output at <a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a></p>""",
    )
}
