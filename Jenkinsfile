pipeline {
    agent any

    environment {
        action = "plan" // You can override this in the Jenkins job parameters if needed
    }

    stages {
        stage('Cloning') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
                    extensions: [],
                    userRemoteConfigs: [[url: 'https://github.com/sameekshatarate/aws-jenkins-terraform-project1b.git']]
                )
            }
        }

        stage("terraform init") {
            steps {
                sh "terraform init -reconfigure"
            }
        }

        stage("plan") {
            steps {
                sh "terraform plan"
            }
        }

        stage("Action") {
            steps {
                script {
                    echo "Terraform action is --> ${action}"
                    if (action == "apply" || action == "destroy") {
                        sh "terraform ${action} --auto-approve"
                    } else {
                        sh "terraform ${action}"
                    }
                }
            }
        }
    }
}

