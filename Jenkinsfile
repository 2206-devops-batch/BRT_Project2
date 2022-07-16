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
                // Run pytest
                sh "python3 -m pytest test-app.py"
                
                // This only runs if pytest passes!
                // build new image
            }
        }
    }
    post { 
        failure { 
            echo 'I say failure!'
        }
        success {
            stages {
                stage {
                    agent {
                        label 'myjenkinsagent'
                    }
                    steps {
                        // This only runs if pytest passes!
                        // build new image
                        sh 'whoami'
                        sh 'pwd'
                        sh 'ls -last'
                        sh 'docker build -t bryonsmith/flaskapp-demo:v1 . < Dockerfile'
                        sh 'docker push bryonsmith/flaskapp-demo:v1'

                        sh 'echo "done! **********************************************************"'
                    } 
                }
            }
        }
    }

}
