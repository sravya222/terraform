pipeline {
  agent any
  
 environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        AWS_DEFAULT_REGION    = 'us-east-1'
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

        stage('Terraform Plan') {
      steps {
        sh 'terraform plan -out=tfplan'
      }
    }

    stage('Terraform Apply') {
      steps {
        // Auto-apply without asking for input
        sh 'terraform apply -auto-approve'
      }
    }
  }
}
