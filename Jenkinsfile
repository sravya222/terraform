pipeline {
  agent any
  
 environment {
   % export AWS_ACCESS_KEY_ID="anaccesskey"
   % export AWS_SECRET_ACCESS_KEY="asecretkey"
   % export AWS_REGION="us-west-2"
  % terraform plan
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
        sh 'terraform validate'
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
