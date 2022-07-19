pipeline {
    agent none
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhublogin')
	}

    stages {
        stage('AMI_Agent') {
            agent {
                label 'jenkins-agent'
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
                // build new image if pytest passes.
                sh '. ./dockerpush.sh'
            }
        }
    //     stage('Jenkins') {
    //         agent any
    //         environment {
    //             VERSION = sh(returnStdout:true,script:'git log -1 --pretty=format:"%H"').trim() 
    //         }
    //         steps {
    //             sh 'whoami'
    //             sh 'pwd'
    //             sh 'which kubectl'
    //             sh ''
    //             // sh "kubectl set image 'deployment/flask-deployment' flaskimage=bryonsmith/flaskapp-demo:beb44ea4d9b16040fa774bfce0acf65fadd6e0dd"
    //             sh "kubectl set image 'deployment/flask-deployment' flaskimage=bryonsmith/flaskapp-demo:$VERSION"
    //         }
    //     }
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
