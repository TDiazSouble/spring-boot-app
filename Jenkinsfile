pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                sh "docker build -t spring-app-image:springboot ."
                sh "chmod +x -R ${env.WORKSPACE}"
                sh './build.sh'
            }
        }
    }
}
