pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                sh "chmod +x -R ${env.WORKSPACE}"
                sh './build.sh'
            }
        }
    }
}
