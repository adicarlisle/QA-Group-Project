pipeline {
    agent any
    stages {
        stage("Terraform Dependencies and Install"){
            steps{
                sh label: '', script: 'sudo apt update -y && sudo apt upgrade -y'
                sh label: '', script: 'sudo apt install -y unzip wget'
                sh label: '', script: 'wget https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip'
                sh label: '', script: 'unzip terraform_*_linux_*.zip'
                sh label: '', script: 'sudo mv terraform /usr/local/bin'
                sh label: '', script: 'rm terraform_*_linux_*.zip'

            }
        }

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