pipeline {
    agent any
    environment {
        BUCKET = credentials('jenkins-aws-s3-spinnaker-demo-bucket')
    }
    stages {
        stage('Test1') {
            steps {
                parallel (
                    "Test 1A": {
                        sh './test/test1a.sh'
                    },
                    "Test 1B": {
                        sh './test/test1b.sh'
                    }
                )
            }
        }
        stage('Test2') {
            steps {
                sh './test/test2.sh'
            }
        }
        stage('Build') {
            when {
                branch 'master'
            }
            steps {
                sh './build.sh $(git rev-parse HEAD)'
                archiveArtifacts artifacts: 'build/*.deb', excludes: null
            }
        }
    }
}
