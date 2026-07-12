pipeline {

    agent any

    stages {

        stage('Clone') {
            steps {
                echo 'Récupération du code'
            }
        }

        
        stage('Build') {
            steps {
                echo 'BUILD ROBOTCOMBAT TP8'
            }
        }


        stage('Test') {
            steps {
                echo 'Exécution des tests'
            }
        }

        stage('Package') {
            steps {
                echo 'Génération du WAR'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Déploiement'
            }
        }
    }
}
