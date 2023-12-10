pipeline {
    agent any

    stages {
        stage('Deploy to EKS') {
            agent { label 'agentEKS' }
            steps {
                dir('KUBE_MANIFEST') {
                    script {
                        withCredentials([
                            string(credentialsId: 'AWS_ACCESS_KEY', variable: 'AWS_ACCESS_KEY_ID'),
                            string(credentialsId: 'AWS_SECRET_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                        ]) {
                            sh "aws eks --region us-east-1 update-kubeconfig --name cluster01"
                            sh "kubectl apply -f deployment.yaml && kubectl apply -f service.yaml && kubectl apply -f ingress.yaml"
                        }
                    }
                }
            }
        }
    }
}

