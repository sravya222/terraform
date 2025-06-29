pipeline {
  agent any

  parameters {
    string(name: 'AWS_REGION', defaultValue: 'us-east-1', description: 'AWS Region')
    choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Terraform Action to perform')
  }

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    AWS_DEFAULT_REGION    = "${params.AWS_REGION}"
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

    stage('Terraform Action') {
      steps {
        script {
          if (params.ACTION == 'apply') {
            sh 'terraform apply -auto-approve'
          } else if (params.ACTION == 'destroy') {
            sh 'terraform destroy -auto-approve'
          }
        }
      }
    }
  }
}
