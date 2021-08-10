pipeline {
    agent any
    stages {
        stage("Terraform Init"){
            steps{
                sh label: '', script: 'terraform init'
            }
        }
        stage("Terraform Plan"){
            steps{
                sh label: '', script: 'terraform plan --auto-approve'
            }
        }
        stage("Terraform Apply"){
            steps{
                sh label: '', script: 'terraform apply --auto-approve'
            }
        }
    }
}