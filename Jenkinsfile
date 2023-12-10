pipeline {
    agent any

    environment {
        AWS_EKS_CLUSTER_NAME = 'cluster01'
        AWS_EKS_REGION = 'us-east-1'
        KUBE_MANIFESTS_DIR = '/home/ubuntu/Final4Deployment/KUBE_MANIFEST'
    }

    stages {
        stage('Deploy to EKS') {
            agent { label 'agentEKS' }
            steps {
                dir("${env.KUBE_MANIFESTS_DIR}") {
                    script {
                        withCredentials([
                            string(credentialsId: 'AWS_ACCESS_KEY', variable: 'AWS_ACCESS_KEY_ID'),
                            string(credentialsId: 'AWS_SECRET_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                        ]) {
                            sh "kubectl apply -f deployment.yaml && kubectl apply -f service.yaml && kubectl apply -f ingress.yaml"
                        }
                    }
                }
            }
        }
    }
}

