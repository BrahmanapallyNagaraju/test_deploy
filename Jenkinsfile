
def download(warfile) {
     rtDownload (
    serverId: 'epam_artifactory',
    spec: '''{
          "files": [
            {
              "pattern": "EPM-ESS/release/${warfile}",
              "target": "${WORKSPACE}/"
            }
          ]
    }'''
)
}


pipeline {
   agent any

   stages {
      stage('Hello') {
         steps {
            echo 'Hello World'
            echo "param: ${war_file}"
            echo "param: ${params.war_file}"
            
         }
      }
      stage('download from artifactory') {
         steps {
               echo "downloading war file from artifactory...."
              download(war_file)
               echo "completed downloading."
         }
      }
      stage('deploy with container') {
         steps {
            script {
               echo "list of available docker images:"
               sh "docker image ls"
               echo "Building docker image..."
                 sh "docker build -t testwar:${BUILD_NUMBER}.0 ."
               echo "completed building docker image."
               echo "list of images after building:"
               echo "docker image ls"
               echo "Creating and running the container...."
               echo "existing containers:"
               sh " docker ps -a "
               sh "docker volume create rps_${BUILD_NUMBER}"
               sh "docker run --name rps_container1 -v rps_${BUILD_NUMBER}:/usr/local/tomcat -d -p 8585:8080 testwar:${BUILD_NUMBER}.0"
               echo "completed creating container"
               echo "list of containers after creation:"
               sh "docker ps -a "
               
            }
         }
   }
}
}
