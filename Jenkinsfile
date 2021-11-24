pipeline {
   agent { dockerfile true }
   options {
        skipStagesAfterUnstable()
    }

   stages {
        stage('Build') {
            steps {
                echo 'Building...'
                echo "Running ${env.BUILD_ID} ${env.BUILD_DISPLAY_NAME} on ${env.NODE_NAME} and JOB ${env.JOB_NAME}"
                git url: https://github.com/rishi154/helloworld
                def testImage = docker.build("test-image", "./dockerfiles/build/Dockerfile")
            }
        }
        stage('Test') {
            steps {
                echo 'Testing all unit tests...'
                testImage.inside {
                    sh 'mvn test'
                }
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh './jenkins/scripts/deploy.sh'
            }
        }
  }
}