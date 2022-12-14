podTemplate(yaml: '''
    apiVersion: v1
    kind: Pod
    spec:
      containers:
      - name: 'git'
        image: 'alpine/git'
        ttyEnabled: true
        command:
        - cat
      - name: 'docker'
        image: 'docker'
        command: 
        - cat
        ttyEnabled: true
      - name: kubectl
        image: bitnami/kubectl:1.16.3
        command:
        - cat
        tty: true
''') {
  node(POD_LABEL) {

    stage('build') {

      git 'https://github.com/TDiazSouble/spring-boot-app'
      container('docker') {
        stage('build project') {
            dir('hello-world-war/') {

                sh '''
                eval $(minikube docker-env)
                docker build -t spring-app-image:springboot .
                echo hello from $POD_CONTAINER
          '''
            }
        }
      }
    }

    stage('deploy') {

      container('kubectl') {
        stage('Deploy') {

          sh '''
           kubectl create deployment springboot-kubernetes --image=spring-app-image:springboot --port=8080
           kubectl expose deployment springboot-kubernetes --type=NodePort
          '''
          
        }
      }
    }

  }
}
