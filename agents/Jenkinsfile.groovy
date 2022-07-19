pipeline {
    agent none
    // environment {
    //     CREDS = credentials('bryon_user_password')
    // }
    stages {
        stage('Get Git') {
            agent {
                label 'agent1'
            }
            steps {
                // Get some code from a GitHub repository
                sh 'echo "agent1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"'
                checkout([$class: 'GitSCM', branches: [[name: '*/bryon']],
    userRemoteConfigs: [[url: 'https://github.com/2206-devops-batch/BCEM-Project2.git']]])
                sh '. ./temp.sh'
                sh "pwd"
                sh 'printenv'
                
                // sh 'python3 -m venv .venv'
                // sh 'ls -al .venv/bin'
                // sh '. .venv/bin/activate'
                sh 'pip3 install -r ./requirements.txt'
                sh 'python3 -m pytest'

            }

            
        }
        stage('run shell') {
            agent {
                label 'agent2'
            }
            steps {
    //             // Get some code from a GitHub repository
    //             checkout([$class: 'GitSCM', branches: [[name: '*/bryon']],
    // userRemoteConfigs: [[url: 'https://github.com/2206-devops-batch/BCEM-Project2.git']]])

                sh 'whoami'
            }
        }
    }
}
