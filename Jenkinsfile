pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                sh '$(which curl)'
                sh '$(which curl)-LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'  
                sh 'chmod +x ./kubectl'  
                sh '$(which kubectl)get pods'
                sh "chmod +x -R ${env.WORKSPACE}"
                sh './build.sh'
            }
        }
    }
}
