pipeline {
  agent any
  
 environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-credentials')
    AWS_SECRET_ACCESS_KEY = credentials('aws-credentials')
  }
    stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/sravya222/terraform.git'

      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Validate') {
      steps {
        sh 'terraform validate'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan'
      }
    }

    stage('Terraform Apply') {
      steps {
        input "Approve Terraform Apply?"
        sh 'terraform apply -auto-approve'
      }
    }
  }
}
