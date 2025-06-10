pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Newman') {
            steps {
                bat 'npm install -g newman newman-reporter-htmlextra'
            }
        }

        stage('Run API Tests') {
            steps {
                // Exécute le script batch de tests
                bat 'entrypoint.bat'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'newman-report/report.html', allowEmptyArchive: true
        }
    }
}
