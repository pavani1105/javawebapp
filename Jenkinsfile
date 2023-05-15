pipeline {
    agent any
	    environment{
     Docker_tag = $BUILD_NUMBER  
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
        stage('CodeQualitycheck') {
            steps{
                      script{
                      withSonarQubeEnv('SonarQube') { 
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
		   sh 'docker image prune -a --force'	  
                   sh 'docker build . -t  pavaniyadav219/javawebapp:$BUILD_NUMBER'
		   withCredentials([string(credentialsId: 'docker', variable: 'dockerpassword')]) {
				    
				  sh 'docker login -u pavaniyadav219 -p $dockerpassword'
				  sh 'docker push pavaniyadav219/javawebapp:$BUILD_NUMBER'
			}
                       }
                    }
                 }
                  stage('ansible playbook'){
			steps{
			 	script{
				    sh '''final_tag=$(echo $Docker_tag | tr -d ' ')
				     echo ${final_tag}test
				     sed -i "s/docker_tag/$final_tag/g"  deployment.yaml
				     '''
				    ansiblePlaybook become: true, installation: 'ansible', inventory: 'hosts', playbook: 'ansible.yaml'
				}
			}
		}

      }
   }
