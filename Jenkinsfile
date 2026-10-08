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
                runFlutterTests()
            }
        }
    }

}