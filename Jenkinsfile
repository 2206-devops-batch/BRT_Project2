pipeline {
    agent none

    stages {
        stage('AMI_Agent') {
            agent {
                label 'myjenkinsagent'
            }
            steps {
                // Get some code from a GitHub repository
                sh 'whoami'
                sh 'pwd'
                checkout([$class: 'GitSCM', branches: [[name: '*/bs']],
                    userRemoteConfigs: [[url: 'https://github.com/2206-devops-batch/BRT_Project2']]])
                // Run venv
                // sh "python3 -m venv .venv"
                //tests print
                sh "echo This is inside the jenkins file"

                // Run pip install
                sh "pip3 install -r requirements-dev.txt"
                
                // Run pytest
                sh "python3 -m pytest test-app.py"
            }
        }
        stage('after ami') {
            agent any
            steps {
                sh 'whoami'
                sh 'pwd'
                sh "echo this is inside the jenkins console"
            }
        }

    }
}
