pipeline {
    agent any 
    stages {
        stage('generate_DDL') {
            steps {
		   sh 'chmod 777 ./exp_script.sh'
        	    sh './exp_script.sh'
		   
		    
            }
        }
        stage('Import_schema_apply_scripts') {
            steps {
               echo 'hello world'
		               }
        }
        stage('Apply_to_db') {
            steps {
		    
		    echo 'hello world'
            }
        }
    }
}
