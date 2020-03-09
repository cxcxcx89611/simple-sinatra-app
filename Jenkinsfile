// Jenkinsfile
String credentialsId = 'awsCredentials'


try {
  stage('checkout') {
    node (label: 'Slave01') {
      cleanWs()
      checkout scm
    }
  }

  // Run terraform plan
  stage('deploy') {
    node (label: 'Slave01') {
      withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: credentialsId,
        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
      ]]) {
        ansiColor('xterm') {
          sh 'cd .. &&  mkdir -p ./artifacts/SinatraAPP/ && mv ${WORKSPACE}/* ./artifacts/SinatraAPP/'
        }
      }
    }
  }
  currentBuild.result = 'SUCCESS'
}
catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException flowError) {
  currentBuild.result = 'ABORTED'
}
catch (err) {
  currentBuild.result = 'FAILURE'
  throw err
}
finally {
  if (currentBuild.result == 'SUCCESS') {
    currentBuild.result = 'SUCCESS'
  }
}
