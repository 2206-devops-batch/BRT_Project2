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
                sh "pip3 install -r ./requirements-dev.txt"
                // Run pytest
                // sh "python3 -m pytest test-app.py"
                sh 'chmod +x ./dockerpush.sh'
                sh 'ls -last'
                // build new image
                sh '. ./dockerpush.sh'
                
            }
        }
    }
    post { 
        failure { 
            echo 'Pytest Failed!'
        }
        success {
            echo "Success!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        }
    }

}
