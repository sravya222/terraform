pipeline {
  agent any
  
 environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        AWS_DEFAULT_REGION    = 'us-west-2'
     }
    stages {
    stage('Checkout') {
      steps {
       git url: 'https://github.com/sravya222/terraform.git', branch: 'main'

      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Validate') {
      steps {
                sh(script: 'terraform validate', returnStdout: true)

      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -out= tfplan'
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
