currentBuild.displayName = "Final_Demo # "+currentBuild.number

   def getDockerTag(){
        def tag = sh script: 'git rev-parse HEAD', returnStdout: true
        return tag
        }

pipeline {
    agent any
    environment{
     Docker_tag = getDockerTag()  
}

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven3.8"
    }
    stages {
        stage('checkout') {
            steps {
		checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/pavani1105/javawebapp.git']])    
            }
        }
        stage('build') {
            steps {
                sh 'mvn clean install -f pom.xml'
            }
        
        }
       stage('CodeQuality') {
            steps{
                      script{
                      withSonarQubeEnv('sonar') { 
                      sh "mvn sonar:sonar"
                       }
                      timeout(time: 1, unit: 'HOURS') {
                      def qg = waitForQualityGate()
                      if (qg.status != 'OK') {
                           error "Pipeline aborted due to quality gate failure: ${qg.status}"
                      }
                    }
		    sh "mvn clean install"
                  }
                }  
              }

       stage('Image build'){
              steps{
                  script{
                   sh 'docker build . -t  pavaniyadav219/javawebapp:$Docker_tag'
		   withCredentials([string(credentialsId: 'docker', variable: 'dockerpassword')]) {
				    
				  sh 'docker login -u pavaniyadav219 -p $dockerpassword'
				  sh 'docker push pavaniyadav219/javawebapp:$Docker_tag'
			}
                       }
                    }
                 }
		          
}
               
