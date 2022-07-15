pipeline {
    agent none

    stages {
        stage('myjenkinsagent') {
            agent {
                label 'AMI_Agent'
            }
            steps {
                // Get some code from a GitHub repository
                sh 'whoami'
                sh 'pwd'
                git 'https://github.com/2206-devops-batch/Roderick-Project1.git'

                // Run venv
                // sh "python3 -m venv .venv"
                //tests print
                sh "echo This is inside the jenkins file"

                // Run pip install
                sh "pip3 install -r requirements-dev.txt"
                
                // Run pytest
                sh "python3 -m pytest app-test.py"
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
