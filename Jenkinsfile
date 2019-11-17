pipeline {
    agent any
    tools {
        oc "oc3.11.0"
        maven "Maven 3.3.9"
    }

    stages {
        stage("Build mvn project") {
            steps {
               bat 'mvn package -Dresume=false -DskipTests=true'
             }
        }
        stage("Build container image") {
            steps {
                script {
                    bat """
                        set KUBECONFIG=C:/Users/Rylkov-AV/.kube/config
                        # oc login -u developer -p developer
                        oc login https://192.168.99.100:8443 --token=ibeg4gfZ5S8KaUmn8X-4GpOLqsu6azgxF0-5Ydf6dcI
                        oc apply -f target/tmp/resources/buildconfig.yaml
                        oc start-build demo-jenkins --follow
                     """
                }
            }
        }
    }

}
