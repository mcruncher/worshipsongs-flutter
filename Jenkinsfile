@Library(['flutter-libs']) _
pipeline {
    agent {
        kubernetes {
            yaml """${libraryResource('kubernetes/flutter-pod.yaml')}"""
        }
    }

    stages {
        stage('Prepare') {
            steps {
                prepareBuild()
            }
        }

        stage('Unit Tests & Quality') {
            steps {
                sh '''
                  flutter test --coverage
                '''

                def sonarScanner = "${tool 'SonarQube Scanner'}"
                withSonarQubeEnv('SonarQubeK8s') { // Name of SonarQube server in Jenkins
                    withEnv(["SONAR_HOST_URL=https://sonarcloud.io/summary"]) {
                        sh "${sonarScanner}/bin/sonar-scanner"
                    }
                }
            }
        }
    }
}