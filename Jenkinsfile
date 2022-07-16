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

                // Run pip install
                sh "pip3 install -r requirements-dev.txt"
                sh 'docker info'
                // Run pytest
                sh "python3 -m pytest test-app.py"
                sh 'echo "will i run?"'
                sh 'ls -last'
            }
        }
        // stage('Push To Docker') {
        //     agent {
        //         label 'myjenkinsagent'
        //     }
        //     steps {
        //         sh 'whoami'
        //         sh 'pwd'
        //         sh 'ls -last'
        //         //  clean old docker images
        //         // sh 'docker build -t flaskapp .'
        //         // sh 'docker images'
        //     }
        // }

    }
}
