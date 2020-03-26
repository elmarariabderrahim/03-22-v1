pipeline {
    agent any 
	environment {
    		PATH = "C:\\Program Files\\Git\\usr\\bin;C:\\Program Files\\Git\\bin;${env.PATH}"
		 }
    stages {
        stage('enregitrement_des_scipts') {
            steps {
        	    bat 'sh -c ./script_save.sh'
		   
		    
            }
        }
       
    }
	 
}
