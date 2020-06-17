
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
               sh "docker images ls"
               echo "Building docker image..."
               sh "docker build -t testwar:1.0 ."
               echo "completed building docker image."
               echo "list of images after building:"
               echo "docker images ls"
               echo "Creating and running the container...."
               echo "existing containers:"
               sh " docker ps -a "
               sh "docker run --name rps_container -d -p 8181:8080 testwar:1.0"
               echo "completed creating container"
               echo "list of containers after creation:"
               sh "docker ps -a "
               
            }
         }
   }
}
