pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Récupère le code du repo GitHub lié à ce Jenkinsfile
                checkout scm
            }
        }

        stage('Install Newman') {
            steps {
                // Installe Newman et le reporter htmlextra
                sh 'npm install -g newman newman-reporter-htmlextra'
            }
        }

        stage('Run API Tests') {
            steps {
                // Rends le script exécutable au cas où
                sh 'chmod +x entrypoint.sh'
                // Exécute les tests via le script
                sh './entrypoint.sh'
            }
        }
    }

    post {
        always {
            // Archive le rapport HTML généré pour qu'il soit consultable dans Jenkins
            archiveArtifacts artifacts: 'newman-report/report.html', allowEmptyArchive: true
        }
    }
}
